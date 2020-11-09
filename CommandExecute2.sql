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
    @
)




