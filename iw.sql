USE [master]
GO
/****** Object:  Database [izi_watch_db]    Script Date: 16/06/2016 16:08:59 ******/
CREATE DATABASE [izi_watch_db]
GO
ALTER DATABASE [izi_watch_db] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [izi_watch_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [izi_watch_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [izi_watch_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [izi_watch_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [izi_watch_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [izi_watch_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [izi_watch_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [izi_watch_db] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [izi_watch_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [izi_watch_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [izi_watch_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [izi_watch_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [izi_watch_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [izi_watch_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [izi_watch_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [izi_watch_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [izi_watch_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [izi_watch_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [izi_watch_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [izi_watch_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [izi_watch_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [izi_watch_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [izi_watch_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [izi_watch_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [izi_watch_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [izi_watch_db] SET  MULTI_USER 
GO
ALTER DATABASE [izi_watch_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [izi_watch_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [izi_watch_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [izi_watch_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [izi_watch_db]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 16/06/2016 16:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](200) NOT NULL,
	[image] [text] NOT NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 16/06/2016 16:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 16/06/2016 16:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](200) NOT NULL,
	[text] [text] NOT NULL,
	[article_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Popularity]    Script Date: 16/06/2016 16:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Popularity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[viewed] [tinyint] NOT NULL,
	[liked] [tinyint] NOT NULL,
	[article_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Popularity] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Social]    Script Date: 16/06/2016 16:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Social](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[account] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Social] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SocialArticle]    Script Date: 16/06/2016 16:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialArticle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NOT NULL,
	[social_id] [int] NOT NULL,
 CONSTRAINT [PK_SocialArticle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 16/06/2016 16:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[admin] [tinyint] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Category]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Article] FOREIGN KEY([article_id])
REFERENCES [dbo].[Article] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Article]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Popularity]  WITH CHECK ADD  CONSTRAINT [FK_Popularity_Article] FOREIGN KEY([article_id])
REFERENCES [dbo].[Article] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Popularity] CHECK CONSTRAINT [FK_Popularity_Article]
GO
ALTER TABLE [dbo].[Popularity]  WITH CHECK ADD  CONSTRAINT [FK_Popularity_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Popularity] CHECK CONSTRAINT [FK_Popularity_User]
GO
ALTER TABLE [dbo].[SocialArticle]  WITH CHECK ADD  CONSTRAINT [FK_SocialArticle_Article] FOREIGN KEY([article_id])
REFERENCES [dbo].[Article] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SocialArticle] CHECK CONSTRAINT [FK_SocialArticle_Article]
GO
ALTER TABLE [dbo].[SocialArticle]  WITH CHECK ADD  CONSTRAINT [FK_SocialArticle_Social] FOREIGN KEY([social_id])
REFERENCES [dbo].[Social] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SocialArticle] CHECK CONSTRAINT [FK_SocialArticle_Social]
GO
USE [master]
GO
ALTER DATABASE [izi_watch_db] SET  READ_WRITE 
GO
