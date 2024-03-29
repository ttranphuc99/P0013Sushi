USE [master]
GO
/****** Object:  Database [P0013Sushi]    Script Date: 9/29/2019 10:10:24 AM ******/
CREATE DATABASE [P0013Sushi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'P0013Sushi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\P0013Sushi.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'P0013Sushi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\P0013Sushi_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [P0013Sushi] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [P0013Sushi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [P0013Sushi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [P0013Sushi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [P0013Sushi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [P0013Sushi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [P0013Sushi] SET ARITHABORT OFF 
GO
ALTER DATABASE [P0013Sushi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [P0013Sushi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [P0013Sushi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [P0013Sushi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [P0013Sushi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [P0013Sushi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [P0013Sushi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [P0013Sushi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [P0013Sushi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [P0013Sushi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [P0013Sushi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [P0013Sushi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [P0013Sushi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [P0013Sushi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [P0013Sushi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [P0013Sushi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [P0013Sushi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [P0013Sushi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [P0013Sushi] SET  MULTI_USER 
GO
ALTER DATABASE [P0013Sushi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [P0013Sushi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [P0013Sushi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [P0013Sushi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [P0013Sushi] SET DELAYED_DURABILITY = DISABLED 
GO
USE [P0013Sushi]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 9/29/2019 10:10:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](50) NULL,
	[Tel] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Image] [varchar](50) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 9/29/2019 10:10:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuDetail]    Script Date: 9/29/2019 10:10:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuDetail](
	[ProductID] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
 CONSTRAINT [PK_MenuDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OpeningHour]    Script Date: 9/29/2019 10:10:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OpeningHour](
	[WeekDay] [varchar](20) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_OpeningHour] PRIMARY KEY CLUSTERED 
(
	[WeekDay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/29/2019 10:10:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Image] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_Production] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Address], [Tel], [Email], [Image]) VALUES (1, N'Dist.9, HCM City, High Tech Park', N'080745691', N'fpt@fpt.edu.vn', N'map.jpg')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Name], [Description], [Price]) VALUES (1, N'SPECIAL SEAFOODS FROM TSOYOSU TOKYO', N'Chiyoda Sushi is a sushi chain store with over 200 locations across Japan.
From our focus on take-out sushi shops, we have developed a diverse variety of businesses, from affordably priced conveyor belt sushi restaurants to a revival of the Edo style "Tachigui-sushi" (stand-and-eat shop).
Regardless of style, one thing is always the same; our stores offer a more accessible way to enjoy sushi. Chiyoda Sushi''s mission statement is to popularize sushi. In order to make that goal a reality, the most important thing for us is to create stores where you can enjoy sushi more freely and casually.', 200.85)
INSERT [dbo].[Menu] ([ID], [Name], [Description], [Price]) VALUES (2, N'PREMIUM SASHIMI BOAT', N'Here in Vietnam, too, our restaurant was formed as an accessible way to enjoy fresh, delicious sushi. Having accomplished our aim of popularizing sushi within Japan, we have made it our goal to offer an authentic taste of Japan to all the people of the world, beginning with Vietnam. That means bringing to you not just flavor, but every aspect of the high quality service we provide in Japan.', 156.25)
INSERT [dbo].[Menu] ([ID], [Name], [Description], [Price]) VALUES (3, N'ASSORTED PREMIUM SASHIMI', N'For website reservation, please reserve for up to 3 hours before use and up to 8 people.
We may contact you to confirm the details of your reservation.
Please call us if you like to reserve a table for 9 or more.', 500.25)
SET IDENTITY_INSERT [dbo].[Menu] OFF
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (1, 1)
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (1, 2)
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (1, 3)
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (2, 1)
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (2, 3)
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (3, 1)
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (3, 3)
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (4, 1)
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (4, 3)
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (5, 2)
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (5, 3)
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (6, 2)
INSERT [dbo].[MenuDetail] ([ProductID], [MenuID]) VALUES (7, 2)
INSERT [dbo].[OpeningHour] ([WeekDay], [Description]) VALUES (N'Friday ', N'12 - 23')
INSERT [dbo].[OpeningHour] ([WeekDay], [Description]) VALUES (N'Monday', N'Closed')
INSERT [dbo].[OpeningHour] ([WeekDay], [Description]) VALUES (N'Saturday', N'12 - 23')
INSERT [dbo].[OpeningHour] ([WeekDay], [Description]) VALUES (N'Sunday', N'12 - 23')
INSERT [dbo].[OpeningHour] ([WeekDay], [Description]) VALUES (N'Thursday', N'12 - 22')
INSERT [dbo].[OpeningHour] ([WeekDay], [Description]) VALUES (N'Tuesday', N'12 - 22')
INSERT [dbo].[OpeningHour] ([WeekDay], [Description]) VALUES (N'Wednesday', N'12 - 22')
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Image], [Description]) VALUES (1, N'Nigiri', N'1.jpg', N'Small rice balls with fish, shellfish, etc. on top. There are countless varieties of nigirizushi, some of the most common ones being tuna, shrimp, eel, squid, octopus and fried egg.')
INSERT [dbo].[Product] ([ID], [Name], [Image], [Description]) VALUES (2, N'Gunkan', N'2.jpg', N'Small cups made of sushi rice and dried seaweed filled with seafood, etc. There are countless varieties of gunkanzushi, some of the most common ones being sea urchin and various kinds of fish eggs.')
INSERT [dbo].[Product] ([ID], [Name], [Image], [Description]) VALUES (3, N'Norimaki', N'3.jpg', N'Sushi rice and seafood, etc. rolled in dried seaweed sheets. There are countless varieties of sushi rolls differing in ingredients and thickness. Sushi rolls prepared "inside out" are very popular outside of Japan, but rarely found in Japan.
')
INSERT [dbo].[Product] ([ID], [Name], [Image], [Description]) VALUES (4, N'Temaki', N'4.jpg', N'Temakizushi (literally hand rolls) are cones made of nori seaweed and filled with sushi rice, seafood and vegetables.')
INSERT [dbo].[Product] ([ID], [Name], [Image], [Description]) VALUES (5, N'Oshizushi', N'5.jpg', N'Oshizushi is pressed sushi, in which the fish is pressed onto the sushi rice in a wooden box. The picture shows trout oshizushi in form of a popular train station lunch box (ekiben).')
INSERT [dbo].[Product] ([ID], [Name], [Image], [Description]) VALUES (6, N'Inari', N'6.jpg', N'Inarizushi is a simple and inexpensive type of sushi, in which sushi rice is filled into small bags of deep fried tofu (aburaage).')
INSERT [dbo].[Product] ([ID], [Name], [Image], [Description]) VALUES (7, N'Chirashi', N'7.jpg', N'Chirashizushi is a dish in which seafood, mushrooms and vegetables are spread over sushi rice. It can resemble seafood domburi with one difference being that chirashizushi uses sushi rice while domburi uses regular, unseasoned rice.')
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[MenuDetail]  WITH CHECK ADD  CONSTRAINT [FK_MenuDetail_Menu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menu] ([ID])
GO
ALTER TABLE [dbo].[MenuDetail] CHECK CONSTRAINT [FK_MenuDetail_Menu]
GO
ALTER TABLE [dbo].[MenuDetail]  WITH CHECK ADD  CONSTRAINT [FK_MenuDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[MenuDetail] CHECK CONSTRAINT [FK_MenuDetail_Product]
GO
USE [master]
GO
ALTER DATABASE [P0013Sushi] SET  READ_WRITE 
GO
