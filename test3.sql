use database

SET ANSI_NULLS ON
GO
CREATE TABLE [dbo].[backup_media_set]
(
	[mediaset_id]           [int]  identity(1,1) not null,
	[media_uuid]            [uniqueidentifier]   null,
	[media_family_count]    [tinyint]            null,
	[name]                  [nvarchar](128)      null,
	[description]           [nvarchar](255)      null,
	[software_name]         [nvarchar](128)      null,
	[software_vendor_id]    [int]                null,
	[mtf_major_version]     [tinyint]            null,
	[mirror_count]          [tinyint]            null,
	[is_password_protected] [bit]                null,
	[is_compressed]         [bit]                null,
	[is_encrypted]          [bit]                null

)
ON [primary]
GO
ALTER TABLE [dbo].[backup_media_set] ADD PRIMARY KEY CLUSTERED
(
	[mediaset_id] ASC
)
WITH
(
	pad_index = off,
	statistics_norecompute = off,
	sort_in_tempdb = off
	ignore_dup_key = off,
	online = off,
	allow_row_locks = on,
	allow_page_locks = on
)
on [primary]
GO
create nonclustered index [backup_media_setuuid] on [dbo].[backup_media_set]
(
		[mediaset_id] ASC
)

WITH
(
     pad_index = off,
     statistics_norecompute = off,
     sort_in_tempdb = off,
     online = off,
     allow_page_locks = on,
     allow_row_locks = on
)
on [primary]
GO

