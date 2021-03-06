USE [master]
GO
/****** Object:  Database [IctSkills2016]    Script Date: 08.09.2020 10:35:35 ******/
CREATE DATABASE [IctSkills2016]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IctSkills2016', FILENAME = N'C:\Users\Theiv\IctSkills2016.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IctSkills2016_log', FILENAME = N'C:\Users\Theiv\IctSkills2016_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IctSkills2016] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IctSkills2016].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IctSkills2016] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IctSkills2016] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IctSkills2016] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IctSkills2016] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IctSkills2016] SET ARITHABORT OFF 
GO
ALTER DATABASE [IctSkills2016] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IctSkills2016] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IctSkills2016] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IctSkills2016] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IctSkills2016] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IctSkills2016] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IctSkills2016] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IctSkills2016] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IctSkills2016] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IctSkills2016] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IctSkills2016] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IctSkills2016] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IctSkills2016] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IctSkills2016] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IctSkills2016] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IctSkills2016] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IctSkills2016] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IctSkills2016] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IctSkills2016] SET  MULTI_USER 
GO
ALTER DATABASE [IctSkills2016] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IctSkills2016] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IctSkills2016] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IctSkills2016] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IctSkills2016] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IctSkills2016] SET QUERY_STORE = OFF
GO
USE [IctSkills2016]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [IctSkills2016]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 08.09.2020 10:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[Id] [int] NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Firstname] [nvarchar](50) NULL,
	[ShirtNumber] [nvarchar](50) NOT NULL,
	[PositionId] [int] NOT NULL,
	[Date_of_birth] [datetime2](7) NOT NULL,
	[Team_id] [int] NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 08.09.2020 10:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Position] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 08.09.2020 10:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StageGame]    Script Date: 08.09.2020 10:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageGame](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeamA_Id] [int] NOT NULL,
	[TeamB_Id] [int] NOT NULL,
	[TournamentId] [int] NOT NULL,
	[Stage] [nvarchar](20) NULL,
	[TeamAGoals] [int] NULL,
	[TeamBGoals] [int] NULL,
	[OnGoing] [bit] NULL,
 CONSTRAINT [PK_StageGame] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 08.09.2020 10:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryCode] [nvarchar](50) NOT NULL,
	[FlagUrl] [nvarchar](50) NULL,
	[Region] [int] NOT NULL,
	[Removed] [bit] NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournaments]    Script Date: 08.09.2020 10:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournaments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Tournaments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentTeams]    Script Date: 08.09.2020 10:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentTeams](
	[TeamId] [int] NOT NULL,
	[TournamentId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nchar](10) NULL,
 CONSTRAINT [PK_TournamentTeams_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16793, N'Barkley', N'Ross', N'19', 2, CAST(N'1993-12-05T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16796, N'Coleman', N'Séamus', N'2', 1, CAST(N'1988-10-11T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16798, N'Fellaini', N'Marouane', N'8', 2, CAST(N'1987-11-22T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16799, N'Stones', N'John', N'16', 1, CAST(N'1994-05-28T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16807, N'Duffy', N'Shane', N'12', 1, CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16824, N'McGinn', N'Niall', N'7', 2, CAST(N'1987-07-20T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16833, N'Magennis', N'Josh', N'21', 3, CAST(N'1990-05-15T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16916, N'de Gea', N'David', N'13', 4, CAST(N'1990-11-07T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16918, N'Evra', N'Patrice', N'3', 1, CAST(N'1981-05-15T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16921, N'Evans', N'Jonny', N'5', 1, CAST(N'1988-01-03T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16924, N'Rooney', N'Wayne', N'10', 3, CAST(N'1985-10-24T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16926, N'Smalling', N'Chris', N'6', 1, CAST(N'1989-11-22T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16931, N'Nani', NULL, N'17', 3, CAST(N'1986-11-17T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16976, N'Čech', N'Petr', N'1', 4, CAST(N'1982-05-20T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16988, N'Schürrle', N'André', N'9', 2, CAST(N'1990-11-06T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16989, N'Hazard', N'Eden', N'10', 3, CAST(N'1991-01-07T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16990, N'Cahill', N'Gary', N'5', 1, CAST(N'1985-12-19T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16992, N'Azpilicueta', N'César', N'2', 1, CAST(N'1989-08-28T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16994, N'Bertrand', N'Ryan', N'21', 1, CAST(N'1989-08-05T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16995, N'De Bruyne', N'Kevin', N'7', 3, CAST(N'1991-06-28T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (16998, N'Lukaku', N'Romelu', N'9', 3, CAST(N'1993-05-13T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17013, N'Henderson', N'Jordan', N'14', 2, CAST(N'1990-06-17T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17014, N'Sturridge', N'Daniel', N'15', 3, CAST(N'1989-09-01T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17018, N'Mignolet', N'Simon', N'12', 4, CAST(N'1988-03-06T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17019, N'Allen', N'Joe', N'7', 2, CAST(N'1990-03-14T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17021, N'Sterling', N'Raheem', N'7', 2, CAST(N'1994-12-08T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17024, N'Škrtel', N'Martin', N'3', 1, CAST(N'1984-12-15T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17034, N'Ward', N'Danny', N'21', 4, CAST(N'1993-06-22T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17059, N'Westwood', N'Keiren', N'1', 4, CAST(N'1984-10-23T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17064, N'O''Shea', N'John', N'4', 1, CAST(N'1981-04-30T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17071, N'Giaccherini', N'Emanuele', N'23', 2, CAST(N'1985-05-05T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17073, N'Larsson', N'Sebastian', N'7', 2, CAST(N'1985-06-06T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17074, N'McClean', N'James', N'11', 2, CAST(N'1989-04-22T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17077, N'Vaughan', N'David', N'22', 2, CAST(N'1983-02-18T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17090, N'Long', N'Shane', N'9', 3, CAST(N'1987-01-22T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17098, N'McAuley', N'Gareth', N'4', 1, CAST(N'1979-12-05T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17114, N'Whelan', N'Glenn', N'6', 2, CAST(N'1984-01-13T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17125, N'Walters', N'Jonathan', N'14', 3, CAST(N'1983-09-20T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17141, N'Clark', N'Ciaran', N'3', 1, CAST(N'1989-09-26T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17154, N'Benteke', N'Christian', N'20', 3, CAST(N'1990-12-03T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17160, N'Given', N'Shay', N'16', 4, CAST(N'1976-04-20T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17170, N'Hart', N'Joe', N'1', 4, CAST(N'1987-04-19T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17175, N'Milner', N'James', N'4', 2, CAST(N'1986-01-04T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17186, N'Silva', N'David', N'21', 2, CAST(N'1986-01-08T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17190, N'Pantilimon', N'Costel', N'1', 4, CAST(N'1987-02-01T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17194, N'Guidetti', N'John', N'20', 3, CAST(N'1992-04-15T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17196, N'Mannus', N'Alan', N'23', 4, CAST(N'1982-05-19T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17222, N'Clyne', N'Nathaniel', N'12', 1, CAST(N'1991-04-05T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17224, N'Schneiderlin', N'Morgan', N'12', 2, CAST(N'1989-11-08T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17226, N'Fonte', N'José', N'4', 1, CAST(N'1983-12-22T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17228, N'Davis', N'Steven', N'8', 2, CAST(N'1985-01-01T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17235, N'Lallana', N'Adam', N'8', 2, CAST(N'1988-05-10T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17241, N'Boruc', N'Artur', N'12', 4, CAST(N'1980-02-20T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17272, N'Taylor', N'Neil', N'3', 1, CAST(N'1989-02-07T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17274, N'Williams', N'Ashley', N'6', 1, CAST(N'1984-08-23T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17295, N'Richards', N'Jazz', N'15', 1, CAST(N'1991-04-12T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17296, N'Davies', N'Ben', N'4', 1, CAST(N'1993-04-24T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17325, N'Forster', N'Fraser', N'13', 4, CAST(N'1988-03-17T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17335, N'Ledley', N'Joe', N'16', 2, CAST(N'1987-01-23T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17341, N'Lustig', N'Mikael', N'2', 1, CAST(N'1986-12-13T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17360, N'McCarthy', N'James', N'8', 2, CAST(N'1990-11-12T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17387, N'Rose', N'Danny', N'3', 1, CAST(N'1990-07-02T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17389, N'Vertonghen', N'Jan', N'5', 1, CAST(N'1987-04-24T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17394, N'Bale', N'Gareth', N'11', 3, CAST(N'1989-07-16T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17397, N'Dembélé', N'Moussa', N'19', 2, CAST(N'1987-07-16T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17399, N'Sigurðsson', N'Gylfi', N'10', 2, CAST(N'1989-09-08T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17402, N'Lloris', N'Hugo', N'1', 4, CAST(N'1986-12-26T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17403, N'Walker', N'Kyle', N'2', 1, CAST(N'1990-05-28T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17424, N'Hughes', N'Aaron', N'18', 1, CAST(N'1979-11-08T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17438, N'Cabaye', N'Yohan', N'6', 2, CAST(N'1986-01-14T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17440, N'Sissoko', N'Moussa', N'18', 2, CAST(N'1989-08-16T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17466, N'Szczęsny', N'Wojciech', N'1', 4, CAST(N'1990-04-18T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17467, N'Sagna', N'Bacary', N'19', 1, CAST(N'1983-02-14T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17469, N'Vermaelen', N'Thomas', N'3', 1, CAST(N'1985-11-14T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17470, N'Koscielny', N'Laurent', N'21', 1, CAST(N'1985-09-10T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17471, N'Rosický', N'Tomáš', N'10', 2, CAST(N'1980-10-04T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17473, N'Podolski', N'Lukas', N'10', 3, CAST(N'1985-06-04T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17474, N'Wilshere', N'Jack', N'18', 2, CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17475, N'Giroud', N'Olivier', N'9', 3, CAST(N'1986-09-30T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17478, N'Ramsey', N'Aaron', N'10', 2, CAST(N'1990-12-26T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17481, N'Fabiański', N'Łukasz', N'22', 4, CAST(N'1985-04-18T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17507, N'Collins', N'James', N'19', 1, CAST(N'1983-08-23T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17518, N'Raț', N'Răzvan', N'3', 1, CAST(N'1981-05-26T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17620, N'Gunnarsson', N'Aron', N'17', 2, CAST(N'1989-04-22T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17647, N'Hoolahan', N'Wes', N'20', 2, CAST(N'1982-05-20T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17649, N'Olsson', N'Martin', N'5', 1, CAST(N'1988-05-17T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17666, N'Chester', N'James', N'5', 1, CAST(N'1989-01-23T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17668, N'Evans', N'Corry', N'13', 2, CAST(N'1990-07-30T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17679, N'Quinn', N'Stephen', N'22', 2, CAST(N'1986-04-04T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17680, N'Brady', N'Robbie', N'19', 2, CAST(N'1992-01-14T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17681, N'Meyler', N'David', N'18', 2, CAST(N'1989-05-29T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17750, N'Courtois', N'Thibaut', N'1', 4, CAST(N'1992-05-11T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17754, N'Alderweireld', N'Toby', N'2', 1, CAST(N'1989-03-02T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17758, N'Ciman', N'Laurent', N'23', 1, CAST(N'1985-08-05T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17760, N'Witsel', N'Axel', N'6', 2, CAST(N'1989-01-12T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17762, N'Mertens', N'Dries', N'14', 3, CAST(N'1987-05-06T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17786, N'Fôn Williams', N'Owain', N'12', 4, CAST(N'1987-03-17T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17788, N'Gunter', N'Chris', N'2', 1, CAST(N'1989-07-21T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17789, N'King', N'Andy', N'8', 2, CAST(N'1988-10-29T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17790, N'Vokes', N'Sam', N'18', 3, CAST(N'1989-10-21T00:00:00.0000000' AS DateTime2), 390)
GO
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17791, N'Church', N'Simon', N'23', 3, CAST(N'1988-12-10T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17792, N'Robson-Kanu', N'Hal', N'9', 3, CAST(N'1989-05-21T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17801, N'Randolph', N'Darren', N'23', 4, CAST(N'1987-05-12T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17805, N'Hendrick', N'Jeff', N'13', 2, CAST(N'1992-01-31T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17811, N'Gera', N'Zoltán', N'10', 3, CAST(N'1979-04-22T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17849, N'Topal', N'Mehmet', N'15', 2, CAST(N'1986-03-03T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17858, N'Alves', N'Bruno', N'2', 1, CAST(N'1981-11-27T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17860, N'Kadlec', N'Michal', N'3', 1, CAST(N'1984-12-13T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17867, N'Gönül', N'Gökhan', N'7', 1, CAST(N'1985-01-04T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17869, N'Erkin', N'Caner', N'18', 2, CAST(N'1988-10-04T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17931, N'Piqué', N'Gerard', N'3', 1, CAST(N'1987-02-02T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17932, N'Fàbregas', N'Cesc', N'10', 2, CAST(N'1987-05-04T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17935, N'Rodríguez', N'Pedro', N'11', 3, CAST(N'1987-07-28T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17936, N'Iniesta', N'Andrés', N'6', 2, CAST(N'1984-05-11T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17941, N'Bartra', N'Marc', N'4', 1, CAST(N'1991-01-15T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17942, N'Busquets', N'Sergio', N'5', 2, CAST(N'1988-07-16T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17944, N'Alba', N'Jordi', N'18', 1, CAST(N'1989-03-21T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17957, N'Koke', NULL, N'8', 2, CAST(N'1992-01-08T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17961, N'Turan', N'Arda', N'10', 2, CAST(N'1987-01-30T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17968, N'Juanfran', NULL, N'16', 1, CAST(N'1985-01-09T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17986, N'Chiricheș', N'Vlad', N'6', 1, CAST(N'1989-11-14T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17988, N'Neuer', N'Manuel', N'1', 4, CAST(N'1986-03-27T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17990, N'Alcântara', N'Thiago', N'14', 2, CAST(N'1991-04-11T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17993, N'Mandžukić', N'Mario', N'17', 3, CAST(N'1986-05-21T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17995, N'Shaqiri', N'Xherdan', N'23', 2, CAST(N'1991-10-10T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (17999, N'Boateng', N'Jérôme', N'17', 1, CAST(N'1988-09-03T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18000, N'Götze', N'Mario', N'19', 2, CAST(N'1992-06-03T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18005, N'Müller', N'Thomas', N'13', 3, CAST(N'1989-09-13T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18007, N'Alaba', N'David', N'8', 2, CAST(N'1992-06-24T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18009, N'Schweinsteiger', N'Bastian', N'7', 2, CAST(N'1984-08-01T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18012, N'Kroos', N'Toni', N'18', 2, CAST(N'1990-01-04T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18031, N'Arnautović', N'Marko', N'7', 3, CAST(N'1989-04-19T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18035, N'De Sciglio', N'Mattia', N'2', 1, CAST(N'1992-10-20T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18061, N'El Shaarawy', N'Stephan', N'22', 2, CAST(N'1992-10-27T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18068, N'Griezmann', N'Antoine', N'7', 3, CAST(N'1991-03-21T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18069, N'Seferović', N'Haris', N'9', 3, CAST(N'1992-02-22T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18090, N'Gignac', N'André-Pierre', N'10', 3, CAST(N'1985-12-05T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18097, N'Payet', N'Dimitri', N'8', 2, CAST(N'1987-03-29T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18106, N'Mandanda', N'Steve', N'16', 4, CAST(N'1985-03-28T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18115, N'Hubočan', N'Tomáš', N'15', 1, CAST(N'1985-09-17T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18116, N'Shirokov', N'Roman', N'15', 2, CAST(N'1981-07-06T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18118, N'Shatov', N'Oleg', N'17', 2, CAST(N'1990-06-29T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18120, N'Smolnikov', N'Igor', N'3', 1, CAST(N'1988-08-08T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18127, N'Tymoshchuk', N'Anatoliy', N'4', 2, CAST(N'1979-03-30T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18139, N'Sigþórsson', N'Kolbeinn', N'9', 3, CAST(N'1990-03-14T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18160, N'Pintilii', N'Mihai', N'8', 2, CAST(N'1984-11-09T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18162, N'Chipciu', N'Alexandru', N'7', 2, CAST(N'1989-05-18T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18166, N'Prepeliță', N'Andrei', N'18', 2, CAST(N'1985-12-08T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18167, N'Tătărușanu', N'Ciprian', N'12', 4, CAST(N'1986-02-09T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18174, N'Stanciu', N'Nicușor', N'10', 2, CAST(N'1993-05-07T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18181, N'Popa', N'Adrian', N'20', 2, CAST(N'1988-07-24T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18186, N'Carroll', N'Roy', N'12', 4, CAST(N'1977-09-30T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18219, N'İnan', N'Selçuk', N'8', 2, CAST(N'1985-02-10T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18223, N'Yılmaz', N'Burak', N'17', 3, CAST(N'1985-07-15T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18227, N'Balta', N'Hakan', N'3', 1, CAST(N'1983-03-23T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18229, N'Kaya', N'Semih', N'2', 1, CAST(N'1991-02-24T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18245, N'Okotie', N'Rubin', N'9', 3, CAST(N'1987-06-06T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18248, N'Lindner', N'Heinz', N'12', 4, CAST(N'1990-07-17T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18263, N'Suttner', N'Markus', N'13', 1, CAST(N'1987-04-16T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18292, N'Leno', N'Bernd', N'12', 4, CAST(N'1992-03-04T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18300, N'Derdiyok', N'Eren', N'19', 3, CAST(N'1988-06-12T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18301, N'Can', N'Emre', N'14', 2, CAST(N'1994-01-12T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18339, N'Gomes', N'André', N'15', 2, CAST(N'1993-07-30T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18352, N'Hamšík', N'Marek', N'17', 2, CAST(N'1987-07-27T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18355, N'Džemaili', N'Blerim', N'15', 2, CAST(N'1986-04-12T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18357, N'Insigne', N'Lorenzo', N'20', 3, CAST(N'1991-06-04T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18362, N'Behrami', N'Valon', N'11', 2, CAST(N'1985-04-19T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18365, N'Kozáčik', N'Matúš', N'23', 4, CAST(N'1983-12-27T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18368, N'Hubník', N'Roman', N'5', 1, CAST(N'1984-06-06T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18371, N'Limberský', N'David', N'8', 1, CAST(N'1983-10-06T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18375, N'Ďuriš', N'Michal', N'21', 3, CAST(N'1988-06-01T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18384, N'Kolář', N'Daniel', N'14', 2, CAST(N'1985-10-27T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18389, N'Sommer', N'Yann', N'1', 4, CAST(N'1988-12-07T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18391, N'Ajeti', N'Arlind', N'18', 1, CAST(N'1993-09-25T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18399, N'Schär', N'Fabian', N'22', 1, CAST(N'1991-12-20T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18403, N'Frei', N'Fabian', N'8', 2, CAST(N'1989-01-08T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18409, N'Aliji', N'Naser', N'17', 1, CAST(N'1993-12-27T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18413, N'Xhaka', N'Taulant', N'14', 2, CAST(N'1991-03-28T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18415, N'Casillas', N'Iker', N'1', 4, CAST(N'1981-05-20T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18417, N'Pepe', NULL, N'3', 1, CAST(N'1983-02-26T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18418, N'Ramos', N'Sergio', N'15', 1, CAST(N'1986-03-30T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18420, N'Khedira', N'Sami', N'6', 2, CAST(N'1987-04-04T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18421, N'Ronaldo', N'Cristiano', N'7', 3, CAST(N'1985-02-05T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18430, N'Modrić', N'Luka', N'10', 2, CAST(N'1985-09-09T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18432, N'Morata', N'Álvaro', N'7', 3, CAST(N'1992-10-23T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18448, N'Sigurðsson', N'Ragnar', N'6', 1, CAST(N'1986-06-19T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18461, N'Höwedes', N'Benedikt', N'4', 1, CAST(N'1988-02-29T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18467, N'Draxler', N'Julian', N'11', 2, CAST(N'1993-09-20T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18475, N'Fuchs', N'Christian', N'5', 1, CAST(N'1986-04-07T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18478, N'Szalai', N'Ádám', N'9', 3, CAST(N'1987-12-09T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18480, N'Neustädter', N'Roman', N'5', 1, CAST(N'1988-02-18T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18491, N'Lewandowski', N'Robert', N'9', 3, CAST(N'1988-08-21T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18494, N'Hummels', N'Mats', N'5', 1, CAST(N'1988-12-16T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18495, N'Błaszczykowski', N'Jakub', N'16', 2, CAST(N'1985-12-14T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18497, N'Şahin', N'Nuri', N'5', 2, CAST(N'1988-09-05T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18504, N'Piszczek', N'Łukasz', N'20', 1, CAST(N'1985-06-03T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18511, N'Buffon', N'Gianluigi', N'1', 4, CAST(N'1978-01-28T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18512, N'Chiellini', N'Giorgio', N'3', 1, CAST(N'1984-08-14T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18514, N'Ogbonna', N'Angelo', N'5', 1, CAST(N'1988-05-23T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18515, N'Pogba', N'Paul', N'15', 2, CAST(N'1993-03-15T00:00:00.0000000' AS DateTime2), 406)
GO
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18524, N'Barzagli', N'Andrea', N'15', 1, CAST(N'1981-05-08T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18526, N'Bonucci', N'Leonardo', N'19', 1, CAST(N'1987-05-01T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18532, N'Lichtsteiner', N'Stephan', N'2', 1, CAST(N'1984-01-16T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18542, N'Motta', N'Thiago', N'10', 2, CAST(N'1982-08-28T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18544, N'Ibrahimović', N'Zlatan', N'10', 3, CAST(N'1981-10-03T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18546, N'Matuidi', N'Blaise', N'14', 2, CAST(N'1987-04-09T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18549, N'Digne', N'Lucas', N'17', 1, CAST(N'1993-07-20T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18553, N'Jallet', N'Christophe', N'2', 1, CAST(N'1983-10-31T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18556, N'Sirigu', N'Salvatore', N'12', 4, CAST(N'1987-01-12T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18558, N'Coman', N'Kingsley', N'20', 3, CAST(N'1996-06-13T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18575, N'Mangala', N'Eliaquim', N'13', 1, CAST(N'1991-02-13T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18585, N'Wernbloom', N'Pontus', N'16', 2, CAST(N'1986-06-25T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18586, N'Ignashevich', N'Sergei', N'4', 1, CAST(N'1979-07-14T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18588, N'Berezutski', N'Aleksei', N'6', 1, CAST(N'1982-06-20T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18599, N'Berezutski', N'Vasili', N'14', 1, CAST(N'1982-06-20T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18602, N'Akinfeev', N'Igor', N'1', 4, CAST(N'1986-04-08T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18603, N'Shchennikov', N'Georgi', N'21', 1, CAST(N'1991-04-27T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18622, N'Özil', N'Mesut', N'8', 2, CAST(N'1988-10-15T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18708, N'Mucha', N'Ján', N'1', 4, CAST(N'1982-12-05T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18710, N'Ďurica', N'Ján', N'4', 1, CAST(N'1981-12-10T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18711, N'Pekarík', N'Peter', N'2', 1, CAST(N'1986-10-30T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18712, N'Švento', N'Dušan', N'18', 1, CAST(N'1985-08-01T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18713, N'Saláta', N'Kornel', N'16', 1, CAST(N'1985-01-24T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18715, N'Kucka', N'Juraj', N'19', 2, CAST(N'1987-02-26T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18717, N'Pečovský', N'Viktor', N'22', 2, CAST(N'1983-05-24T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18718, N'Mak', N'Róbert', N'20', 2, CAST(N'1991-03-08T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18720, N'Šesták', N'Stanislav', N'9', 3, CAST(N'1982-12-16T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18723, N'Nemec', N'Adam', N'11', 3, CAST(N'1985-09-02T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18724, N'Pyatov', N'Andriy', N'12', 4, CAST(N'1984-06-28T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18727, N'Kucher', N'Oleksandr', N'5', 1, CAST(N'1982-10-22T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18728, N'Shevchuk', N'Vyacheslav', N'13', 1, CAST(N'1979-05-13T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18730, N'Rakitskiy', N'Yaroslav', N'20', 1, CAST(N'1989-08-03T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18731, N'Khacheridi', N'Yevhen', N'3', 1, CAST(N'1987-07-28T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18734, N'Rotan', N'Ruslan', N'14', 2, CAST(N'1981-10-29T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18735, N'Yarmolenko', N'Andriy', N'7', 2, CAST(N'1989-10-23T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18736, N'Konoplyanka', N'Yevhen', N'10', 2, CAST(N'1989-09-29T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18737, N'Stepanenko', N'Taras', N'6', 2, CAST(N'1989-08-08T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18745, N'Seleznyov', N'Yevhen', N'11', 3, CAST(N'1985-07-20T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18747, N'Zozulya', N'Roman', N'8', 3, CAST(N'1989-11-17T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18841, N'Ferguson', N'Shane', N'3', 2, CAST(N'1991-07-12T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18853, N'Kane', N'Harry', N'9', 3, CAST(N'1993-07-28T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18883, N'Srna', N'Darijo', N'11', 1, CAST(N'1982-05-01T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (18926, N'Batshuayi', N'Michy', N'22', 3, CAST(N'1993-10-02T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19008, N'Lenjani', N'Ermir', N'3', 2, CAST(N'1989-08-05T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19125, N'Kıvrak', N'Onur', N'12', 4, CAST(N'1988-01-01T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19130, N'Şahan', N'Olcay', N'11', 2, CAST(N'1987-05-26T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19132, N'Çalhanoğlu', N'Hakan', N'6', 2, CAST(N'1994-02-08T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19135, N'Tosun', N'Cenk', N'9', 3, CAST(N'1991-06-07T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19138, N'Djourou', N'Johan', N'20', 1, CAST(N'1987-01-18T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19139, N'von Bergen', N'Steve', N'5', 1, CAST(N'1983-06-10T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19141, N'Rodríguez', N'Ricardo', N'13', 1, CAST(N'1992-08-25T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19142, N'Lang', N'Michael', N'6', 1, CAST(N'1991-02-08T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19145, N'Xhaka', N'Granit', N'10', 2, CAST(N'1992-09-27T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19146, N'Mehmedi', N'Admir', N'18', 3, CAST(N'1991-03-16T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19149, N'Patrício', N'Rui', N'1', 4, CAST(N'1988-02-15T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19151, N'Lopes', N'Anthony', N'12', 4, CAST(N'1990-10-01T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19154, N'Soares', N'Cédric', N'21', 1, CAST(N'1991-08-31T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19155, N'Moutinho', N'João', N'8', 2, CAST(N'1986-09-08T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19162, N'Éder', NULL, N'17', 3, CAST(N'1986-11-15T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19191, N'Halldórsson', N'Hannes Þór', N'1', 4, CAST(N'1984-04-27T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19193, N'Sævarsson', N'Birkir Már', N'2', 1, CAST(N'1984-11-11T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19194, N'Árnason', N'Kári', N'14', 1, CAST(N'1982-10-13T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19196, N'Skúlason', N'Ari Freyr', N'23', 1, CAST(N'1987-05-14T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19199, N'Hallfreðsson', N'Emil', N'20', 2, CAST(N'1984-06-29T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19201, N'Guðmundsson', N'Jóhann Berg', N'7', 2, CAST(N'1990-10-27T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19202, N'Bjarnason', N'Birkir', N'8', 2, CAST(N'1988-05-27T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19205, N'Gudjohnsen', N'Eidur', N'22', 3, CAST(N'1978-09-15T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19206, N'Finnbogason', N'Alfreð', N'11', 3, CAST(N'1989-02-01T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19234, N'Wawrzyniak', N'Jakub', N'14', 1, CAST(N'1983-07-07T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19235, N'Jodłowiec', N'Tomasz', N'6', 2, CAST(N'1985-09-08T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19236, N'Glik', N'Kamil', N'15', 1, CAST(N'1988-02-03T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19238, N'Jędrzejczyk', N'Artur', N'3', 1, CAST(N'1987-11-04T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19241, N'Salamon', N'Bartosz', N'18', 1, CAST(N'1991-05-01T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19244, N'Peszko', N'Sławomir', N'17', 2, CAST(N'1985-02-19T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19246, N'Krychowiak', N'Grzegorz', N'10', 2, CAST(N'1990-01-29T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19249, N'Zieliński', N'Piotr', N'19', 2, CAST(N'1994-05-20T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19252, N'Milik', N'Arkadiusz', N'7', 3, CAST(N'1994-02-28T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19303, N'Almer', N'Robert', N'1', 4, CAST(N'1984-03-20T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19304, N'Özcan', N'Ramazan', N'23', 4, CAST(N'1984-06-28T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19306, N'Prödl', N'Sebastian', N'15', 1, CAST(N'1987-06-21T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19307, N'Garics', N'György', N'2', 2, CAST(N'1984-03-08T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19308, N'Dragović', N'Aleksandar', N'3', 1, CAST(N'1991-03-06T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19309, N'Klein', N'Florian', N'17', 1, CAST(N'1986-11-17T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19312, N'Baumgartlinger', N'Julian', N'14', 2, CAST(N'1988-01-02T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19313, N'Junuzović', N'Zlatko', N'10', 2, CAST(N'1987-09-26T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19316, N'Harnik', N'Martin', N'11', 2, CAST(N'1987-06-10T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19317, N'Janko', N'Marc', N'21', 3, CAST(N'1983-06-25T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19427, N'Berisha', N'Etrit', N'1', 4, CAST(N'1989-03-10T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19429, N'Shehi', N'Orges', N'12', 4, CAST(N'1977-09-25T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19430, N'Mavraj', N'Mërgim', N'15', 1, CAST(N'1986-06-09T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19431, N'Cana', N'Lorik', N'5', 1, CAST(N'1983-06-27T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19432, N'Agolli', N'Ansi', N'7', 1, CAST(N'1982-11-11T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19437, N'Hysaj', N'Elseid', N'4', 1, CAST(N'1994-02-20T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19441, N'Roshi', N'Odise', N'21', 2, CAST(N'1991-05-21T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19442, N'Basha', N'Migjen', N'8', 2, CAST(N'1987-01-05T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19443, N'Kaçe', N'Ergys', N'20', 2, CAST(N'1993-07-08T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19444, N'Kukeli', N'Burim', N'13', 2, CAST(N'1984-01-16T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19449, N'Sadiku', N'Armando', N'10', 3, CAST(N'1991-05-27T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19453, N'Subašić', N'Danijel', N'23', 4, CAST(N'1984-10-27T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19455, N'Ćorluka', N'Vedran', N'5', 1, CAST(N'1986-02-05T00:00:00.0000000' AS DateTime2), 416)
GO
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19456, N'Strinić', N'Ivan', N'3', 1, CAST(N'1987-07-17T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19457, N'Vida', N'Domagoj', N'21', 1, CAST(N'1989-04-29T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19458, N'Schildenfeld', N'Gordon', N'13', 1, CAST(N'1985-03-18T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19459, N'Vrsaljko', N'Šime', N'2', 1, CAST(N'1992-01-10T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19463, N'Rakitić', N'Ivan', N'7', 2, CAST(N'1988-03-10T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19465, N'Perišić', N'Ivan', N'4', 2, CAST(N'1989-02-02T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19466, N'Kovačić', N'Mateo', N'8', 2, CAST(N'1994-05-06T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19470, N'Kalinić', N'Nikola', N'16', 3, CAST(N'1988-01-05T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19472, N'Kombarov', N'Dmitri', N'23', 1, CAST(N'1987-01-22T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19478, N'Glushakov', N'Denis', N'8', 2, CAST(N'1987-01-27T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19479, N'Samedov', N'Aleksandr', N'19', 2, CAST(N'1984-07-19T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19480, N'Mamayev', N'Pavel', N'11', 2, CAST(N'1988-09-17T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19482, N'Kokorin', N'Aleksandr', N'9', 3, CAST(N'1991-03-19T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19483, N'Smolov', N'Fyodor', N'10', 3, CAST(N'1990-02-05T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19594, N'McGovern', N'Michael', N'1', 4, CAST(N'1984-07-12T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19595, N'Cathcart', N'Craig', N'20', 1, CAST(N'1989-02-06T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19596, N'Hodson', N'Lee', N'22', 1, CAST(N'1991-10-02T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19598, N'Baird', N'Chris', N'6', 1, CAST(N'1982-02-25T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19599, N'Norwood', N'Oliver', N'16', 2, CAST(N'1991-04-12T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19601, N'Ward', N'Jamie', N'19', 2, CAST(N'1986-05-12T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19602, N'Grigg', N'Will', N'9', 3, CAST(N'1991-07-03T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19612, N'Cotterill', N'David', N'17', 3, CAST(N'1987-12-04T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19619, N'Stoch', N'Miroslav', N'10', 2, CAST(N'1989-10-19T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19624, N'Lila', N'Andi', N'2', 1, CAST(N'1986-02-12T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19626, N'Balaj', N'Bekim', N'19', 3, CAST(N'1991-01-11T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19627, N'Vargić', N'Ivan', N'1', 4, CAST(N'1987-03-15T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19650, N'Király', N'Gábor', N'1', 4, CAST(N'1976-04-01T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19652, N'Gulácsi', N'Péter', N'22', 4, CAST(N'1990-05-06T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19655, N'Kádár', N'Tamás', N'4', 1, CAST(N'1990-03-14T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19658, N'Guzmics', N'Richárd', N'20', 1, CAST(N'1987-04-16T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19662, N'Dzsudzsák', N'Balázs', N'7', 3, CAST(N'1986-12-23T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19664, N'Elek', N'Ákos', N'6', 2, CAST(N'1988-07-21T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19668, N'Stieber', N'Zoltán', N'18', 2, CAST(N'1988-10-16T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19670, N'Németh', N'Krisztián', N'11', 3, CAST(N'1989-01-05T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19671, N'Böde', N'Dániel', N'13', 3, CAST(N'1986-10-24T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19672, N'Lovrencsics', N'Gergő', N'14', 2, CAST(N'1988-09-01T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19673, N'Marchetti', N'Federico', N'13', 4, CAST(N'1983-02-07T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19681, N'Candreva', N'Antonio', N'6', 2, CAST(N'1987-02-28T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19682, N'Florenzi', N'Alessandro', N'8', 2, CAST(N'1991-03-11T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19688, N'Găman', N'Valerică', N'15', 1, CAST(N'1989-02-25T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19690, N'Mățel', N'Alexandru', N'2', 1, CAST(N'1989-10-17T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19691, N'Grigore', N'Dragoș', N'21', 1, CAST(N'1986-09-07T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19692, N'Torje', N'Gabriel', N'11', 2, CAST(N'1989-11-22T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19695, N'Hoban', N'Ovidiu', N'5', 2, CAST(N'1982-12-27T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19698, N'Stancu', N'Bogdan', N'19', 3, CAST(N'1987-06-28T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19700, N'Keșerü', N'Claudiu', N'13', 3, CAST(N'1986-12-02T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19727, N'Granqvist', N'Andreas', N'4', 1, CAST(N'1985-04-16T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19728, N'Källström', N'Kim', N'9', 2, CAST(N'1982-08-24T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19729, N'Durmaz', N'Jimmy', N'21', 2, CAST(N'1989-03-22T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19730, N'Zengin', N'Erkan', N'22', 2, CAST(N'1985-08-05T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19756, N'Vaclík', N'Tomáš', N'16', 4, CAST(N'1989-03-29T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19757, N'Sivok', N'Tomáš', N'6', 1, CAST(N'1983-09-15T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19758, N'Gebre Selassie', N'Theodor', N'4', 1, CAST(N'1986-12-24T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19759, N'Suchý', N'Marek', N'17', 1, CAST(N'1988-03-29T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19761, N'Plašil', N'Jaroslav', N'13', 2, CAST(N'1982-01-05T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19765, N'Lafata', N'David', N'21', 3, CAST(N'1981-09-18T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19770, N'McGeady', N'Aiden', N'7', 2, CAST(N'1986-04-04T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19772, N'Keane', N'Robbie', N'10', 3, CAST(N'1980-07-08T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19774, N'Heaton', N'Tom', N'23', 4, CAST(N'1986-04-15T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19798, N'Vardy', N'Jamie', N'11', 3, CAST(N'1987-01-11T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19830, N'Pudil', N'Daniel', N'11', 2, CAST(N'1985-09-27T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19849, N'Christie', N'Cyrus', N'15', 1, CAST(N'1992-09-30T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (19984, N'Moți', N'Cosmin', N'4', 1, CAST(N'1984-12-03T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20028, N'Gómez', N'Mario', N'23', 3, CAST(N'1985-07-10T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20051, N'Umtiti', N'Samuel', N'22', 1, CAST(N'1993-11-14T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20078, N'Brozović', N'Marcelo', N'14', 2, CAST(N'1992-11-16T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20079, N'Čop', N'Duje', N'22', 3, CAST(N'1990-02-01T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20181, N'Sydorchuk', N'Serhiy', N'16', 2, CAST(N'1991-05-02T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20182, N'Harmash', N'Denys', N'19', 2, CAST(N'1990-04-19T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20220, N'Jantscher', N'Jakob', N'22', 2, CAST(N'1989-01-08T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20223, N'Ilsanker', N'Stefan', N'6', 2, CAST(N'1989-05-18T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20236, N'Hinteregger', N'Martin', N'4', 1, CAST(N'1992-09-07T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20284, N'Darida', N'Vladimír', N'22', 2, CAST(N'1990-08-08T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20481, N'Hiljemark', N'Oscar', N'15', 2, CAST(N'1992-06-28T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20511, N'Lung', N'Silviu', N'23', 4, CAST(N'1989-06-04T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20592, N'Boyko', N'Denys', N'1', 4, CAST(N'1988-01-29T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20652, N'Torbinski', N'Dmitri', N'20', 2, CAST(N'1984-04-28T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20733, N'Kramarić', N'Andrej', N'9', 3, CAST(N'1991-06-19T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20735, N'Novota', N'Ján', N'12', 4, CAST(N'1983-11-29T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20750, N'Sabitzer', N'Marcel', N'20', 2, CAST(N'1994-03-17T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20765, N'Pavelka', N'David', N'15', 2, CAST(N'1991-05-18T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20767, N'Rybalka', N'Serhiy', N'18', 2, CAST(N'1990-04-01T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20778, N'Šural', N'Josef', N'18', 2, CAST(N'1990-05-30T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20811, N'Şen', N'Volkan', N'20', 2, CAST(N'1987-07-07T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20845, N'Necid', N'Tomáš', N'7', 3, CAST(N'1989-08-13T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20924, N'Schöpf', N'Alessandro', N'18', 2, CAST(N'1994-02-07T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20926, N'Quaresma', N'Ricardo', N'20', 3, CAST(N'1983-09-26T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20938, N'Carvalho', N'William', N'14', 2, CAST(N'1992-04-07T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20939, N'Dier', N'Eric', N'17', 2, CAST(N'1994-01-15T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (20952, N'Mário', N'João', N'10', 2, CAST(N'1993-01-19T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (21074, N'Hennessey', N'Wayne', N'1', 4, CAST(N'1987-01-24T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (21077, N'Edwards', N'David', N'14', 2, CAST(N'1986-02-03T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (21231, N'Keogh', N'Richard', N'5', 1, CAST(N'1986-08-11T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (21366, N'Bellerín', N'Héctor', N'12', 1, CAST(N'1995-03-19T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (21420, N'Murphy', N'Daryl', N'21', 3, CAST(N'1983-03-15T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (21634, N'Ward', N'Stephen', N'17', 1, CAST(N'1985-08-20T00:00:00.0000000' AS DateTime2), 421)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (21690, N'McCullough', N'Luke', N'15', 1, CAST(N'1994-02-15T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (21720, N'Alli', N'Dele', N'20', 2, CAST(N'1996-04-11T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (21967, N'Dallas', N'Stuart', N'14', 2, CAST(N'1991-04-19T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22341, N'Washington', N'Conor', N'11', 3, CAST(N'1992-05-18T00:00:00.0000000' AS DateTime2), 423)
GO
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22567, N'McLaughlin', N'Conor', N'2', 1, CAST(N'1991-07-26T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22778, N'Rami', N'Adil', N'4', 1, CAST(N'1985-12-27T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22825, N'San José', N'Mikel', N'17', 1, CAST(N'1989-05-30T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22839, N'Aduriz', N'Aritz', N'20', 3, CAST(N'1981-02-11T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22880, N'Moubandje', N'François', N'3', 1, CAST(N'1990-06-21T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22897, N'Parolo', N'Marco', N'18', 2, CAST(N'1985-01-25T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22916, N'De Rossi', N'Daniele', N'16', 2, CAST(N'1983-07-24T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22921, N'Jedvaj', N'Tin', N'6', 1, CAST(N'1995-11-28T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22922, N'Nainggolan', N'Radja', N'4', 2, CAST(N'1988-05-04T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22931, N'Gillet', N'Jean-François', N'13', 4, CAST(N'1979-05-31T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22935, N'Immobile', N'Ciro', N'11', 3, CAST(N'1990-02-20T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (22945, N'Darmian', N'Matteo', N'4', 1, CAST(N'1989-12-02T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23005, N'Carvalho', N'Ricardo', N'6', 1, CAST(N'1978-05-18T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23010, N'Ferreira Carrasco', N'Yannick', N'11', 3, CAST(N'1993-09-04T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23015, N'Martial', N'Anthony', N'11', 3, CAST(N'1995-12-05T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23045, N'Soriano', N'Bruno', N'19', 2, CAST(N'1984-06-12T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23117, N'Nolito', NULL, N'22', 3, CAST(N'1986-10-15T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23134, N'Mustafi', N'Shkodran', N'2', 1, CAST(N'1992-04-17T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23173, N'Éder', NULL, N'17', 3, CAST(N'1986-11-15T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23174, N'Williams', N'Jonny', N'20', 2, CAST(N'1993-10-09T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23296, N'Silva', N'Adrien', N'23', 2, CAST(N'1989-03-15T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23328, N'Alibec', N'Denis', N'9', 3, CAST(N'1991-01-05T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23395, N'Hrošovský', N'Patrik', N'13', 2, CAST(N'1992-04-22T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23490, N'Origi', N'Divock', N'17', 3, CAST(N'1995-04-18T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23552, N'Sturaro', N'Stefano', N'14', 2, CAST(N'1993-03-09T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23794, N'Embolo', N'Breel', N'7', 3, CAST(N'1997-02-14T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (23859, N'Eliseu', NULL, N'19', 1, CAST(N'1983-10-01T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (24040, N'Gyömbér', N'Norbert', N'5', 1, CAST(N'1992-07-03T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (24087, N'Săpunaru', N'Cristian', N'22', 1, CAST(N'1984-04-05T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (24858, N'Guerreiro', N'Raphaël', N'5', 1, CAST(N'1993-12-22T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (24875, N'Costil', N'Benoît', N'23', 4, CAST(N'1987-07-03T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (24878, N'Grosicki', N'Kamil', N'11', 2, CAST(N'1988-06-08T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25110, N'Zaza', N'Simone', N'7', 3, CAST(N'1991-06-25T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25136, N'Stępiński', N'Mariusz', N'13', 3, CAST(N'1995-05-12T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25188, N'Vieirinha', NULL, N'11', 2, CAST(N'1986-01-24T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25202, N'ter Stegen', N'Marc-André', N'22', 4, CAST(N'1992-04-30T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25255, N'Mallı', N'Yunus', N'19', 2, CAST(N'1992-02-24T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25273, N'Badelj', N'Milan', N'19', 2, CAST(N'1989-02-25T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25280, N'Tah', N'Jonathan', N'16', 1, CAST(N'1996-02-11T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25310, N'Hitz', N'Marwin', N'12', 4, CAST(N'1987-09-18T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25342, N'Bürki', N'Roman', N'21', 4, CAST(N'1990-11-14T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25356, N'Cionek', N'Thiago', N'4', 1, CAST(N'1986-04-21T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25358, N'Pazdan', N'Michał', N'2', 1, CAST(N'1987-09-21T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25359, N'Linetty', N'Karol', N'8', 2, CAST(N'1995-02-02T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25495, N'Ekdal', N'Albin', N'8', 2, CAST(N'1989-07-28T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25605, N'Eduardo', NULL, N'22', 4, CAST(N'1982-09-19T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25606, N'Silva', N'Rafa', N'18', 2, CAST(N'1993-05-17T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25625, N'Lodygin', N'Yuri', N'12', 4, CAST(N'1990-05-26T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25630, N'Dzyuba', N'Artem', N'22', 3, CAST(N'1988-08-22T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25667, N'Babacan', N'Volkan', N'1', 4, CAST(N'1988-08-12T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25671, N'Tufan', N'Ozan', N'16', 2, CAST(N'1995-03-23T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25672, N'Özyakup', N'Oğuzhan', N'14', 2, CAST(N'1992-09-23T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25680, N'Berg', N'Marcus', N'11', 3, CAST(N'1986-08-17T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25681, N'Hinterseer', N'Lukas', N'19', 3, CAST(N'1991-03-28T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25702, N'Magnússon', N'Hörður Björgvin', N'19', 1, CAST(N'1993-02-11T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25703, N'Böðvarsson', N'Jón Daði', N'15', 3, CAST(N'1992-05-25T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (25904, N'Williams', N'George', N'13', 3, CAST(N'1995-09-07T00:00:00.0000000' AS DateTime2), 390)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (26154, N'Jónsson', N'Ingvar', N'13', 4, CAST(N'1989-10-18T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (26416, N'Lafferty', N'Kyle', N'10', 3, CAST(N'1987-09-16T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (26469, N'Korhut', N'Mihály', N'3', 1, CAST(N'1988-12-01T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (26589, N'Kalinić', N'Lovre', N'12', 4, CAST(N'1990-04-03T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (26616, N'Carlgren', N'Patrik', N'23', 4, CAST(N'1992-01-08T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (26629, N'Lang', N'Ádám', N'2', 1, CAST(N'1993-01-17T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (26647, N'Duda', N'Ondrej', N'8', 2, CAST(N'1994-12-05T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (26677, N'Augustinsson', N'Ludwig', N'17', 1, CAST(N'1994-04-21T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (26900, N'Pjaca', N'Marko', N'20', 3, CAST(N'1995-05-06T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (26967, N'Jansson', N'Pontus', N'13', 1, CAST(N'1991-02-13T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (27052, N'Pellè', N'Graziano', N'9', 3, CAST(N'1985-07-15T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (27090, N'Gashi', N'Shkëlzen', N'11', 3, CAST(N'1988-07-15T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (27098, N'Butko', N'Bohdan', N'2', 1, CAST(N'1991-01-13T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (27357, N'Fedetskyi', N'Artem', N'17', 1, CAST(N'1985-04-26T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (27398, N'Hector', N'Jonas', N'3', 1, CAST(N'1990-05-27T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (27406, N'Wimmer', N'Kevin', N'16', 1, CAST(N'1992-11-15T00:00:00.0000000' AS DateTime2), 420)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (27431, N'Andone', N'Florin', N'14', 3, CAST(N'1993-04-11T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (27520, N'Bernardeschi', N'Federico', N'21', 2, CAST(N'1994-02-16T00:00:00.0000000' AS DateTime2), 417)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (27633, N'Kanté', N'N''Golo', N'5', 2, CAST(N'1991-03-29T00:00:00.0000000' AS DateTime2), 406)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (27853, N'Sânmărtean', N'Lucian', N'17', 2, CAST(N'1980-03-13T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (27892, N'Kabasele', N'Christian', N'18', 1, CAST(N'1991-02-24T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (28206, N'Ćorić', N'Ante', N'18', 2, CAST(N'1997-04-14T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (28630, N'Sané', N'Leroy', N'20', 2, CAST(N'1996-01-11T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (30670, N'Köybaşı', N'İsmail', N'13', 1, CAST(N'1989-07-10T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (30710, N'Denayer', N'Jason', N'15', 1, CAST(N'1995-06-28T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (30768, N'Vázquez', N'Lucas', N'9', 3, CAST(N'1991-07-01T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31336, N'Johansson', N'Erik', N'3', 1, CAST(N'1988-12-30T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31339, N'Olsen', N'Robin', N'12', 4, CAST(N'1990-01-08T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31342, N'Forsberg', N'Emil', N'6', 2, CAST(N'1991-10-23T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31452, N'Kadeřábek', N'Pavel', N'2', 1, CAST(N'1992-04-25T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31453, N'Dočkal', N'Bořek', N'9', 2, CAST(N'1988-09-30T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31454, N'Krejčí', N'Ladislav', N'19', 2, CAST(N'1992-07-05T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31543, N'Bjarnason', N'Theódór Elmar', N'18', 2, CAST(N'1987-03-04T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31561, N'Lukaku', N'Jordan', N'21', 1, CAST(N'1994-07-25T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31579, N'Budkivskyi', N'Pylyp', N'15', 3, CAST(N'1992-03-10T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31601, N'Mączyński', N'Krzysztof', N'5', 2, CAST(N'1987-05-23T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31602, N'Starzyński', N'Filip', N'23', 2, CAST(N'1991-05-27T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31659, N'Dibusz', N'Dénes', N'12', 4, CAST(N'1990-11-16T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31660, N'Juhász', N'Roland', N'23', 1, CAST(N'1983-07-01T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31667, N'Priskin', N'Tamás', N'19', 3, CAST(N'1986-09-27T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31668, N'Nikolić', N'Nemanja', N'17', 3, CAST(N'1987-12-31T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31713, N'Abrashi', N'Amir', N'22', 2, CAST(N'1990-03-27T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31717, N'Cikalleshi', N'Sokol', N'16', 3, CAST(N'1990-07-27T00:00:00.0000000' AS DateTime2), 410)
GO
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (31801, N'Meunier', N'Thomas', N'16', 1, CAST(N'1991-09-12T00:00:00.0000000' AS DateTime2), 430)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (32018, N'Yusupov', N'Artur', N'7', 2, CAST(N'1989-09-01T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (32077, N'Elvedi', N'Nico', N'4', 1, CAST(N'1996-09-30T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (32180, N'Rico', N'Sergio', N'23', 4, CAST(N'1993-09-01T00:00:00.0000000' AS DateTime2), 414)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (32562, N'McNair', N'Paddy', N'17', 1, CAST(N'1995-04-27T00:00:00.0000000' AS DateTime2), 423)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (32624, N'Weiss', N'Vladimír', N'7', 2, CAST(N'1989-11-30T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (32645, N'Hoxha', N'Alban', N'23', 4, CAST(N'1987-11-23T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (32958, N'Isaksson', N'Andreas', N'1', 4, CAST(N'1981-10-03T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (33408, N'Tekin', N'Harun', N'23', 4, CAST(N'1989-06-17T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (33410, N'Kristinsson', N'Ögmundur', N'12', 4, CAST(N'1989-06-19T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (33416, N'Shevchenko', N'Mykyta', N'23', 4, CAST(N'1993-01-26T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (33436, N'Pintér', N'Ádám', N'16', 1, CAST(N'1988-06-12T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (33437, N'Fiola', N'Attila', N'5', 1, CAST(N'1990-02-17T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (33455, N'Rog', N'Marko', N'15', 2, CAST(N'1995-07-19T00:00:00.0000000' AS DateTime2), 416)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (33458, N'Memushaj', N'Ledian', N'9', 2, CAST(N'1986-12-07T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (34382, N'Pereira', N'Danilo', N'13', 2, CAST(N'1991-09-09T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (34669, N'Kovalenko', N'Viktor', N'9', 2, CAST(N'1996-02-14T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (40597, N'Traustason', N'Arnór Ingvi', N'21', 2, CAST(N'1993-04-30T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (40598, N'Kujović', N'Emir', N'19', 3, CAST(N'1988-06-22T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (40637, N'Sigurjónsson', N'Rúnar Már', N'16', 2, CAST(N'1990-06-18T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (40698, N'Lewicki', N'Oscar', N'18', 2, CAST(N'1992-07-14T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (40707, N'Hauksson', N'Haukur', N'3', 1, CAST(N'1991-09-01T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (40805, N'Özbayraklı', N'Şener', N'22', 1, CAST(N'1990-01-23T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (40822, N'Greguš', N'Ján', N'6', 2, CAST(N'1991-01-29T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (42903, N'Kimmich', N'Joshua', N'21', 1, CAST(N'1995-02-08T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (43039, N'Weigl', N'Julian', N'15', 2, CAST(N'1995-09-08T00:00:00.0000000' AS DateTime2), 419)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (45846, N'Golovin', N'Aleksandr', N'13', 2, CAST(N'1996-05-30T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (50307, N'Škoda', N'Milan', N'12', 3, CAST(N'1986-01-16T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (50367, N'Ivanov', N'Oleg', N'18', 2, CAST(N'1986-08-04T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (50414, N'Koubek', N'Tomáš', N'23', 4, CAST(N'1992-08-26T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (50424, N'Skalák', N'Jiří', N'20', 2, CAST(N'1992-03-12T00:00:00.0000000' AS DateTime2), 387)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (52443, N'Tarashaj', N'Shani', N'17', 3, CAST(N'1995-02-07T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (56022, N'Lindelöf', N'Victor', N'14', 1, CAST(N'1994-07-17T00:00:00.0000000' AS DateTime2), 422)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (56705, N'Kapustka', N'Bartosz', N'21', 2, CAST(N'1996-12-23T00:00:00.0000000' AS DateTime2), 427)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (56708, N'Fernandes', N'Gélson', N'16', 2, CAST(N'1986-09-02T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (56717, N'Filip', N'Steliano', N'16', 1, CAST(N'1994-05-15T00:00:00.0000000' AS DateTime2), 395)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (56721, N'Nagy', N'Ádám', N'8', 2, CAST(N'1995-06-17T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (56940, N'Zakaria', N'Denis', N'14', 2, CAST(N'1996-11-20T00:00:00.0000000' AS DateTime2), 411)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (57953, N'Karavayev', N'Oleksandr', N'22', 2, CAST(N'1992-06-02T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (58164, N'Shishkin', N'Roman', N'2', 1, CAST(N'1987-01-27T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (59025, N'Sanches', N'Renato', N'16', 2, CAST(N'1997-08-18T00:00:00.0000000' AS DateTime2), 424)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (59041, N'Marinato', N'Guilherme', N'16', 4, CAST(N'1985-12-12T00:00:00.0000000' AS DateTime2), 385)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (59249, N'Kleinheisler', N'László', N'15', 2, CAST(N'1994-04-08T00:00:00.0000000' AS DateTime2), 396)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (59320, N'Veseli', N'Frederic', N'6', 1, CAST(N'1992-11-20T00:00:00.0000000' AS DateTime2), 410)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (59440, N'Çalık', N'Ahmet Yılmaz', N'4', 1, CAST(N'1994-06-22T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (59450, N'Ingason', N'Sverrir Ingi', N'5', 1, CAST(N'1993-08-05T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (59451, N'Hermannsson', N'Hjörtur', N'4', 1, CAST(N'1995-02-08T00:00:00.0000000' AS DateTime2), 412)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (59778, N'Škriniar', N'Milan', N'14', 1, CAST(N'1995-02-11T00:00:00.0000000' AS DateTime2), 404)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (60051, N'Rashford', N'Marcus', N'22', 3, CAST(N'1997-10-31T00:00:00.0000000' AS DateTime2), 431)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (65435, N'Mor', N'Emre', N'21', 3, CAST(N'1997-07-24T00:00:00.0000000' AS DateTime2), 397)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (67197, N'Zinchenko', N'Oleksandr', N'21', 2, CAST(N'1996-12-15T00:00:00.0000000' AS DateTime2), 399)
INSERT [dbo].[Players] ([Id], [Lastname], [Firstname], [ShirtNumber], [PositionId], [Date_of_birth], [Team_id]) VALUES (67812, N'Bese', N'Barnabás', N'21', 1, CAST(N'1994-05-06T00:00:00.0000000' AS DateTime2), 396)
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([Id], [Position]) VALUES (1, N'Defender')
INSERT [dbo].[Position] ([Id], [Position]) VALUES (2, N'Midfield')
INSERT [dbo].[Position] ([Id], [Position]) VALUES (3, N'Forward')
INSERT [dbo].[Position] ([Id], [Position]) VALUES (4, N'Goalkeeper')
SET IDENTITY_INSERT [dbo].[Position] OFF
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Id], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Region] ([Id], [Name]) VALUES (2, N'Asia')
INSERT [dbo].[Region] ([Id], [Name]) VALUES (3, N'Africa')
INSERT [dbo].[Region] ([Id], [Name]) VALUES (4, N'America')
INSERT [dbo].[Region] ([Id], [Name]) VALUES (5, N'Oceania')
SET IDENTITY_INSERT [dbo].[Region] OFF
SET IDENTITY_INSERT [dbo].[StageGame] ON 

INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (2, 753, 751, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (3, 680, 1160, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (4, 751, 1160, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (5, 753, 680, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (6, 1160, 753, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (7, 751, 680, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (8, 754, 2416, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (9, 2190, 682, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (10, 2416, 682, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (11, 754, 2190, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (12, 682, 754, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (13, 2416, 2190, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (14, 1155, 712, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (15, 624, 1158, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (16, 712, 1158, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (17, 1155, 624, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (18, 1158, 1155, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (19, 712, 624, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (20, 1156, 752, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (21, 669, 2131, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (22, 752, 2131, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (23, 1156, 669, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (24, 2131, 1156, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (25, 752, 669, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (26, 2415, 1162, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (27, 2129, 1161, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (28, 1162, 1161, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (29, 2415, 2129, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (30, 1161, 2415, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (31, 1162, 2129, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (32, 1159, 681, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (33, 672, 1157, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (34, 681, 1157, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (35, 1159, 672, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (36, 1157, 1159, 1007, N'GroupStage', NULL, NULL, NULL)
INSERT [dbo].[StageGame] ([Id], [TeamA_Id], [TeamB_Id], [TournamentId], [Stage], [TeamAGoals], [TeamBGoals], [OnGoing]) VALUES (37, 681, 672, 1007, N'GroupStage', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[StageGame] OFF
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (385, N'Russia', N'RUS', N'russia.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (386, N'Luxembourg', N'LUX', N'luxembourg.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (387, N'Czech Republic', N'CZH', N'czech-republic.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (388, N'Armenia', N'ARM', N'armenia.png', 2, 1)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (389, N'FYR Macedonia', N'MKD', N'macedonia.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (390, N'Wales', N'WAL', N'wales.png', 1, 1)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (391, N'Norway', N'NOR', N'norway.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (392, N'Cyprus', N'CYP', N'cyprus.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (393, N'Malta', N'MLT', N'malta.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (394, N'Denmark', N'DEN', N'denmark.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (395, N'Romania', N'ROU', N'romania.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (396, N'Hungary', N'HUN', N'hungary.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (397, N'Turkey', N'TUR', N'turkey.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (398, N'Andorra', N'AND', N'andorra.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (399, N'Ukraine', N'UKR', N'ukraine.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (400, N'San Marino', N'SMR', N'san-marino.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (401, N'Latvia', N'LVA', N'latvia.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (402, N'Lithuania', N'LTU', N'lithuania.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (403, N'Bosnia and Herzegovina', N'BIH', N'bosnia-and-herzegovina.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (404, N'Slovakia', N'SVK', N'slovakia.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (405, N'Georgia', N'GEO', N'georgia.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (406, N'France', N'FRA', N'france.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (407, N'Estonia', N'EST', N'estonia.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (408, N'Netherlands', N'NED', N'netherlands.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (409, N'Slovenia', N'SVN', N'slovenia.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (410, N'Albania', N'ALB', N'albania.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (411, N'Switzerland', N'SUI', N'switzerland.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (412, N'Iceland', N'ISL', N'iceland.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (413, N'Finland', N'FIN', N'finland.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (414, N'Spain', N'ESP', N'spain.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (415, N'Serbia', N'SRB', N'serbia.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (416, N'Croatia', N'CRO', N'croatia.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (417, N'Italy', N'ITA', N'italy.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (418, N'Bulgaria', N'BUL', N'bulgaria.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (419, N'Germany', N'GER', N'germany.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (420, N'Austria', N'AUT', N'austria.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (421, N'Republic of Ireland', N'ROI', N'ireland.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (422, N'Sweden', N'SWE', N'sweden.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (423, N'Northern Ireland', N'NIR', N'north-ireland.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (424, N'Portugal', N'POR', N'portugal.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (425, N'Liechtenstein', N'LIE', N'liechtenstein.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (426, N'Greece', N'GRE', N'greece.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (427, N'Poland', N'POL', N'poland.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (428, N'Montenegro', N'MNE', N'montenegro.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (429, N'Scotland', N'SCO', N'scotland.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (430, N'Belgium', N'BEL', N'belgium.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (431, N'England', N'ENG', N'england.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (432, N'Moldova', N'MDA', N'moldova.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (433, N'Israel', N'ISR', N'israel.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (434, N'Azerbaijan', N'AZE', N'azerbaijan.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (435, N'Kazakhstan', N'KAZ', N'kazakhstan.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (436, N'Faroe Islands ', N'FRO', N'faroe-islands.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (437, N'Belarus', N'BLR', N'belarus.png', 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (523, N'Chile', N'CHI', N'chile.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (524, N'United States', N'USA', N'usa.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (624, N'South Africa', N'RSA', N'south-africa.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (625, N'Brazil', N'BRA', N'brazil.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (637, N'Mexico', N'MEX', N'mexico.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (638, N'Ecuador', N'ECU', N'ecuador.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (669, N'Cameroon', N'CMR', N'cameroon.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (670, N'Australia', N'AUS', N'australia.png', 5, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (671, N'Colombia', N'COL', N'colombia.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (672, N'Ivory Coast', N'CIV', N'ivory-coast.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (673, N'Japan', N'JPN', N'japan.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (674, N'Uruguay', N'URU', N'uruguay.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (675, N'Costa Rica', N'CRC', N'costa-rica.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (676, N'Honduras', N'HON', N'honduras.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (677, N'Argentina', N'ARG', N'argentina.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (679, N'Iran', N'IRN', N'iran.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (680, N'Nigeria', N'NGA', N'nigeria.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (681, N'Ghana', N'GHA', N'ghana.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (682, N'Algeria', N'ALG', N'algeria.png', 3, 1)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (683, N'Korea Republic', N'KOR', N'south-korea.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (708, N'Peru', N'PER', N'peru.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (709, N'Bolivia', N'BOL', N'bolivia.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (710, N'Paraguay', N'PAR', N'paraguay.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (711, N'Panama', N'PAN', N'panama.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (712, N'Tunisia', N'TUN', N'tunisia.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (713, N'El Salvador', N'SLV', N'el-salvador.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (714, N'Jamaica', N'JAM', N'jamaica.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (751, N'Angola', N'ANG', N'angola.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (752, N'Egypt', N'EGY', N'egypt.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (753, N'Senegal', N'SEN', N'senegal.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (754, N'Mali', N'MLI', N'mali.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1061, N'Gibraltar', N'GIB', NULL, 1, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1155, N'Equatorial Guinea', N'EQG', N'equatorial-guinea.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1156, N'Burkina Faso', N'BFA', N'burkina-faso.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1157, N'Congo', N'CGO', N'republic-of-the-congo.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1158, N'Gabon', N'GAB', N'gabon.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1159, N'Zambia', N'ZAM', N'zambia.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1160, N'DR Congo', N'COD', N'democratic-republic-of-the-congo.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1161, N'Cape Verde', N'CPV', N'cape-verde.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1162, N'Guinea', N'GUI', N'guinea.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1205, N'Oman', N'OMA', N'oman.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1206, N'Kuwait', N'KUW', N'kuwait.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1208, N'Uzbekistan', N'UZB', N'uzbekistan.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1209, N'Korea DPR', N'PRK', N'north-korea.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1210, N'China PR', N'CHN', N'china.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1211, N'Saudi Arabia', N'KSA', N'saudi-arabia.png', 2, 0)
GO
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1213, N'United Arab Emirates', N'UAE', N'united-arab-emirates.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1214, N'Qatar', N'QAT', N'qatar.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1215, N'Bahrain', N'BHR', N'bahrain.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1216, N'Palestine', N'PLE', N'palestine.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1217, N'Jordan', N'JOR', N'jordan.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1218, N'Iraq', N'IRQ', N'iraq.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (1318, N'Venezuela', N'VEN', N'venezuela.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2129, N'Djibouti', N'DIJ', NULL, 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2130, N'Guatemala', N'GUA', NULL, 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2131, N'Sudan', N'SDN', N'sudan.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2190, N'Malawi', N'MWI', N'malawi.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2229, N'Laos', N'LAO', N'laos.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2230, N'Afghanistan', N'AFG', N'afghanistan.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2231, N'Bangladesh', N'BAN', NULL, 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2232, N'Cambodia', N'CAM', N'cambodia.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2233, N'Cuba', N'CUB', NULL, 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2234, N'Haiti', N'HAI', NULL, 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2235, N'Canada', N'CAN', NULL, 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2236, N'Trinidad & Tobago', N'TRI', NULL, 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2237, N'Malaysia', N'MAS', N'malaysia.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2238, N'Timor-Leste', N'TLS', N'east-timor.png', 22, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2239, N'Kyrgyzstan', N'KGZ', NULL, 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2240, N'Tajikistan', N'TJK', NULL, 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2241, N'Bhutan', N'BHU', N'bhutan.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2242, N'Hong Kong', N'HKG', N'hong-kong.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2243, N'Maldives', N'MDV', N'maldives.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2244, N'Guam', N'GUM', N'guam.png', 5, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2245, N'India', N'IND', N'india.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2246, N'Turkmenistan', N'TKM', N'turkmenistan.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2247, N'Singapore', N'SIN', N'singapore.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2248, N'Syria', N'SYR', N'syria.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2249, N'Thailand', N'THA', NULL, 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2250, N'Chinese Taipei', N'TPE', NULL, 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2251, N'Indonesia', N'IDN', NULL, 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2252, N'Vietnam', N'VIE', NULL, 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2253, N'Lebanon', N'LIB', N'lebanon.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2254, N'Myanmar', N'MYA', N'myanmar.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2256, N'Philippines', N'PHI', N'philippines.png', 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2257, N'Yemen', N'YEM', N'yemen.png', 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2260, N'Bermuda', N'BER', NULL, 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2261, N'Puerto Rico', N'PUR', NULL, 4, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2262, N'Brunei', N'BRU', NULL, 2, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2415, N'Togo', N'TOG', NULL, 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2416, N'Liberia', N'LIB', NULL, 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2417, N'Central African Republic', N'CAF', N'central-african-republic.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2418, N'Madagascar', N'MAD', N'madagascar.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2419, N'Benin', N'BEN', N'benin.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2420, N'South Sudan', N'SSD', N'south-sudan.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2421, N'Uganda', N'UGA', N'uganda.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2422, N'Botswana', N'BOT', N'botswana.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2423, N'Comoros', N'COM', N'comoros.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2424, N'Kenya', N'KEN', N'kenya.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2425, N'Guinea-Bissau', N'GNB', N'guinea-bissau.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2426, N'Morocco', N'MAR', N'morocco.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2427, N'Libya', N'LBY', N'libya.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2428, N'S�o Tom� and Pr�ncipe', N'STP', N'sao-tome-and-principe.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2429, N'Tanzania', N'TAN', N'tanzania.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2430, N'Chad', N'CHA', N'chad.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2431, N'Mozambique', N'MOZ', N'mozambique.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2432, N'Rwanda', N'RWA', N'rwanda.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2433, N'Mauritius', N'MRI', N'mauritius.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2434, N'Sierra Leone', N'SLE', N'sierra-leone.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2435, N'Ethiopia', N'ETH', N'ethiopia.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2436, N'Lesotho', N'LES', N'lesotho.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2437, N'Seychelles', N'SEY', N'seychelles.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2438, N'Niger', N'NIG', N'niger.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2439, N'Namibia', N'NAM', N'namibia.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2440, N'Burundi', N'BDI', N'burundi.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2441, N'Zimbabwe', N'ZIM', N'zimbabwe.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2442, N'Swaziland', N'SWZ', N'swaziland.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2443, N'Gambia', N'GAM', N'gambia.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (2444, N'Mauritania', N'MTN', N'mauritania.png', 3, 0)
INSERT [dbo].[Teams] ([Id], [Name], [CountryCode], [FlagUrl], [Region], [Removed]) VALUES (3233, N'Saint Vincent and the Grenadines', N'SVG', N'saint-vincent-and-the-grenadines.png', 4, 0)
SET IDENTITY_INSERT [dbo].[Teams] OFF
SET IDENTITY_INSERT [dbo].[Tournaments] ON 

INSERT [dbo].[Tournaments] ([Id], [Name], [StartDate], [EndDate]) VALUES (1, N'Test', CAST(N'2020-09-06T00:00:00.0000000' AS DateTime2), CAST(N'2020-09-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Tournaments] ([Id], [Name], [StartDate], [EndDate]) VALUES (2, N'World Cup', CAST(N'2014-06-12T00:00:00.0000000' AS DateTime2), CAST(N'2014-07-13T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Tournaments] ([Id], [Name], [StartDate], [EndDate]) VALUES (3, N'Africa Cup of Nations', CAST(N'2015-01-17T00:00:00.0000000' AS DateTime2), CAST(N'2015-02-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Tournaments] ([Id], [Name], [StartDate], [EndDate]) VALUES (4, N'AFC Asian Cup', CAST(N'2015-01-09T00:00:00.0000000' AS DateTime2), CAST(N'2015-01-31T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Tournaments] ([Id], [Name], [StartDate], [EndDate]) VALUES (5, N'Copa America', CAST(N'2016-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2016-06-26T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Tournaments] ([Id], [Name], [StartDate], [EndDate]) VALUES (6, N'European Championship', CAST(N'2016-06-10T00:00:00.0000000' AS DateTime2), CAST(N'2016-07-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Tournaments] ([Id], [Name], [StartDate], [EndDate]) VALUES (1007, N'Abc', CAST(N'2020-09-07T00:00:00.0000000' AS DateTime2), CAST(N'2020-09-08T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Tournaments] OFF
SET IDENTITY_INSERT [dbo].[TournamentTeams] ON 

INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (624, 1007, 1173, N'C3        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (669, 1007, 1174, N'D3        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (672, 1007, 1175, N'F3        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (680, 1007, 1176, N'A3        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (681, 1007, 1177, N'F2        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (682, 1007, 1178, N'B4        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (712, 1007, 1179, N'C2        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (751, 1007, 1180, N'A2        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (752, 1007, 1181, N'D2        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (753, 1007, 1182, N'A1        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (754, 1007, 1183, N'B1        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (1155, 1007, 1184, N'C1        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (1156, 1007, 1185, N'D1        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (1157, 1007, 1186, N'F4        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (1158, 1007, 1187, N'C4        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (1159, 1007, 1188, N'F1        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (1160, 1007, 1189, N'A4        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (1161, 1007, 1190, N'E4        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (1162, 1007, 1191, N'E2        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (2129, 1007, 1192, N'E3        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (2131, 1007, 1193, N'D4        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (2190, 1007, 1194, N'B3        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (2415, 1007, 1195, N'E1        ')
INSERT [dbo].[TournamentTeams] ([TeamId], [TournamentId], [Id], [GroupCode]) VALUES (2416, 1007, 1196, N'B2        ')
SET IDENTITY_INSERT [dbo].[TournamentTeams] OFF
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Position] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([Id])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Position]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Teams] FOREIGN KEY([Team_id])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Teams]
GO
ALTER TABLE [dbo].[StageGame]  WITH CHECK ADD  CONSTRAINT [FK_StageGame_Teams] FOREIGN KEY([TeamA_Id])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[StageGame] CHECK CONSTRAINT [FK_StageGame_Teams]
GO
ALTER TABLE [dbo].[StageGame]  WITH CHECK ADD  CONSTRAINT [FK_StageGame_Teams1] FOREIGN KEY([TeamB_Id])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[StageGame] CHECK CONSTRAINT [FK_StageGame_Teams1]
GO
ALTER TABLE [dbo].[StageGame]  WITH CHECK ADD  CONSTRAINT [FK_StageGame_Tournaments] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([Id])
GO
ALTER TABLE [dbo].[StageGame] CHECK CONSTRAINT [FK_StageGame_Tournaments]
GO
ALTER TABLE [dbo].[TournamentTeams]  WITH CHECK ADD  CONSTRAINT [FK_TournamentTeams_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[TournamentTeams] CHECK CONSTRAINT [FK_TournamentTeams_Teams]
GO
ALTER TABLE [dbo].[TournamentTeams]  WITH CHECK ADD  CONSTRAINT [FK_TournamentTeams_Tournaments] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([Id])
GO
ALTER TABLE [dbo].[TournamentTeams] CHECK CONSTRAINT [FK_TournamentTeams_Tournaments]
GO
USE [master]
GO
ALTER DATABASE [IctSkills2016] SET  READ_WRITE 
GO
