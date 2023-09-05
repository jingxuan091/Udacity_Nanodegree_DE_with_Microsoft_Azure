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

IF OBJECT_ID('dbo.dimStation') IS NOT NULL
BEGIN 
  DROP EXTERNAL TABLE[dbo].[dimStation];
END

CREATE EXTERNAL TABLE [dbo].[dimStation]
WITH (
    LOCATION = 'dim_station',
    DATA_SOURCE = [jzfile_jz091_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
AS 
SELECT
    station_id AS station_key,
    name AS station_name,
    latitude,
    longitude
FROM dbo.staging_station