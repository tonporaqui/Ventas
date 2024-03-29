/****** Object:  ForeignKey [FK_articulo_categoria]    Script Date: 08/25/2014 11:52:43 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_articulo_categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[articulo]'))
ALTER TABLE [dbo].[articulo] DROP CONSTRAINT [FK_articulo_categoria]
GO
/****** Object:  ForeignKey [FK_detalle_boleta]    Script Date: 08/25/2014 11:52:43 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_boleta]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle]'))
ALTER TABLE [dbo].[detalle] DROP CONSTRAINT [FK_detalle_boleta]
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 08/25/2014 11:52:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[articulo]') AND type in (N'U'))
DROP TABLE [dbo].[articulo]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 08/25/2014 11:52:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detalle]') AND type in (N'U'))
DROP TABLE [dbo].[detalle]
GO
/****** Object:  Table [dbo].[boleta]    Script Date: 08/25/2014 11:52:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[boleta]') AND type in (N'U'))
DROP TABLE [dbo].[boleta]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 08/25/2014 11:52:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[categoria]') AND type in (N'U'))
DROP TABLE [dbo].[categoria]
GO
/****** Object:  Default [DF_articulo_estado]    Script Date: 08/25/2014 11:52:43 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_articulo_estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[articulo]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_articulo_estado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[articulo] DROP CONSTRAINT [DF_articulo_estado]
END


End
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 08/25/2014 11:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[categoria]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[categoria](
	[id_cat] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[id_cat] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[categoria] ON
INSERT [dbo].[categoria] ([id_cat], [nombre]) VALUES (1, N'Linea Blanca')
INSERT [dbo].[categoria] ([id_cat], [nombre]) VALUES (2, N'Electronica')
INSERT [dbo].[categoria] ([id_cat], [nombre]) VALUES (3, N'Computacion')
INSERT [dbo].[categoria] ([id_cat], [nombre]) VALUES (4, N'Deportes')
INSERT [dbo].[categoria] ([id_cat], [nombre]) VALUES (5, N'Vestuarios')
SET IDENTITY_INSERT [dbo].[categoria] OFF
/****** Object:  Table [dbo].[boleta]    Script Date: 08/25/2014 11:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[boleta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[boleta](
	[id_bol] [int] IDENTITY(1,1) NOT NULL,
	[fecha_bol] [date] NULL,
 CONSTRAINT [PK_boleta] PRIMARY KEY CLUSTERED 
(
	[id_bol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 08/25/2014 11:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[detalle](
	[id_det] [int] IDENTITY(1,1) NOT NULL,
	[id_bol] [int] NULL,
	[id_art] [int] NOT NULL,
	[cantidad] [int] NULL,
	[precio_v] [bigint] NULL,
 CONSTRAINT [PK_detalle] PRIMARY KEY CLUSTERED 
(
	[id_det] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 08/25/2014 11:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[articulo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[articulo](
	[id_art] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[unidad] [int] NULL,
	[precio] [int] NULL,
	[id_cat] [int] NULL,
	[estado] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_articulo] PRIMARY KEY CLUSTERED 
(
	[id_art] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[articulo] ON
INSERT [dbo].[articulo] ([id_art], [descripcion], [unidad], [precio], [id_cat], [estado]) VALUES (1, N'Refrigerador no Frost 2 puertas', 10, 190000, 1, N'alta')
INSERT [dbo].[articulo] ([id_art], [descripcion], [unidad], [precio], [id_cat], [estado]) VALUES (2, N'Lavadora Frontal 15 Kg', 15, 210000, 1, N'alta')
INSERT [dbo].[articulo] ([id_art], [descripcion], [unidad], [precio], [id_cat], [estado]) VALUES (3, N'TV Led 32 pulgada', 25, 239000, 2, N'alta')
INSERT [dbo].[articulo] ([id_art], [descripcion], [unidad], [precio], [id_cat], [estado]) VALUES (4, N'NoteBook Dell', 10, 230000, 3, N'alta')
INSERT [dbo].[articulo] ([id_art], [descripcion], [unidad], [precio], [id_cat], [estado]) VALUES (5, N'NoteBook Sony', 10, 182000, 3, N'alta')
INSERT [dbo].[articulo] ([id_art], [descripcion], [unidad], [precio], [id_cat], [estado]) VALUES (6, N'Bicleta Aro 20 hombre', 15, 85000, 4, N'alta')
INSERT [dbo].[articulo] ([id_art], [descripcion], [unidad], [precio], [id_cat], [estado]) VALUES (7, N'Bicleta Aro 26 Mujer', 15, 68000, 4, N'alta')
INSERT [dbo].[articulo] ([id_art], [descripcion], [unidad], [precio], [id_cat], [estado]) VALUES (8, N'Polera Run nike', 25, 9900, 5, N'alta')
INSERT [dbo].[articulo] ([id_art], [descripcion], [unidad], [precio], [id_cat], [estado]) VALUES (9, N'Polera Futbol Nike', 25, 12500, 5, N'alta')
SET IDENTITY_INSERT [dbo].[articulo] OFF
/****** Object:  Default [DF_articulo_estado]    Script Date: 08/25/2014 11:52:43 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_articulo_estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[articulo]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_articulo_estado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[articulo] ADD  CONSTRAINT [DF_articulo_estado]  DEFAULT ('alta') FOR [estado]
END


End
GO
/****** Object:  ForeignKey [FK_articulo_categoria]    Script Date: 08/25/2014 11:52:43 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_articulo_categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[articulo]'))
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_categoria] FOREIGN KEY([id_cat])
REFERENCES [dbo].[categoria] ([id_cat])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_articulo_categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[articulo]'))
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_categoria]
GO
/****** Object:  ForeignKey [FK_detalle_boleta]    Script Date: 08/25/2014 11:52:43 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_boleta]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle]'))
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [FK_detalle_boleta] FOREIGN KEY([id_bol])
REFERENCES [dbo].[boleta] ([id_bol])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_boleta]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle]'))
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [FK_detalle_boleta]
GO
