USE [master]
GO
/****** Object:  Database [SampleAppDb]    Script Date: 13/03/2017 15:06:50 ******/
CREATE DATABASE [SampleAppDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SimpleTaskAppDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SampleAppDb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SimpleTaskAppDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SampleAppDb_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SampleAppDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SampleAppDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SampleAppDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SampleAppDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SampleAppDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SampleAppDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SampleAppDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SampleAppDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SampleAppDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SampleAppDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SampleAppDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SampleAppDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SampleAppDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SampleAppDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SampleAppDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SampleAppDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SampleAppDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SampleAppDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SampleAppDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SampleAppDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SampleAppDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SampleAppDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SampleAppDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SampleAppDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SampleAppDb] SET RECOVERY FULL 
GO
ALTER DATABASE [SampleAppDb] SET  MULTI_USER 
GO
ALTER DATABASE [SampleAppDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SampleAppDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SampleAppDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SampleAppDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SampleAppDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SampleAppDb', N'ON'
GO
USE [SampleAppDb]
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
/****** Object:  Table [dbo].[TnfLanguages]    Script Date: 13/03/2017 15:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TnfLanguages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[Name] [nvarchar](10) NOT NULL,
	[DisplayName] [nvarchar](64) NOT NULL,
	[Icon] [nvarchar](128) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime] NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpLanguages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TnfLanguageTexts]    Script Date: 13/03/2017 15:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TnfLanguageTexts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[LanguageName] [nvarchar](10) NOT NULL,
	[Source] [nvarchar](128) NOT NULL,
	[Key] [nvarchar](256) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[LastModificationTime] [datetime] NULL,
	[LastModifierUserId] [bigint] NULL,
	[CreationTime] [datetime] NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_dbo.AbpLanguageTexts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[TnfLanguages] ON 

INSERT [dbo].[TnfLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (2, NULL, N'en', N'English', N'famfamfam-flags gb', 0, NULL, NULL, NULL, NULL, CAST(N'2017-02-16 10:53:32.873' AS DateTime), NULL)
INSERT [dbo].[TnfLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDeleted], [DeleterUserId], [DeletionTime], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (3, NULL, N'pt-BR', N'Português-BR', N'famfamfam-flags br', 0, NULL, NULL, NULL, NULL, CAST(N'2017-02-16 10:55:14.277' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[TnfLanguages] OFF
SET IDENTITY_INSERT [dbo].[TnfLanguageTexts] ON 

INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (2, NULL, N'en', N'SampleApp', N'TaskState_Open', N'Open', NULL, NULL, CAST(N'2017-02-16 15:09:10.600' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (3, NULL, N'en', N'SampleApp', N'TaskList', N'Task List', NULL, NULL, CAST(N'2017-03-13 10:12:45.313' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (4, NULL, N'en', N'SampleApp', N'TaskState_Completed', N'Completed', NULL, NULL, CAST(N'2017-03-13 10:13:04.130' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (5, NULL, N'en', N'SampleApp', N'AllTasks', N'All Tasks', NULL, NULL, CAST(N'2017-03-13 10:13:33.473' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (6, NULL, N'en', N'SampleApp', N'Unassigned', N'Unassigned', NULL, NULL, CAST(N'2017-03-13 10:18:34.770' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (7, NULL, N'en', N'SampleApp', N'NewTask', N'New Task', NULL, NULL, CAST(N'2017-03-13 10:18:55.617' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (8, NULL, N'en', N'SampleApp', N'Title', N'Title', NULL, NULL, CAST(N'2017-03-13 10:19:05.743' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (9, NULL, N'en', N'SampleApp', N'Description', N'Description', NULL, NULL, CAST(N'2017-03-13 10:19:15.403' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (10, NULL, N'en', N'SampleApp', N'Save', N'Save', NULL, NULL, CAST(N'2017-03-13 10:19:21.910' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (11, NULL, N'en', N'SampleApp', N'AddNew', N'Add New', NULL, NULL, CAST(N'2017-03-13 10:19:31.080' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (12, NULL, N'en', N'SampleApp', N'AssignedPerson', N'Assigned Person', NULL, NULL, CAST(N'2017-03-13 10:19:41.390' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (13, NULL, N'pt-BR', N'SampleApp', N'TaskState_Open', N'Lista de tarefas', NULL, NULL, CAST(N'2017-03-13 10:21:24.423' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (14, NULL, N'pt-BR', N'SampleApp', N'TaskList', N'Aberta', NULL, NULL, CAST(N'2017-03-13 10:21:58.120' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (15, NULL, N'pt-BR', N'SampleApp', N'TaskState_Completed', N'Finalizada', NULL, NULL, CAST(N'2017-03-13 10:22:06.390' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (16, NULL, N'pt-BR', N'SampleApp', N'AllTasks', N'Todas as tarefas', NULL, NULL, CAST(N'2017-03-13 10:22:17.047' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (17, NULL, N'pt-BR', N'SampleApp', N'Unassigned', N'Sem responsável', NULL, NULL, CAST(N'2017-03-13 10:22:29.643' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (18, NULL, N'pt-BR', N'SampleApp', N'NewTask', N'Nova tarefa', NULL, NULL, CAST(N'2017-03-13 10:22:42.633' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (19, NULL, N'pt-BR', N'SampleApp', N'Title', N'Título', NULL, NULL, CAST(N'2017-03-13 10:22:53.660' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (20, NULL, N'pt-BR', N'SampleApp', N'Description', N'Descrição', NULL, NULL, CAST(N'2017-03-13 10:23:02.260' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (21, NULL, N'pt-BR', N'SampleApp', N'Save', N'Salvar', NULL, NULL, CAST(N'2017-03-13 10:23:09.093' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (22, NULL, N'pt-BR', N'SampleApp', N'AddNew', N'Adicionar tarefa', NULL, NULL, CAST(N'2017-03-13 10:23:22.947' AS DateTime), NULL)
INSERT [dbo].[TnfLanguageTexts] ([Id], [TenantId], [LanguageName], [Source], [Key], [Value], [LastModificationTime], [LastModifierUserId], [CreationTime], [CreatorUserId]) VALUES (23, NULL, N'pt-BR', N'SampleApp', N'AssignedPerson', N'Responsável', NULL, NULL, CAST(N'2017-03-13 10:23:38.773' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[TnfLanguageTexts] OFF
USE [master]
GO
ALTER DATABASE [SampleAppDb] SET  READ_WRITE 
GO
