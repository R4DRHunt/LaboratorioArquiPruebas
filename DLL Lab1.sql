USE [persona_db]
GO
/****** Object:  Table [dbo].[estudios]    Script Date: 4/24/2023 4:35:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudios](
	[id_prof] [int] NULL,
	[cc_per] [int] NULL,
	[fecha] [date] NULL,
	[univer] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 4/24/2023 4:35:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[cc] [int] NOT NULL,
	[nombre] [varchar](45) NULL,
	[apellido] [varchar](45) NULL,
	[genero] [varchar](45) NULL,
	[edad] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[cc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profesion]    Script Date: 4/24/2023 4:35:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesion](
	[id] [int] NOT NULL,
	[nom] [varchar](60) NULL,
	[des] [text] NULL,
 CONSTRAINT [PK_profesion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefono]    Script Date: 4/24/2023 4:35:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefono](
	[num] [varchar](15) NOT NULL,
	[oper] [varchar](45) NULL,
	[duenio] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[estudios]  WITH CHECK ADD  CONSTRAINT [FK_estudios_persona] FOREIGN KEY([cc_per])
REFERENCES [dbo].[persona] ([cc])
GO
ALTER TABLE [dbo].[estudios] CHECK CONSTRAINT [FK_estudios_persona]
GO
ALTER TABLE [dbo].[estudios]  WITH CHECK ADD  CONSTRAINT [FK_estudios_profesion] FOREIGN KEY([id_prof])
REFERENCES [dbo].[profesion] ([id])
GO
ALTER TABLE [dbo].[estudios] CHECK CONSTRAINT [FK_estudios_profesion]
GO
ALTER TABLE [dbo].[telefono]  WITH CHECK ADD  CONSTRAINT [FK_telefono_persona] FOREIGN KEY([duenio])
REFERENCES [dbo].[persona] ([cc])
GO
ALTER TABLE [dbo].[telefono] CHECK CONSTRAINT [FK_telefono_persona]
GO
