USE [master] -- specify th database in wich the object will be create
set nocount on 
declare  @CreateJobs           nvarchar(max) = 'Y'
declare  @BackupDirectory      nvarchar(max) = null,
declare  @CleanupTime          int  = null,
declare  @OutputFileDirectory  nvarchar(max) = null,
declare  @LogToTable           nvarchar(max) = 'Y'
declare  @ErrorMessage         nvarchar(max) 

if IS_SRVROLEMEMBER('sysadmin') = 0 AND NOT (DB_ID('rdsadmin') is not null and SUSER_SNAME(0x01) = 'rdsa')
begin 
   set @ErrorMessage = 'You need to be a member of the sysadmin server role to install the'
   raiserror(@ErrorMessage,16,1) WITH NOWAIT
end 

if not (select [compatiblity_level] from sys.database where database_id = DB_ID()) >= 90
BEGIN 
   SET ErrorMessage = 'database' + + QUOTENAME(DB_NAME(DB_ID())) + ' has to be in compatibility level 90 or higher.'
  RAISERROR(@ErrorMessage,16,1) WITH NOWAIT
END

IF OBJECT_ID('tempdb..#Config') is not null drop table #Config
create table #Config
(
     [Name] nvarchar(max),
     [Value] nvarchar(max)
)

insert into #Config ([Name], [Value]) values ('CreateJobs', @CreateJobs)
insert into #Config ([Name], [Value]) values ('BackupDirectory', @BackupDirectory)
insert into #Config ([Name], [Value]) values ('CleanupTime', @CleanupTime)
insert into #Config ([Name], [Value]) values ('OutputFileDirectory', @OutputFileDirectory)
insert into #Config ([Name], [Value]) values ('LogToTable', @LogToTable)
insert into  #Config ([Name], [Value]) VALUES('DatabaseName', DB_NAME(DB_ID()))
GO

set ansi_nulls on
GO
set quoted_identifier on
GO
if not exists 
(
	select * from sys.objects 
	where OBJECT_ID('N[dbo].[CommandLog]') 
	and type in (N'U')
)
BEGIN 
create table [dbo].[CommandLog]
(
	[ID] [int] 
)
