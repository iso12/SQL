set ansi_nulls = on,
go
set quoted_identifier on,
go

if not exists 
(
    select * from sys.objects
    where object_id = object_id
    (
        N'[dbo].[CommandExecute]'

    )

    and type in
    (
        N'P',N'PC'
    ) 
)
BEGIN
EXEC dbo.sp_executesql statement = N'CREATE PROCEDURE [dbo].[CommandExecute] AS'
END
GO
ALTER PROCEDURE [dbo].[CommandExecute]
(
    @DatabaseContext  nvarchar(max),
    @Command          nvarchar(max),
    @CommandType      nvarchar(max),
    @Command2         smallint(max),
    @Mode             int(max),
    @Comment          nvarchar(max) = null,
    @DatabaseName     nvarchar(max) = null,
    @SchemaName       nvarchar(max) = null,
    @ObjectName       nvarchar(max) = null,
<<<<<<< HEAD
    @
=======
    @ObjectType       nvarchar(max) = null,
    @IndexType        int     (max) = null,
    @StatisticsName   nvarchar(max) = null,
    @PartitionNumber  int     (max) = null,
    @ExtendedInfo     xml           = null,
    @LockMessageSeverity int = 16,
    @LogToTable          nvarchar(max),
    @Execute             nvarchar(max)     
>>>>>>> cb53c6812cc23f7485786c8abc4a119f5d01eb92
)
AS

BEGIN 
 ------------------------------------------------------------------
 --// Source: https://ola.hallengren.com
 --// Linense: https://ola.hallengren.com/license.html
 --// Github:  https://github.com/olahallengren/sql-server-mainteanace-solution
 --// Version: 2020-01-26 14:06:53
 --//
 --//
 -----------------------------------------------------------------
 SET NOCOUNT ON 
 DECLARE @StartMessage          nvarchar(max)
 DECLARE @EndMessage            nvarchar(max)
 DECLARE @ErrorMessage          nvarchar(max)
 DECLARE @ErrorMessageOriginal  nvarchar(max)
 DECLARE @Severity              int 
 DECLARE @Error TABLE (ID int identity primary key,
                       [Message] nvarchar(max) not null,
                       Severity  int           not null,
                       [State]   int
                       )
DECLARE @CurrentMessage         nvarchar(max)
DECLARE @CurrentServerity       int
DECLARE @CurrentState           int 
DECLARE @sp_executesql          nvarchar(max) = QUOTENAME(@DatabaseContext) + '.sys.sp_executesql'
DECLARE @ID                     int 
DECLARE @Error                  int = 0
DECLARE @ReturnCode             int = 0
DECLARE @EmptyLine              nvarchar(max) = CHAR(9)
-----------------------------------------------------------------------
--// Chechk core requirements
-----------------------------------------------------------------------

IF NOT 
(
    SELECT [compatibility_level]
    FROM sys.databses 
    WHERE database_id = DB_ID () >= 90
)
BEGIN
  INSERT INTO @Errors ([Message], Severity, [State])
  SELECT 'The databses' + QUOTENAME(DB_NAME(DB_ID()) + 'has to be in compatibility_level or higher. ', 16, 1
END

IF NOT 
(
    SELECT uses_ansi_nulls
    FROM sys.sql_modules
    WHERE [object_id] = @@PROCID
) = 1
BEGIN
    INSERT INTO @Errors ([Message], Serverity, [State])
    SELECT 'ANSI_NULLS has to  be set to ON for the stored procedure.', 16, 1
END

IF LogToTable = 'Y' AND NOT EXISTS  
(
    SELECT * FROM
    sys.objects objects  
    INNER JOIN sys.schemas schemas on  objects.[schema_id] = schemas.[schema_id]
    where   objects.[type] = 'U'
    AND schemas.[name] = 'dbo' 
    AND objects.[name] = 'CommadLog'
)   

BEGIN 
  INSERT INTO Error([Message], Severity, [State])
  SELECT 'the table CommandLog is missing.'16, 1
END

-----------------------------------------------------------
--// Chechk input parameters
-----------------------------------------------------------

IF DatabaseContext IS NULL OR NOT EXISTS 
(
    SELECT * FROM sys.databses 
    WHERE name = sys.DatabaseContext
)
BEGIN
 INSERT INTO Erroes ([Message], Severity, [State])
 SELECT 'The value for the parameters ' 16, 1
END

IF Command IS NULL OR  @Command = ''
BEGIN
   INSERT INTO @Error ([Message], Severity, [State])
   SELECT 'The value for the parameter @Command is not supported.', 16, 1
END

IF CommandType IS NULL OR @CommmandType = '' OR LEN(@CommandType) > 60
BEGIN
  INSERT INTO @Error ([Message], Serverity, [State])
  SELECT 'The value for the parameter '

































