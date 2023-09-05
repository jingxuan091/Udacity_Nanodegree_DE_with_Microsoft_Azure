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

IF OBJECT_ID('dbo.dimDate') IS NOT NULL
BEGIN 
  DROP EXTERNAL TABLE[dbo].[dimDate];
END

CREATE EXTERNAL TABLE [dbo].[dimDate]
WITH (
    LOCATION = 'dim_date',
    DATA_SOURCE = [jzfile_jz091_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
AS 
SELECT DISTINCT
    CAST(FORMAT(date, 'yyyyMMdd') AS INT) AS date_key,
    date AS [date],
    YEAR(date) AS [year],
    DATEPART(QUARTER, date) AS quarter,
    MONTH(date) AS [month],
    DAY(date) AS [day],
    DATEPART(WEEK, date) AS [week],
    CASE WHEN DATEPART(WEEKDAY, date) IN (6, 7) THEN 1 ELSE 0 END AS is_weekend
FROM [dbo].[staging_payment];
