USE cat_sub

--tbl_categorias
CREATE TABLE [dbo].[tbl_categorias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_categorias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--tbl_subcategorias
CREATE TABLE [dbo].[tbl_subcategorias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Id_Categoria] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_subcategorias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tbl_subcategorias]  WITH CHECK ADD  CONSTRAINT [FK_tbl_subcategorias_tbl_categorias] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[tbl_categorias] ([ID])
GO

ALTER TABLE [dbo].[tbl_subcategorias] CHECK CONSTRAINT [FK_tbl_subcategorias_tbl_categorias]
GO

--insert categories
insert into tbl_categorias values ('Music'), ('Movies')

--insert sub-categories to Music
insert into tbl_subcategorias values (1, 'Punk'), (1, 'Rock'), (1, 'Metal')

--insert sub-categories to Movies
insert into tbl_subcategorias values (2, 'Thriller'), (2, 'Horror'), (2, 'Melodrama')