USE [master]
GO
/****** Object:  Database [GeoDB]    Script Date: 3/10/2020 6:51:37 PM ******/
CREATE DATABASE [GeoDB]
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GeoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GeoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GeoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GeoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GeoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GeoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GeoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GeoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GeoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GeoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GeoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GeoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GeoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GeoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GeoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GeoDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GeoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GeoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GeoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GeoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GeoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GeoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GeoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GeoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [GeoDB] SET  MULTI_USER 
GO
ALTER DATABASE [GeoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GeoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GeoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GeoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GeoDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GeoDB', N'ON'
GO
ALTER DATABASE [GeoDB] SET QUERY_STORE = OFF
GO
USE [GeoDB]
GO
/****** Object:  Table [dbo].[Geo]    Script Date: 3/10/2020 6:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Geo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeoType]    Script Date: 3/10/2020 6:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeoType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GeoType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Geo] ON 
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (1, 1, NULL, N'Ukraine')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (2, 2, 1, N'Kharkivska Obl')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (3, 2, 1, N'Poltavska Obl')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (4, 3, 2, N'Dergachi')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (5, 3, 2, N'Kharkiv')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (6, 4, 5, N'Ivanova kh')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (7, 4, 5, N'1 kh')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (8, 4, 5, N'2 kh')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (9, 4, 5, N'3 kh')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (10, 4, 5, N'4 kh')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (11, 4, 5, N'5 kh')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (12, 4, 4, N'1 d')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (13, 4, 4, N'2 d')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (14, 4, 4, N'3 d')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (15, 4, 4, N'4 d')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (16, 4, 4, N'5 d')
GO
INSERT [dbo].[Geo] ([Id], [TypeId], [ParentId], [Name]) VALUES (17, 4, 4, N'6 d')
GO
SET IDENTITY_INSERT [dbo].[Geo] OFF
GO
SET IDENTITY_INSERT [dbo].[GeoType] ON 
GO
INSERT [dbo].[GeoType] ([Id], [Name]) VALUES (1, N'Country')
GO
INSERT [dbo].[GeoType] ([Id], [Name]) VALUES (2, N'State')
GO
INSERT [dbo].[GeoType] ([Id], [Name]) VALUES (3, N'City')
GO
INSERT [dbo].[GeoType] ([Id], [Name]) VALUES (4, N'Street')
GO
SET IDENTITY_INSERT [dbo].[GeoType] OFF
GO
ALTER TABLE [dbo].[Geo]  WITH CHECK ADD  CONSTRAINT [FK_Geo_Geo] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Geo] ([Id])
GO
ALTER TABLE [dbo].[Geo] CHECK CONSTRAINT [FK_Geo_Geo]
GO
ALTER TABLE [dbo].[Geo]  WITH CHECK ADD  CONSTRAINT [FK_Geo_GeoType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[GeoType] ([Id])
GO
ALTER TABLE [dbo].[Geo] CHECK CONSTRAINT [FK_Geo_GeoType]
GO
USE [master]
GO
ALTER DATABASE [GeoDB] SET  READ_WRITE 
GO

USE GeoDB

Go

SELECT * FROM Geo
WHERE Id IN 
(SELECT ParentId FROM Geo
WHERE Id in (SELECT ParentId FROM Geo WHERE TypeId=4 ))

  Go

--Найти область по улице
 WITH TestCTE
   AS
   (    
        --Находим якорь рекурсии
        SELECT Id,TypeId,ParentId,Name
        FROM Geo WHERE Id=17
        UNION ALL
        --Делаем объединение с TestCTE (хотя мы его еще не дописали)
        SELECT g1.Id,g1.TypeId,g1.ParentId,g1.Name
        FROM Geo g1 
        JOIN TestCTE t2 ON g1.Id=t2.ParentId
   )
   SELECT DISTINCT(TCTE.id), TCTE.name, TCTE.TypeId,TCTE.ParentId  FROM TestCTE as TCTE
   WHERE TCTE.TypeId=2

     Go

   --Найти кол-во улиц по штату
   WITH TestCTE
   AS
   (    
        --Находим якорь рекурсии
        SELECT Id,TypeId,ParentId,Name
        FROM Geo WHERE TypeId=3
        UNION ALL
        --Делаем объединение с TestCTE (хотя мы его еще не дописали)
        SELECT g1.Id,g1.TypeId,g1.ParentId,g1.Name
        FROM Geo g1 
        JOIN TestCTE t2 ON g1.ParentId=t2.Id
   )
   SELECT COUNT(TCTE.id) FROM TestCTE as TCTE
   WHERE TCTE.TypeId=4

     Go

   --Найти по штату улицы
      WITH TestCTE
   AS
   (    
        --Находим якорь рекурсии
        SELECT Id,TypeId,ParentId,Name
        FROM Geo WHERE Id=2
        UNION ALL
        --Делаем объединение с TestCTE (хотя мы его еще не дописали)
        SELECT g1.Id,g1.TypeId,g1.ParentId,g1.Name
        FROM Geo g1 
        JOIN TestCTE t2 ON g1.ParentId=t2.Id
   )
   SELECT TCTE.Name,TCTE.ParentId FROM TestCTE as TCTE
   WHERE TCTE.TypeId=4

     Go


--Найти кол-во улиц по каждому городу
   with TestCTE  as 
  (
    Select r1.* from Geo r1 where r1.TypeId = 4
    union all
    Select r2.* from Geo r2 join TestCTE as t1 on r2.Id = t1.ParentId
)
  Select Count(TestCTE.Id), TestCTE.Name from TestCTE where TestCTE.TypeId = 3
  group by TestCTE.Name
   
   