SET ANSI_NULLS ON
GO
SET QOUTED_IDENTIFIER ON
GO
IF NOT EXISTS 
(
	SELECT * FROM sys.object 
	WHERE object_id = ONJECT_ID(N '[dbo].[CommandExecute]')
	AND type IN  (N 'P', N'PC')

)
BEGIN 
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CommandExecute]'
END
GO
ALTER PROCEDURE [dbo].[CommandExecute]
(
	@DatanaseContext     NVARCHAR(MAX),
	@Command             NVARCHAR(MAX),
	@CommandType         NVARCHAR(MAX),
	@Mode                INT     (MAX),
	@Comment             NVARCHAR(MAX),
	@DatabaseName        nvarchar(max) = NULL,
    @SchemaName          nvarchar(max) = NULL,
    @ObjectName          nvarchar(max) = NULL,
    @ObjectType          nvarchar(max) = NULL,
    @IndexName           nvarchar(max) = NULL,
    @IndexType           int           = NULL,
    @StatisticsName      nvarchar(max) = NULL,
    @PartitionNumber     int           = NULL,
    @ExtendedInfo        xml           = NULL,
    @LockMessageSeverity int = 16,
    @LogToTable          nvarchar(max),
    @Execute             nvarchar(max)

)