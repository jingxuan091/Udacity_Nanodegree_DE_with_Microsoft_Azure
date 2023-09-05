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

IF OBJECT_ID('dbo.dimRider') IS NOT NULL
BEGIN 
  DROP EXTERNAL TABLE[dbo].[dimRider];
END

CREATE EXTERNAL TABLE [dbo].[dimRider]
WITH (
    LOCATION = 'dim_rider',
    DATA_SOURCE = [jzfile_jz091_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
AS 
SELECT [rider_id] AS [rider_key],
       [first],
       [last],
       [address],
       [account_start_date],
       [account_end_date],
       [is_member]
FROM [dbo].[staging_rider]
