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
   SET ErrorMessage = 'database' + 