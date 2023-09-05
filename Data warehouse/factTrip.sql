IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
    CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
    WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
           FORMAT_OPTIONS (
             FIELD_TERMINATOR = ',',
             FIRST_ROW = 2,
             USE_TYPE_DEFAULT = FALSE
            ))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'jzfile_jz091_dfs_core_windows_net') 
    CREATE EXTERNAL DATA SOURCE [jzfile_jz091_dfs_core_windows_net] 
    WITH (
        LOCATION = 'abfss://jzfile@jz091.dfs.core.windows.net' 
    )
GO

IF OBJECT_ID('dbo.factTrip') IS NOT NULL
BEGIN 
  DROP EXTERNAL TABLE[dbo].[factTrip];
END

CREATE EXTERNAL TABLE [dbo].[factTrip]
WITH (
    LOCATION = 'fact_trip',
    DATA_SOURCE = [jzfile_jz091_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
AS 

SELECT t.trip_id AS trip_key,
       t.rider_id AS rider_key,
       CAST(FORMAT(p.date, 'yyyyMMdd') AS INT) AS date_key,
       start_station.station_id AS start_station_key,
       end_station.station_id AS end_station_key,
       DATEDIFF(minute, t.start_at, t.ended_at) AS trip_duration,
       (DATEDIFF(year, r.birthday, CONVERT(DATETIME, CONVERT(DATE, t.start_at))) - 
        (CASE WHEN MONTH(r.birthday) > MONTH(CONVERT(DATETIME, CONVERT(DATE, t.start_at)))
              OR (MONTH(r.birthday) = MONTH(CONVERT(DATETIME, CONVERT(DATE, t.start_at)))
                  AND DAY(r.birthday) > DAY(CONVERT(DATETIME, CONVERT(DATE, t.start_at))))
              THEN 1
              ELSE 0
         END)) AS rider_age
FROM dbo.staging_trip t
JOIN dbo.staging_rider r ON r.rider_id = t.rider_id
JOIN dbo.staging_payment p ON t.rider_id = p.rider_id
LEFT JOIN dbo.staging_station start_station ON t.start_station_id = start_station.station_id
LEFT JOIN dbo.staging_station end_station ON t.end_station_id = end_station.station_id;

