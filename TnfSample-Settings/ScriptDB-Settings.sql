USE [master]
GO
/****** Object:  Database [SampleAppDb1]    Script Date: 13/03/2017 15:06:50 ******/
CREATE DATABASE [SampleAppDb1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SimpleTaskAppDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SampleAppDb1.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SimpleTaskAppDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SampleAppDb1_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SampleAppDb1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SampleAppDb1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SampleAppDb1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SampleAppDb1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SampleAppDb1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SampleAppDb1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SampleAppDb1] SET ARITHABORT OFF 
GO
ALTER DATABASE [SampleAppDb1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SampleAppDb1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SampleAppDb1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SampleAppDb1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SampleAppDb1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SampleAppDb1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SampleAppDb1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SampleAppDb1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SampleAppDb1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SampleAppDb1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SampleAppDb1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SampleAppDb1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SampleAppDb1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SampleAppDb1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SampleAppDb1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SampleAppDb1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SampleAppDb1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SampleAppDb1] SET RECOVERY FULL 
GO
ALTER DATABASE [SampleAppDb1] SET  MULTI_USER 
GO
ALTER DATABASE [SampleAppDb1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SampleAppDb1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SampleAppDb1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SampleAppDb1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SampleAppDb1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SampleAppDb1', N'ON'
GO
USE [SampleAppDb1]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 13/03/2017 15:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreationTime] [datetime] NOT NULL,
	[State] [tinyint] NOT NULL,
	[Title] [varchar](max) NULL,
 CONSTRAINT [PK_dbo.Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TnfSettings]    Script Date: 03/04/2017 11:12:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TnfSettings](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NULL,
	[Name] [varchar](256) NULL,
	[Value] [varchar](2000) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime] NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TnfSettings] ON 

INSERT [dbo].[TnfSettings] ([Id], [TenantId], [UserId], [Name], [Value], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (8, NULL, NULL, N'Setting1', N'1', 0, NULL, NULL, NULL, NULL, CAST(N'2017-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TnfSettings] ([Id], [TenantId], [UserId], [Name], [Value], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (9, NULL, NULL, N'Setting2', N'B', 0, NULL, NULL, NULL, NULL, CAST(N'2017-01-01 00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[TnfSettings] OFF

USE [master]
GO
ALTER DATABASE [SampleAppDb1] SET  READ_WRITE 
GO
