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


<<<<<<< HEAD


=======
>>>>>>> cb53c6812cc23f7485786c8abc4a119f5d01eb92
