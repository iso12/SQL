/*
  
  Author: Permitin Y.A. (ypermitin@yandex.ru)
  Create date: 2020-03-11
  Description: 	Таблица для хранения настроек сжатия для объектов баз данных

*/
create tavle [dbo].[Compression]

create table [dbo].[compressionSettingsMaintenance]
	(
		[ID]              [int] identyty,
		[DatabaseName]    [nvarchar](100) not null,
		[TableName]       [nvarchar](100) not null,
		[IndexName]       [nvarchar(100)  not null,
		[CompressionType] [int]           not null,
		[IsActive]        [int]           not null,
		constraint [PK_CompressionSettingsMaintenance] PRIMARY KEY NONCLUSTERED [(ID)]

	)
	ON [PRIMARY]
	GO

	CREATE UNIQUE CLUSTERED INDEX [CompressionSEttingsMainteanaceByDims]
	ON [dbo].[CompressionSettingsMaintenance] 
	(
		[DatabaseName],
	    [TableName],
	    [INdexName],
	    [Compression]
	)
	ON PRIMARY
	GO

	Alter table [dbo].[CompressionSettingsMaintenance] ADD constraint [FK_CompressionSettingsMaintenance_To_CompressionType] 
	FOREIGN KEY ([CompressionType]) 
	REFERENCES  [dbo].[CompressionType] ([ID])

	GO
	