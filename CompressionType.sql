create table [dbo].[CompressionTpye]
	(
		[ID]   [int]           not null,
		[Name] [nvarchar](150) not null,
		constraint [PK_CompressionType] primary key clustered ([ID])


	)
	on [primary]
	go

	insert [dbo].[CompressionTpye] ([ID], [Name]) values (1, N'None')
		go
	insert [dbo].[CompressionTpye] ([ID], [Name]) values (2, N'Row')