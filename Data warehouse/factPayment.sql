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

IF OBJECT_ID('dbo.factPayment') IS NOT NULL
BEGIN 
  DROP EXTERNAL TABLE[dbo].[factPayment];
END

CREATE EXTERNAL TABLE [dbo].[factPayment]
WITH (
    LOCATION = 'fact_payment',
    DATA_SOURCE = [jzfile_jz091_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
AS 

SELECT payment_id AS payment_key,
       CAST(FORMAT(date, 'yyyyMMdd') AS INT) AS date_key,
       rider_id AS rider_key,
       amount
FROM dbo.staging_payment
