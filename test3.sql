use database

set ansi_nulls on
go
set quoted_identifier on
go

create table [dbo].[uran]
(
	 [barcode]  [int]  identity(1,1) primary key not null,
	 [name]     [nvarchar](100)      null,
	 [lastname] [nvarchar](200)      null,
	 [phone]    [int]                null,
	 [gmail]    [bigint]             null,
	 [email]    [bigint]             null,
	 [address]  [int]                null,
	 [bankt]    [money]              null
)
on [primary]
go
alter table [dbo].[uran] add primary key clustered
( 
	 [name] asc
)
with
(
	pad_index = off,
	statistics_norecompute = off,
	online = off,
	ignore_dup_key = off,
	sort_in_tempdb = off,
	allow_row_locks  = on,
	allow_page_locks = on
)
on [primary]
go
create nonclustered index [uranname] on [dbo].[urna]
(
	[address] asc
)
with
(
	pad_index = off,
	statistics_norecompute = off,
	sort_in_tempdb = off,
	ignore_dup_key = off,
	online  = off,
	allow_row_locks = on,
	allow_page_locks = on

)
on [primary]
go

