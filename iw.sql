USE [master]
GO
/****** Object:  Database [IziWatch]    Script Date: 02/07/2016 04:01:23 ******/
CREATE DATABASE [IziWatch]
GO
ALTER DATABASE [IziWatch] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IziWatch].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IziWatch] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IziWatch] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IziWatch] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IziWatch] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IziWatch] SET ARITHABORT OFF 
GO
ALTER DATABASE [IziWatch] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IziWatch] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IziWatch] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IziWatch] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IziWatch] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IziWatch] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IziWatch] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IziWatch] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IziWatch] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IziWatch] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IziWatch] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IziWatch] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IziWatch] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IziWatch] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IziWatch] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IziWatch] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IziWatch] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IziWatch] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IziWatch] SET  MULTI_USER 
GO
ALTER DATABASE [IziWatch] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IziWatch] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IziWatch] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IziWatch] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [IziWatch]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Article]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](200) NOT NULL,
	[image] [text] NOT NULL,
	[category_id] [int] NOT NULL,
	[text] [text] NOT NULL,
	[date] [datetime] NOT NULL,
	[views] [int] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Category]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Category](
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
/****** Object:  Table [dbo].[T_Comment]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Comment](
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
/****** Object:  Table [dbo].[T_Popularity]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Popularity](
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
/****** Object:  Table [dbo].[T_Social]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Social](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[identifier] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Social] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SocialArticle]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_SocialArticle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[social_id] [int] NOT NULL,
	[text] [text] NOT NULL,
	[image] [text] NULL,
 CONSTRAINT [PK_SocialArticle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_User]    Script Date: 02/07/2016 04:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201607011457297_Init', N'IziWatch.Migrations.Configuration', 0x1F8B0800000000000400DD5CDB6EE4B8117D0FB0FF20E8291B785BBE640613A3BD0B6FDBDE18195F30EDD9E46DC096D86D62244A2B515E3B41BE6C1FF693F20B294AD48D175DBAE5EEF662808145164F158B45B2582CF6FF7EFB7DFAC373E05B4F384E4848CFECA3C9A16D61EA861EA1AB333B65CBEF3ED83F7CFFCD9FA6975EF06CFD5CD09D703A68499333FB91B1E8D47112F71107289904C48DC3245CB2891B060EF242E7F8F0F06FCED1918301C2062CCB9A7E4A292301CE3EE073165217472C45FE4DE8613F11E55033CF50AD5B14E024422E3EB3AFFF4DFE8998FB38C9496DEBDC2708C498637F695B88D2902106429E7E4EF09CC5215DCD232840FEC34B84816E89FC040BE14F2BF2BEFD383CE6FD70AA8605949B262C0C06021E9D08C53872F3B5D46B978A03D55D828AD90BEF75A63ED09C87B3A24FA10F0A90199ECEFC98139FD937258BF324BAC56C52349CE4905731C0FD1AC65F2775C403AB77BB83D2908E2787FCDF81354B7D96C6F88CE294C5C83FB0EED3854FDC7FE09787F02BA66727478BE5C98777EF9177F2FEAFF8E45DBDA7D057A06B1440D17D1C463806D9F0B2ECBF6D39CD768EDCB06C566B936B056C09E6846DDDA0E78F98AED823CC96E30FB675459EB1579408E3FA4C094C2168C4E2143E6F53DF470B1F97F54E2B4FFE7F0BD7E377EF47E17A8B9EC82A1B7A893F4C9C18E6D527EC67B5C92389F2E9D518EF2F82EC2A0E03FEDDB4AFBCF6CB3C4C6397772634923CA078855953BAA953196F2F93E650E39B7581BAFFA6CD2555CD5B4BCA3BB4CE4C28586C7B3614F2BE2EDFDE16771E4530789969718DB4199CB4534DA4A60756415019CD515FA3A1D0993FF21A781920E28FB008F6E002CEC792C4012E7BF963082687E86099EF5192C01AE0FD1D258F2DA2C39F23883EC76E1A8369CE190AA257E776FF18527C9B060B6EF1DBE335DAD03CFC1A5E219785F125E5AD36C6FB18BA5FC3945D52EF0231FC99B90520FF7C20417F8051C439775D9C245760CCD89B85E05B1780D7949D1C0F86E3ABD3AE9D90998F48A0F742A475F44B415A79227A0AC51B3190E93C9236513F862B42FB895A909A45CD293A4515644345E560FD241594664133824E3973AAD17CBC6C84C677F232D8FDF7F236DBBC4D6B414D8D735821F14F98E2189631EF1E3186635A8D409F756317CE42367C9CE9ABEF4D19A79F919F8ECD6AADD9902D02E3CF860C76FF67432626143F118F7B253D8E3E0531C0F7A2D79FAABAE79C24D9B6A743A39BDB66BE9D35C0345DCE93247449360B34412F11B268CA0F3E9CD51DBFC87B23C740A06360E8846F7950027DB365A3BAA317D8C70C5BE76E1E149CA1C4459EAA46E8903740B06247D50856C5429AC2FD45E109968E63DE08F1435002339550A64E0B425D1221BF534B52CB9E5B18EF7BC943AEB9C011A69C61A726FA30D7873EB800251F6950BA3434756A16D76E8806AFD534E65D2E6C35EE4A44622B36D9E13B1BEC52F86FAF6298ED1ADB8271B6ABA48F00C630DE2E0C549C55FA1A807C70D93703954E4C0603152ED5560CB4A9B11D186853256FCE40F3236ADFF197CEABFB669ECD83F2F6B7F55675EDC0361BFAD833D3CC7D4F68C3A0058E55F3BC58F04AFCCC34873390539CCF12E1EACA26C2C1E79835433695BFABF5439D7610D988DA002B43EB001517800A9032A1060857C4F25AA5135EC400D822EED60A2BD67E09B666032A76FD22B44668BE2E958DB3D7E9A3EC59690D8A91F73A2CD4703406212F5ECD8EF7508A292EAB2AA68F2F3CC41BAE754C0C468B823A3C5783928ACE8CAEA5C234BBB5A473C886B8641B6949729F0C5A2A3A33BA96848D762B49E3140C700B365251730B1F69B215918E72B729EBA64E9E1C250AA68E218B6A7A83A288D0552DAB4A9458F33CA56AF6DD7C78BA519063386EA2C93A2AA52D39B130462B2CD5026B90F48AC409BB400C2D108FF3CCBC4021D3EEAD86E5BF6059DF3ED5412CF681829AFF2DD676E9DABEB1D1AA9E8800B882EE05DC9DC962E89AC1D737B7788A1BF251AC09DBCF423F0DA8D9BB32B7CE2FEFEAEDF3121561EA48F22BDE93A22AC5C76DEABDD7A8A833628C112A3D97F547C90C61D275E177D6B56DF245CD284568AA8E620A57ED6CD44C2E4CFF91925DC3E103D589F03A334AE4A3D40144D1408C5A4A830256ABEB8FDACC3AA963366BFA234AA9257548A96A8094F504928690F58AB5F00C1AD553F4E7A0A68CD4D1D5DAFEC89AE4913AB4A67A0D6C8DCC725D7F544D7E491D5853DD1FBB4A369157D03DDEB38C0796F536ADFC40BBD9AE65C0789DE5709C4DAF766F5F07AA150FC41237F30A9828DF4B53329EEAD633A53C88B199291930CC6B4EE3BABBB9E4B4DED19B311B77D88D65BDED0EDF8C37CC605FD52C94139D4C52722F4F76D2096E2A4E53DD8F6594E3554E625B851A614B7F49180E269C6032FFC59FF904F305BC20B841942C71C2F2BC0DFBF8F0E8587A72B33FCF5F9C24F17CCD69D4F406A639665B48C1A24F28761F51AC26446CF044A4025562CDD7D4C3CF67F67FB256A759D882FF95151F58D7C9674A7E49A1E2214EB1F55F35C1739C94F9F6B3D59E3E70E8AFD5EB7F7DC99B1E587731CC9853EB50D2E53A23DC7CF630489ABCE906D2ACFD18E2ED4EA8C67B032DAA3421D67F5EB0206C94A70585947F0ED0F3B74345D33E1FD80851F344602CBC5154687A02B00E9631FDDF834F96A5FF0FEBACFE39C03AA2199F02103A1C4C7E08D07F192A5AEE70ABD11C88B6B124657AEE4CA4DE28AB72D77B93926FBDD1445773AA07C06D9037BD8665BCB194E3D176474D46F168D8BB34ED574F23DE97CCE12AA763B709C3DBCC116EB90DFA43A506EF41329B263967F709C0DBB635531077CFB32887A5F9EE99B18994ADDD27F36EDBD84C61DE3D37B64129BB7B666BBBDA3F776C69BDB7D09D27E0AAB94486CB185D2CB82BC1360F9CC3097F118211E41E65FE2E529FD1D5968DDAC1B022313335A792C98C9589A3F05528DAD90EEBABD8F05B3B2B68DAD91A1230DB788BF5BF95B7A069E76D486BDC456AB036B15097AEDDB18EB5E53EBDA554E0464F3A32CFBB7CD6D69BF5B794F93B8A521AB3C77047FC76127D4751C99853674062AF7ADD0B7B67ED171461FF4EC8AA82E0BFA748B1DBD8354B9A6BBA0C8BCD5B92A8209122343798210FB6D4F3989125721954F31873F6B03B8BDBF19B8E05F6AEE95DCAA294419771B0F01B012FEE04B4F1CFB2979B324FEFA2EC374AC6E8028849786CFE8EFE9812DF2BE5BED2C4840C10DCBB10115D3E968C4776572F25D26D487B0209F5954ED1030E221FC0923B3A474F781DD9C0FC3EE215725FAA08A009A47B209A6A9F5E10B48A5190088CAA3D7C820D7BC1F3F7FF07682494A448540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'12075b2a-2272-46cb-a67b-8892bf787097', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'c4a2dfd7-ed83-4e63-9fef-3337dd0a21bd', N'Root')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'68d9de00-b949-4361-885b-1304a0ab2950', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5812ab9f-afd0-41e0-a97b-7e9c4d1a9fbd', N'12075b2a-2272-46cb-a67b-8892bf787097')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2a336d38-45f9-4281-8ea2-9157b82bbbf2', N'68d9de00-b949-4361-885b-1304a0ab2950')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3bd3b748-3534-43e5-8834-541baf58b3ab', N'c4a2dfd7-ed83-4e63-9fef-3337dd0a21bd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2a336d38-45f9-4281-8ea2-9157b82bbbf2', N'user@epita.fr', 0, N'ADpdGWCQIw5fQ/nn+PLqachWxHHI+AMNuY7s+hpQyMjuagqKKxgax9qMwQETFu38Cg==', N'98c2e332-24ae-4667-b227-8cee999d8658', NULL, 0, 0, NULL, 0, 0, N'user')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3bd3b748-3534-43e5-8834-541baf58b3ab', N'root@epita.fr', 0, N'AKNpJgkB44na1LIn0lpghonsHeFe/K6cctqNIGhFgNZRLwUo3FO3vqu70KP+2GualA==', N'78340bfe-7c3d-41c2-83b6-6455b46afba8', NULL, 0, 0, NULL, 0, 0, N'root')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5812ab9f-afd0-41e0-a97b-7e9c4d1a9fbd', N'admin@epita.fr', 0, N'ALlAnGG1VnhlJdYJWdoqRShhnOXMV+Ft+4NcrezTfS5IwI0qRJtG5GYetcQMk5McNA==', N'3a62bc06-a04c-4ed3-85c4-a72dd4974355', NULL, 0, 0, NULL, 0, 0, N'admin')
SET IDENTITY_INSERT [dbo].[T_Article] ON 

INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (11, N'Android Nougat : Google confirme officiellement son numéro de version', N'http://images.frandroid.com/wp-content/uploads/2016/07/android-nougat.jpg', 5, N'Hier, après un teasing de longue haleine consistant à demander conseil aux fans, Google a enfin révélé le nom de la prochaine version d’Android. C’est donc “Nougat” qui succède à Marshmallow, Lollipop et tous les autres desserts, prenant le dessus sur Nutella et autres Neyyappam. Le numéro de cette version restait néanmoins à confirmer, même si l’on avait déjà une petite idée sur le sujet. Le doute n’est désormais plus permis.

Google a publié une vidéo de la mise en place de l’habituelle statue représentant la nouvelle version d’Android dans les jardins du Googleplex, citant à cette occasion plusieurs des propositions de nom qui ont été faites. On retiendra surtout le « Nonfat, Gluten Free, Greek Yogurt », qui aurait fait un nom si agréable à prononcer', CAST(N'2016-07-02 03:15:42.553' AS DateTime), 5)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (12, N'Sony Mobile compte se désengager de certains pays, dont les États-Unis et la Chine', N'http://images.frandroid.com/wp-content/uploads/2016/05/xperia-x-performance-630x388.jpg', 8, N'Les derniers résultats financiers de Sony en faisaient état, au printemps dernier. Le Nippon, dont les résultats globaux sont satisfaisants, bénéficie essentiellement de la bonne santé de ses activités liées au jeu vidéo, tandis que sa division mobile voit ses ventes baisser et perd de l’argent, même si sa santé s’améliore. Les rumeurs de vente de sa division mobile ne sont néanmoins plus vraiment d’actualité, et Sony compte sur le succès de sa gamme Xperia X pour se refaire une santé.

À l’occasion d’une conférence dédiée à ses investisseurs, et dont le site spécialisé Xperia Blog s’est procuré la présentation, Sony Mobile a ainsi précisé la stratégie qu’il s mise en place durant l’année fiscale écoulée, et qu’il compte poursuivre pour les suivantes. Face à des résultats en croissance faible (seulement 0,3 % attendus en 2017 au lieu des 8,1 % espérés un an plus tôt) ces marchés, le Nippon compte réduire ses efforts en Chine, en Inde, aux États-Unis ou encore au Brésil, d’après la présentation dévoilée par nos confrères. Le document justifie partiellement cette orientation, puisque la slide consacrée à l’analyse du marché du smartphone par segment de prix pointe une “compétition avec les acteurs chinois et indiens” appelée à “s’intensifier sur l’entrée et le milieu de gamme”.', CAST(N'2016-07-02 03:30:47.657' AS DateTime), 1)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (13, N'Xiaomi Mi Note 2 : double capteur photo et batterie de 4000 mAh ?', N'http://images.frandroid.com/wp-content/uploads/2016/06/xiaomi-mi-note.jpg', 8, N'La prochaine star de chez Xiaomi, c’est le Mi Note 2. Et la dernière actualité à son sujet remonte au 23 juin dernier, où il a été question de trois versions du smartphone. Et à ce moment-là, il était déjà question d’une version “premium” du mobile, équipé d’un double capteur photo à l’arrière. D’après les rumeurs du jour, en provenance des médias chinois, il s’agirait de deux capteurs de 12 mégapixels.

Les autres nouveaux détails sont également intéressants. Les trois versions du Mi Note 2 devraient embarquer un écran de 5,7 pouces, mais la définition de celui-ci serait variable. Le modèle le moins bien équipé sortirait avec une dalle Full HD, tandis que le plus premium passerait sur une dalle 2K. La gamme Mi Note correspondant aux phablettes haut de gamme de Xiaomi, les mobiles sont aussi annoncés avec capteur d’empreintes digitales, fast charge, et même technologie Force Touch intégrée à l’écran.

Concernant le reste, il est évidemment fait mention d’un processeur Snadragon 820, et d’au moins 4 Go de mémoire RAM pour une version 32 Go et 6 Go de RAM pour des versions 64 et 128 Go. Enfin, la batterie des Mi Note devrait plafonner à 4000 mAh, et assurer ainsi une belle autonomie. Encore faut-il que toutes ces informations se confirment.', CAST(N'2016-07-02 03:32:00.247' AS DateTime), 2)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (15, N'Itinérance : attention, au-delà de 3 Go, Free Mobile va facturer du hors-forfait', N'http://images.frandroid.com/wp-content/uploads/2015/03/logo-free.jpg', 9, N'Bonne nouvelle pour les uns, moins bonne pour les autres. Free Mobile, qui ajoute de semaine en semaine de nouvelles destinations à son offre de roaming – l’Islande y a été ajoutée suite à sa victoire en huitième de finale de l’Euro 2016 -, vient de revoir sa grille tarifaire. Comme le relèvent nos confrères d’Univers Freebox, l’opérateur ne bloque plus l’utilisation des données à l’étranger au-delà des 3 Go mensuels accordés au mobinaute, qui peut les utiliser 35 jours par an et par pays concerné avec son forfait à 19,99 euros. Un changement pratique pour les gros consommateurs de data, mais qui devra inciter les plus gourmands à rester attentifs.

Les consommations seront en effet facturées, au-delà des 3 Go de data concédés, au tarif du hors forfait habituel. Pour les pays de l’Union européenne couverts par le Pass Destination de Free, il n’y a pas grand-chose à craindre, puisque les dernières dispositions légales ont limité à quelques centimes d’euro chaque Mo (0,057 euro/Mo). Toutefois, pour le cas d’Israël, il faudra compter 50 centimes par Mo, ou encore 15 centimes aux États-Unis. Autant dire qu’il vaudra mieux rester attentif au SMS que Free Mobile promet d’envoyer à ses clients dès que leur enveloppe de data sera épuisée afin de désactiver la 3G au besoin.

Les nouvelles dispositions de Free Mobile concernant le roaming seront appliquées à partir du 1er août, au beau milieu des vacances d’été. La grille tarifaire permettant d’anticiper d’éventuels dépassements de forfait est, elle, déjà disponible.

', CAST(N'2016-07-02 03:40:38.843' AS DateTime), 1)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (16, N'SanDisk dévoile une carte microSD de 256 Go pour faire de l’ombre à Samsung', N'http://images.frandroid.com/wp-content/uploads/2016/06/ultra-microsd-256gb-hero.jpg', 10, N'La guerre des capacités et des débits n’est pas sur le point de se terminer dans le secteur des cartes SD et microSD. SanDisk, une entreprise qui appartient à Western Digital, vient d’annoncer deux nouvelles cartes microSD de 256 Go, une Ultra et une Extreme. SanDisk n’est pas le premier à dévoiler une carte microSD d’une telle capacité, puisque Samsung lui a grillé la politesse en mai dernier, avec l’annonce de la Evo+ de 256 Go qui a détrôné SanDisk avec sa carte de 200 Go que nous avions testé.

La microSDXC Ultra de 256 Go sera disponible en août prochain, à un tarif de 149 dollars. Pour le prix, SanDisk annonce un débit en lecture de 95 Mo/s avec une certification classe 10 qui assure un débit en écriture minimal de 10 Mo/s et 25 Mo/s maximum. Pour 199 euros, SanDisk proposera lors du quatrième trimestre la version Extreme de la carte microSD, avec des débits revus à la hausse : 100 Mo/s en lecture et 90 Mo/s en écriture avec une certification U3. Ces débits sont élevés, mais pas autant que la carte Extreme Pro de 128 Go qui atteint des débits de 275 et 100 Mo/s en lecture et écriture certifiée avec la nouvelle classe vidéo V30.

Avec des débits aussi élevés, il devient de plus en plus intéressant d’utiliser les cartes microSD en tant qu’espace de stockage principal. Rappelons qu’avec les dernières versions d’Android et notamment la fonctionnalité Adoptable Storage de Marshmallow 6.0, il est possible d’utiliser la carte microSD pour installer des applications entières. Une fonction qu’on préfère activer avec des cartes mémoires rapides, afin d’éviter les ralentissements lors du lancement de l’application.', CAST(N'2016-07-02 03:42:10.657' AS DateTime), 0)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (17, N'Final Fantasy: Brave Exvius est maintenant disponible sur le Play Store', N'http://images.frandroid.com/wp-content/uploads/2016/06/final-fantasy-brave-exvius-une-630x334.jpeg', 11, N'Brave Exvius est un free to play avec des micro-transactions, ce qui ne l’empêche pas d’être jouable sans dépenser un centime. Square Enix annonce qu’il s’agit d’un retour aux origines de la série, avec un scénario original. Dans un monde qui, malgré sa protection par le pouvoir des cristaux, a sombré dans les ténèbres, deux chevaliers qui veulent rétablir la paix font la rencontre d’une jeune femme. L’incipit est peu original, mais l’est au regard de la série.Ce jeu est l’occasion de retrouver un gameplay de JRPG au tour par tour, avec des attaques physiques et magiques, les fameuses invocations et un style graphique rétro. Le jeu a entièrement été pensé pour une utilisation sur téléphone, et propose des contrôles et un affichage adaptés au support, le jeu se jouant en mode portrait. De plus, le jeu est entièrement disponible en français.', CAST(N'2016-07-02 03:43:24.000' AS DateTime), 0)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (18, N'Dilemme des vies à sauver : quel algorithme utiliser pour les véhicules autonomes ?', N'http://www.journaldugeek.com/wp-content/blogs.dir/1/files/2016/07/fa180c74717535bcdaa7cfc3fada3b50_large-640x360.jpeg', 12, N'Le cas est dramatique, mais bien réel : si vous aviez le choix entre faire un écart risquant de vous coûter la vie ou ne pas le faire et percuter une ou plusieurs personnes, que choisiriez-vous ? Et la voiture autonome, que ferait-elle ?C’est Philippa Ruth Foot, philosophe britanno-américaine, qui créa le dilemme du tramway en 1967. Un dilemme très simple : un tramway hors de contrôle se dirige vers un groupe de 5 personnes. Vous êtes sur le pont sous lequel il s’apprête à passer. Pour le stopper, il vous faut un objet lourd. Par chance, une personne énorme passe à ce moment-là. Vous avez le choix entre sacrifier cette personne et sauver les 5 autres, ou ne rien faire et laisser les 5 personnes mourir.Selon ces lois, la voiture devrait quoi qu’il arrive, protéger ses occupants. Sauf qu’Asimov ajouta une quatrième loi, nommée Loi Zéro, qui dit qu’un robot ne peut pas porter atteinte à l’humanité, ni, par son inaction, permettre que l’humanité soit exposée au danger. Elle se place en amont des trois autres lois et pose un sacré dilemme et une série de questions puisqu’il est impossible de déterminer si les vies sauvées valent plus le coup que celle(s) épargnée(s).', CAST(N'2016-07-02 03:46:41.000' AS DateTime), 0)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (19, N'Apple prépare de “nouveaux produits mobiles” sous Android', N'http://images.frandroid.com/wp-content/uploads/2014/09/1410071188000-AP_APPLE_COOK_S_FIRST_YEAR_531241451.jpg', 6, N'Si Google comme Microsoft cherchent à proposer ses services sur un maximum de plateformes, et pas simplement sur la leur, Apple de son côté a opté pour la solution inverse, à savoir réserver ses créations aux appareils de son propre écosystème, soit les iPhone, iPad et autres Mac. Néanmoins, depuis le changement de direction en 2011, la firme de Cupertino tend à s’ouvrir un peu plus au monde extérieur. Preuve en est, une nouvelle offre d’embauche qui évoque des produits sous Android.Publiée ce mercredi sur le site officiel de la marque à la pomme, l’offre d’emploi concerne un ingénieur logiciel dont le rôle sera d’aider “au portage de nouveaux produits mobiles excitants sur la plateforme Android”. Si la première pensée se tourne bien évidemment vers Apple Music, dont l’arrivée sur l’OS de Google est prévue pour cet automne, la présence d’une seconde recherche concernant cette fois-ci explicitement un ingénieur logiciel pour le concurrent de Spotify et Deezer laisse penser que ces “nouveaux produits” sont autres.Le reste de l’annonce en revanche ne laisse apparaître aucun indice quant à la nature des logiciels en question. D’aucuns espèrent déjà voir leur logiciel préféré (que ce soit iMessage ou Safari par exemple) arriver sur Android, mais cela reste des suppositions pour le moment et Apple pourrait bien nous surprendre avec un véritable “nouveau produit” inédit.', CAST(N'2016-07-02 03:49:50.000' AS DateTime), 0)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (20, N'Apple lance son programme de reprise de smartphones Android', N'http://images.frandroid.com/wp-content/uploads/2014/10/Comparatif-Xperia-Z3-Compact-Galaxy-Alpha-iPhone-63.jpg', 6, N'Il y a quelques jours, une rumeur annonçait la possibilité pour Apple de proposer une offre de reprise aux clients potentiels équipés d’un smartphone Android ou BlackBerry. L’entreprise vient d’officialiser l’opération. Il sera ainsi possible d’aller dans un Apple Store pour y déposer son smartphone Android ou Blackberry, en échange duquel Apple fournira un bon de réduction à valoir sur un iPhone. Il sera ensuite possible de se faire aider par un employé pour réaliser la migration des données, par exemple de son carnet de contacts.

Selon le site Macplus, Apple ne propose pas de grilles tarifaires. Le montant de la reprise sera estimé par un expert d’Apple, au cas par cas. On imagine toutefois qu’il existe une grille interne et qu’un Galaxy S5 de Samsung ne vaudra pas le même prix qu’un Motorola Moto E par exemple. L’état général du téléphone devrait lui aussi être pris en compte pour évaluer le montant du bon d’achat.

Tous les smartphones ne pourront pas être éligibles au programme de reprise, mais aucune liste n’a été publiée, ce qui forcera le client potentiel à se rendre dans un Apple Store. Une pratique qui devrait plus facilement pousser à l’achat. Si le smartphone n’est pas éligible, il sera possible de le faire recycler gratuitement par Apple. Il serait d’ailleurs intéressant de savoir où finissent les appareils puisqu’ils ne sont probablement pas jetés, mais plutôt réutilisés.', CAST(N'2016-07-02 03:51:57.070' AS DateTime), 1)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (21, N'Drone Lily : quand Indiegogo laisse passer des projets frauduleux', N'http://images.frandroid.com/wp-content/uploads/2015/05/Lily-drone.jpg', 2, N'En mai 2015, le drone Lily faisait le tour de la toile. Avec une coque toute mignonne, ressemblant à un personnage de dessin animé, le drone Lily promettait de pouvoir suivre à la trace son “pilote” uniquement par l’intermédiaire d’une balise à porter sur soi. Clou du spectacle, Lily pouvait décoller lorsque l’utilisateur lançait le drone en l’air et le quadricoptère était capable de décoller et d’atterrir dans l’eau. Pratique pour filmer ses exploits en kayak dans la ville inondée de Montargis.

Le produit était en précommande, sur le site officiel, depuis l’année dernière, mais des petits malins ont profité de la plateforme de financement participatif Indiegogo pour arnaquer d’honnêtes internautes.

Comme l’expliquent les sites Droning On et sUAS News, une fausse campagne Indiegogo a été créée il y a quelques mois. Elle utilisait les photos et les vidéos mises en ligne par l’équipe de Lily Robotics sur son site Internet et réclamait aux backers de l’argent en l’échange de la livraison du drone quelques mois plus tard. Cette campagne est désormais inaccessible et la plateforme précise qu’elle “est en cours d’examen par l’équipe en charge de la confiance et de la sécurité”.

On en profite pour rappeler qu’Indiegogo est l’une des rares (si ce n’est la seule) plateformes de financement participatif à permettre aux créateurs d’un projet de partir avec l’argent sans livrer le produit promis, et ce en toute légalité', CAST(N'2016-07-02 03:53:22.207' AS DateTime), 0)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (22, N'Xiaomi “Mi Drone” : et maintenant, une vidéo', N'http://images.frandroid.com/wp-content/uploads/2016/05/capture-decran-2016-05-23-a-15-37-32.png', 2, N'C’est dans deux jours que sera présenté le tout premier drone de Xiaomi, la marque chinoise dont l’activité est désormais particulièrement large, dans le domaine des objets connectés.  Un appareil dont on connaît déjà plus ou moins l’apparence grâce à un premier teaser publié par Xiaomi. Quadricoptère ou hexacoptère, on l’ignore, mais il est sûr que le drone sera doté d’un capteur permettant l’enregistrement de vidéos – vraisemblablement 4K.

Cette caméra est au centre d’une courte vidéo postée sur l’équivalent chinois de YouTube. On constate que le module sera sphérique et rotatif, ce qui promet une expérience plutôt intéressante. On parle déjà d’un tarif de 3999 yuans, soit environ 545 euros : un tarif approchant de drones haut de gamme.', CAST(N'2016-07-02 03:54:18.937' AS DateTime), 0)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (23, N'OSVR HDK 2 : Razer passe à 2,6 mégapixels pour la réalité virtuelle', N'http://images.frandroid.com/wp-content/uploads/2016/06/razer-osvr-hdk-2.png', 1, N'OSVR est le casque de réalité virtuelle réalisé en collaboration par Razer et Sensics. Pour le moment, l’appareil est disponible en version HDK, ce qui signifie Hacker Development Kit. Le kit de développement du OSVR vient de passer une nouvelle étape, avec la version 2.0 qui évolue franchement par rapport à l’ancienne version 1.4. Razer a modifié les écrans OLED intégrés au casque puisqu’il est désormais question d’une définition totale de 2160 x 1200 pixels contre du Full HD pour l’ancienne version du casque. Le taux de rafraîchissement évolue également, à 90 Hz, contre 60 Hz pour la version 1.4 du HDK.

Avec ces deux nouvelles caractéristiques, le casque OSVR se rapproche un peu plus des concurrents, le HTC Vive et l’Oculus Rift qui partagent ces caractéristiques communes. Les lentilles auraient également été revues afin d’offrir “des images plus claires et dynamiques” qui réduiraient l’effet de grille. Pour rappel, cet effet réduit la sensation d’immersion puisque l’utilisateur “voit” les pixels, à cause d’une faible définition de l’écran. Le HDK 2 d’OSVR sera disponible en juillet à un tarif de 399 dollars, soit un surcoût de 100 dollars par rapport au HDK 1.4 qui restera vendu à 299 dollars.', CAST(N'2016-07-02 03:55:54.737' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[T_Article] OFF
SET IDENTITY_INSERT [dbo].[T_Category] ON 

INSERT [dbo].[T_Category] ([id], [name]) VALUES (1, N'Réalité Virtuelle')
INSERT [dbo].[T_Category] ([id], [name]) VALUES (2, N'Drône')
INSERT [dbo].[T_Category] ([id], [name]) VALUES (5, N'Android')
INSERT [dbo].[T_Category] ([id], [name]) VALUES (6, N'Apple')
INSERT [dbo].[T_Category] ([id], [name]) VALUES (7, N'Applications')
INSERT [dbo].[T_Category] ([id], [name]) VALUES (8, N'Smartphone')
INSERT [dbo].[T_Category] ([id], [name]) VALUES (9, N'Telecom')
INSERT [dbo].[T_Category] ([id], [name]) VALUES (10, N'Hardware')
INSERT [dbo].[T_Category] ([id], [name]) VALUES (11, N'Jeux')
INSERT [dbo].[T_Category] ([id], [name]) VALUES (12, N'Auto')
SET IDENTITY_INSERT [dbo].[T_Category] OFF
SET IDENTITY_INSERT [dbo].[T_Popularity] ON 

INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (61, 1, 0, 11, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (62, 0, 0, 11, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (63, 0, 0, 11, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (64, 1, 0, 12, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (65, 0, 0, 12, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (66, 0, 0, 12, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (67, 1, 0, 13, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (68, 0, 0, 13, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (69, 0, 0, 13, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (73, 1, 0, 15, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (74, 0, 0, 15, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (75, 0, 0, 15, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (76, 0, 0, 16, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (77, 0, 0, 16, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (78, 0, 0, 16, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (79, 0, 0, 17, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (80, 0, 0, 17, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (81, 0, 0, 17, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (82, 0, 0, 18, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (83, 0, 0, 18, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (84, 0, 0, 18, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (85, 0, 0, 19, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (86, 0, 0, 19, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (87, 0, 0, 19, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (88, 1, 0, 20, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (89, 0, 0, 20, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (90, 0, 0, 20, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (91, 0, 0, 21, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (92, 0, 0, 21, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (93, 0, 0, 21, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (94, 0, 0, 22, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (95, 0, 0, 22, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (96, 0, 0, 22, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (97, 1, 1, 23, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (98, 0, 0, 23, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (99, 0, 0, 23, 14)
SET IDENTITY_INSERT [dbo].[T_Popularity] OFF
SET IDENTITY_INSERT [dbo].[T_Social] ON 

INSERT [dbo].[T_Social] ([id], [type], [account], [identifier]) VALUES (1, N'facebook', N'FrAndroid', N'31928183984')
INSERT [dbo].[T_Social] ([id], [type], [account], [identifier]) VALUES (2, N'facebook', N'9GAG', N'21785951839')
INSERT [dbo].[T_Social] ([id], [type], [account], [identifier]) VALUES (5, N'twitter', N'JournalDuGeek', N'748923419232727000')
SET IDENTITY_INSERT [dbo].[T_Social] OFF
SET IDENTITY_INSERT [dbo].[T_SocialArticle] ON 

INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (1, 1, N'name : BioHazard 4 Mobile (Resident Evil 4) Android apk game. BioHazard 4 Mobile (Resident Evil 4) free...
 message : Resident Evil 4 on mobile android', N'https://external.xx.fbcdn.net/safe_image.php?d=AQCsikGGexK73YXX&w=130&h=130&url=http%3A%2F%2Fstatic.adf.ly%2Fstatic%2Fimage%2Flogo_fb2.png&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (2, 1, N'name : Max Payne Mobile Android apk game. Max Payne Mobile free download for tablet and phone.
 message : MAX PAYNE 2 ON ANDROID MOBILE FREE DOWNLOAD', N'https://external.xx.fbcdn.net/safe_image.php?d=AQBf5FqYTqRgNDTR&w=130&h=130&url=https%3A%2F%2Ffbcdn-photos-a.akamaihd.net%2Fphotos-ak-snc7%2Fv43%2F18%2F130851780416550%2Fapp_115_130851780416550_2014650105.png&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (3, 1, N'name : 
 message : bonjour j''aurais besoin d''aide pour mon asus zenfone 2 ZE551M Z00A car suite a une mise a jour il demarre directement sur le recovery mode et j''ai beau faire des hard reset rien en change j''aimerais savoir si c''est possible de le reparer ?', NULL)
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (4, 1, N'name : Comment scanner des documents depuis votre smartphone ? - FrAndroid
 message : Facile', N'https://external.xx.fbcdn.net/safe_image.php?d=AQAFpWnxULLRiJYE&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2016%2F06%2Fcamscanner.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (5, 1, N'name : Prise en main du Honor 5C, un modèle prometteur - FrAndroid
 message : Avant notre test complet qui arrive très vite, découvrez notre prise en main du Honor 5C', N'https://external.xx.fbcdn.net/safe_image.php?d=AQBq_Qs3KsxIDeo4&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2016%2F06%2Fhonor-5c-2-1.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (6, 1, N'name : Tuto : Runtastic, Nike+ Running, Endomondo... comment changer d''app sans perdre ses données ? - FrAn
 message : Important pour les coureurs !??', N'https://external.xx.fbcdn.net/safe_image.php?d=AQBkZeh7Z15DUi1l&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2016%2F06%2Fmaxresdefault-4.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (7, 1, N'name : Timeline Photos
 message : Voici Android Nougat sur le campus de Google !', N'https://scontent.xx.fbcdn.net/v/t1.0-0/s130x130/13567233_10153850172123985_5847159462696076557_n.jpg?oh=22bd2d61755a718791b36902b47ae1d9&oe=57FD560A')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (8, 1, N'name : Android N a un nom : c''est donc Android Nougat ! - FrAndroid
 message : Fin de la discussion !', N'https://external.xx.fbcdn.net/safe_image.php?d=AQCyUCbMrNCyYyki&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2016%2F06%2Fandroid-nougat.jpg&cfs=1&sx=0&sy=98&sw=900&sh=900')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (9, 1, N'name : Xiaomi ne devrait pas entrer en bourse avant 2025 - FrAndroid
 message : Chez Xiaomi, on ne se presse jamais.', N'https://external.xx.fbcdn.net/safe_image.php?d=AQDq0RvJfMbGK9zL&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2013%2F09%2FLei-Jun-Xiaomi-offices-02.jpg&cfs=1&sx=100&sy=0&sw=452&sh=452')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (10, 1, N'name : ConneXion News
 message : Salut tout le monde, je tenais a vous partagez une page de High Tech que des potes sont en train de se crée pour un projet, n’hésitez pas à y faire un tour, et à la partagez avec votre entourages ! Bonne soirées a tous ! #ConneXionNews https://www.facebook.com/ConneXionNews/', N'https://scontent.xx.fbcdn.net/v/t1.0-1/13495014_105055716594876_6295166169086822214_n.png?oh=5f75110e638bc5710f2c2cea373e0e4a&oe=57EAD882')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (11, 2, N'name : Timeline Photos
 message : I guess you could say they FIRED some actors.
http://9gag.com/gag/aGDRqq6?ref=fbp', N'https://scontent.xx.fbcdn.net/v/t1.0-0/s130x130/13516490_10154778415326840_6157324064900946225_n.jpg?oh=459c3b47c7b8e4fd784a76fbc62ba364&oe=57FC99AC')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (12, 2, N'name : Timeline Photos
 message : Honestly, I''m quite a catch! 
tohttp://9gag.com/gag/aDGmjrw?ref=fbp', N'https://scontent.xx.fbcdn.net/v/t1.0-0/s130x130/13516147_10154778345251840_6770845931090151437_n.jpg?oh=f992ccb0ff5cc9f0367dbd7f1c00805b&oe=5803E2CD')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (13, 2, N'name : Man Thinks He Is Fondling Boobs On The Beach, Only To Find Out That He Is Fooled | 9GAG.tv
 message : Chinese adverts are getting as weird as those from Japan!', N'https://external.xx.fbcdn.net/safe_image.php?d=AQDKPu0KSIhRg42t&w=130&h=130&url=http%3A%2F%2Fcdn-jarvis-fun.9cache.com%2Fmedia%2Fphoto%2FprGo79oVG_1200w_v1.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (14, 2, N'name : 22 Celebrities Who Had Surprising Jobs Before They Were Famous
 message : Channing Tatum was a stripper? Can''t unsee that anymore...', N'https://external.xx.fbcdn.net/safe_image.php?d=AQAHqfvISeajxpi9&w=130&h=130&url=http%3A%2F%2Fimages-cdn.9gag.com%2Fimages%2Fthumbnail-facebook%2F26764497_1467198017.3009_XU7uMy_n.jpg&cfs=1&sx=345&sy=0&sw=630&sh=630')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (15, 2, N'name : Timeline Photos
 message : That''s so me just the other way around.
9GAG Mobile App: www.9gag.com/mobile?ref=9fbp

http://9gag.com/gag/avnPrWO?ref=fbp', N'https://scontent.xx.fbcdn.net/v/t1.0-0/s130x130/13510976_10154778334056840_2741642723726975015_n.jpg?oh=f59755ab2dd051a7e094ecd27342c32f&oe=57F41D69')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (16, 2, N'name : This Guy’s Friday The 13th Snapchat Story Takes An Incredibly Wild Turn
 message : I''d also lose my sh*t if I bump into a fox 
http://9gag.com/gag/aVePDv8?ref=fbp', N'https://external.xx.fbcdn.net/safe_image.php?d=AQAbHS871ZGDu5x9&w=130&h=130&url=http%3A%2F%2Fimages-cdn.9gag.com%2Fimages%2Fthumbnail-facebook%2F26764090_1467276522.3663_ePE8es_n.jpg&cfs=1&sx=570&sy=0&sw=630&sh=630')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (17, 2, N'name : Timeline Photos
 message : Reaper has feelings too.
http://9gag.com/gag/ajD0xxp?ref=fbp', N'https://scontent.xx.fbcdn.net/v/t1.0-0/s130x130/13529038_10154778314886840_6809534425498447124_n.jpg?oh=77ae3cf0cd3b80d9e0957a3956b201a6&oe=57FBF1AC')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (18, 2, N'name : A Guy Films A Wild Night Out With His Drunk Girlfriend And It''s Super Hilarious | 9GAG.tv
 message : I wanna party with Elizabeth! She looks fun at parties.', N'https://external.xx.fbcdn.net/safe_image.php?d=AQB0op9x6uSgcA41&w=130&h=130&url=http%3A%2F%2Fcdn-jarvis-fun.9cache.com%2Fmedia%2Fphoto%2FpnWwbkENQ_1200w_v1.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (19, 2, N'name : 20 Things Your Mom Says That You Often Found Annoying
 message : And your friend''s mom is always nice and friendly. ¯\_(?)_/¯
http://9gag.com/gag/an1N1XV?ref=fbp', N'https://external.xx.fbcdn.net/safe_image.php?d=AQAScsIj8DyrMMId&w=130&h=130&url=http%3A%2F%2Fimages-cdn.9gag.com%2Fimages%2Fthumbnail-facebook%2F26761489_1467275627.7482_taJUWE_n.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (20, 2, N'name : Timeline Photos
 message : I know how to make sandwiches. Does that count as cooking?
http://9gag.com/gag/aB13Agx?ref=fbp', N'https://scontent.xx.fbcdn.net/v/t1.0-0/p130x130/13495003_10154778271361840_416130535548253692_n.jpg?oh=0266d17ade2dbe97327350e48b056d2f&oe=580615C5')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (21, 1, N'name : Comparatif de performances : la mémoire vive du OnePlus 3 est-elle vraiment bridée ? - FrAndroid
 message : Où se situe le OnePlus 3 face à la concurrence ?', N'https://external.xx.fbcdn.net/safe_image.php?d=AQCyjyK-EtNywdFy&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2016%2F06%2Fcomparatif-performances-oneplus-3.png&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (22, 1, N'name : Le Honor 8 se montre : c''est prometteur - FrAndroid
 message : On a hâte de voir ça !', N'https://external.xx.fbcdn.net/safe_image.php?d=AQAgLkCfZBw8FssE&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2016%2F06%2Fhonor-8-1.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (23, 1, N'name : Vidéo : Notre test du HTC Vive, l''expérience ultime de réalité virtuelle - FrAndroid
 message : Plongez dans la réalité virtuelle avec nous !', N'https://external.xx.fbcdn.net/safe_image.php?d=AQCf-29uVb62ecDQ&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2016%2F06%2Fvignette3_frandroid_vive.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (24, 1, N'name : Test du Honor 5C, une montée en gamme convaincante - FrAndroid
 message : Test du Honor 5C, une montée en gamme convaincante', N'https://external.xx.fbcdn.net/safe_image.php?d=AQAjpch2q-DwND9v&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2016%2F07%2Fhonor-5c-19-1000x561.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (25, 1, N'name : Timeline Photos
 message : [Publicité] Prix EDF Pulse 2016, découvrez les 3 lauréats et leurs projets innovants dans les catégories E-Santé, Habitat connecté et Ville bas carbone. http://buff.ly/2989S8b', N'https://scontent.xx.fbcdn.net/v/t1.0-0/s130x130/13512118_10153852592723985_2009381052858876289_n.jpg?oh=225ac266a18006de0360179e0aaedfe4&oe=57ED39D4')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (26, 1, N'name : Sony Mobile compte se désengager de certains pays, dont les États-Unis et la Chine - FrAndroid
 message : Un “defocus” sur d’importants marchés', N'https://external.xx.fbcdn.net/safe_image.php?d=AQAtljm-QonyFlhu&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2016%2F05%2Fxperia-x-performance.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (27, 1, N'name : Asus ZenPad 3s 10 : une tablette premium à venir très bientôt - FrAndroid
 message : Contrairement aux modèles précédents, il s’agirait d’une tablette aux caractéristiques très haut de gamme.', N'https://external.xx.fbcdn.net/safe_image.php?d=AQCQRdES6UzIf_1Z&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2016%2F07%2Fasus-zenpad-3s-10.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (28, 1, N'name : Xiaomi Mi Note 2 : double capteur photo et batterie de 4000 mAh ? - FrAndroid
 message : Xiaomi nous prépare un très haut de gamme ?', N'https://external.xx.fbcdn.net/safe_image.php?d=AQDNr5kgbLnbejZZ&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2016%2F06%2Fxiaomi-mi-note.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (29, 1, N'name : Android Nougat : Google confirme officiellement son numéro de version - FrAndroid
 message : Ça sera bien la version 7.0', N'https://external.xx.fbcdn.net/safe_image.php?d=AQCzEwpGsUXNjUwo&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2016%2F07%2Fandroid-nougat.jpg&cfs=1&sx=0&sy=0&sw=1080&sh=1080')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (30, 1, N'name :  Soldes : l''Archos Diamond Plus à 195 euros - FrAndroid
 message : ?? Soldes : l''Archos Diamond Plus à 195 euros', N'https://external.xx.fbcdn.net/safe_image.php?d=AQAYS4TOkfRr1SCD&w=130&h=130&url=http%3A%2F%2Fimages.frandroid.com%2Fwp-content%2Fuploads%2F2015%2F09%2Farchos-diamond-plus-3-981x1200.jpg&cfs=1')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (31, 2, N'name : This Guy''s Girlfriend Has Pizza Problems - She Can''t Get Her Head Around This Pizza Dilemma
 message : Someone please teach her basic math!', N'https://external.xx.fbcdn.net/safe_image.php?d=AQC973cnmbFG8Zvd&w=130&h=130&url=http%3A%2F%2Fcdn-jarvis-fun.9cache.com%2Fmedia%2Fphoto%2Fp0W0d4EZW_1200w_v1.jpg&cfs=1&sx=423&sy=0&sw=630&sh=630')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (32, 2, N'name : 21 Creative Ways To Drive Someone Crazy Discreetly
 message : "12. Change the Internet Explorer icon to the Chrome icon." I love this evil trick! 
http://9gag.com/gag/aXw9p66?ref=fbp', N'https://external.xx.fbcdn.net/safe_image.php?d=AQCCkB2Erd90LRQh&w=130&h=130&url=http%3A%2F%2Fimages-cdn.9gag.com%2Fimages%2Fthumbnail-facebook%2F26757230_1467168493.5771_3yPySY_n.jpg&cfs=1&sx=258&sy=0&sw=630&sh=630')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (33, 2, N'name : Timeline Photos
 message : I wanna be the very best...
9GAG Mobile App: www.9gag.com/mobile?ref=9fbp

http://9gag.com/gag/aPW4Kwn?ref=fbp', N'https://scontent.xx.fbcdn.net/v/t1.0-0/s130x130/13532809_10154780051476840_7556998049283286445_n.jpg?oh=303e3d0b675b1389cf83bc8d1783b7ea&oe=58003E46')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (34, 2, N'name : Belarusians Strip Naked At Workplace After Tongue-In-Cheek Order From Their President
 message : Work naked? What is going on in this world?! 
http://9gag.com/gag/aAP16mL?ref=fbp', N'https://external.xx.fbcdn.net/safe_image.php?d=AQDsDAhTO_-Elz0O&w=130&h=130&url=http%3A%2F%2Fimages-cdn.9gag.com%2Fimages%2Fthumbnail-facebook%2F26787849_1467342432.9751_ELaRUz_n.jpg&cfs=1&sx=570&sy=0&sw=630&sh=630')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (35, 2, N'name : Timeline Photos
 message : Oh please don''t say that... I''m not ready for that.
http://9gag.com/gag/aDGmWOB?ref=fbp', N'https://scontent.xx.fbcdn.net/v/t1.0-0/s130x130/13557776_10154780038676840_4755539569286072640_n.jpg?oh=bed0ddecd9cc9c41c67b0b7ccdbee2f1&oe=580611A6')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (36, 2, N'name : It''s JOHN CENA! Watch John Cena Prank Loyal Fans In This Delighting Video | 9GAG.tv
 message : Wait, they can see him? My whole life has been a LIE!', N'https://external.xx.fbcdn.net/safe_image.php?d=AQDszafCAxntH_Tw&w=130&h=130&url=http%3A%2F%2Fcdn-jarvis-fun.9cache.com%2Fmedia%2Fphoto%2FprGe2BZ4g_1200w_v1.jpg&cfs=1&sx=318&sy=0&sw=630&sh=630')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (37, 2, N'name : "Overwatch" Characters Reimagined In Opposite Gender
 message : Female Genji just looks like Ciri from Witcher 3!
http://9gag.com/gag/aopjBAe?ref=fbp', N'https://external.xx.fbcdn.net/safe_image.php?d=AQDkThZXrIqlN8Tn&w=130&h=130&url=http%3A%2F%2Fimages-cdn.9gag.com%2Fimages%2Fthumbnail-facebook%2F26747260_1467173939.2287_dUDA9a_n.jpg&cfs=1&sx=570&sy=0&sw=630&sh=630')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (38, 2, N'name : Timeline Photos
 message : Sounds perfect to me.
http://9gag.com/gag/agGNxZg?ref=fbp', N'https://scontent.xx.fbcdn.net/v/t1.0-0/p128x128/13537606_10154780028221840_5800163040396872579_n.jpg?oh=048f75d4a094c83bcac34b16bf9ad853&oe=57FE8A92')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (39, 2, N'name : Calvin Klein First "Plus Size" Model Sparks Controversy Over Body Goals
 message : I think she looks perfect. Healthy and beautiful.
http://9gag.com/gag/aQxnwj2?ref=fbp', N'https://external.xx.fbcdn.net/safe_image.php?d=AQBMnG4Fh_teILrQ&w=130&h=130&url=http%3A%2F%2Fimages-cdn.9gag.com%2Fimages%2Fthumbnail-facebook%2F26745558_1467280232.6825_aMYLA6_n.jpg&cfs=1&sx=271&sy=0&sw=630&sh=630')
INSERT [dbo].[T_SocialArticle] ([id], [social_id], [text], [image]) VALUES (40, 2, N'name : 27 People Confess The Worst Reason They Ever Had Sex With Anyone
 message : "Because they had the same name as me" Oh god, that is really a special one. *Facepalm*
http://9gag.com/gag/aB1YZvO?ref=fbp', N'https://external.xx.fbcdn.net/safe_image.php?d=AQAYJ5PRXh_O9kDf&w=130&h=130&url=http%3A%2F%2Fimages-cdn.9gag.com%2Fimages%2Fthumbnail-facebook%2F26785907_1467370207.3695_6yqaXU_n.jpg&cfs=1&sx=163&sy=0&sw=367&sh=367')
SET IDENTITY_INSERT [dbo].[T_SocialArticle] OFF
SET IDENTITY_INSERT [dbo].[T_User] ON 

INSERT [dbo].[T_User] ([id], [login], [password], [email], [role]) VALUES (1, N'root', N'password', N'root@epita.fr', 0)
INSERT [dbo].[T_User] ([id], [login], [password], [email], [role]) VALUES (13, N'admin', N'password', N'admin@epita.fr', 1)
INSERT [dbo].[T_User] ([id], [login], [password], [email], [role]) VALUES (14, N'user', N'password', N'user@epita.fr', 2)
SET IDENTITY_INSERT [dbo].[T_User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 02/07/2016 04:01:23 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 02/07/2016 04:01:23 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 02/07/2016 04:01:23 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 02/07/2016 04:01:23 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 02/07/2016 04:01:23 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 02/07/2016 04:01:23 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__T_User__7838F2724C93B774]    Script Date: 02/07/2016 04:01:23 ******/
ALTER TABLE [dbo].[T_User] ADD UNIQUE NONCLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[T_Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[T_Category] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Article] CHECK CONSTRAINT [FK_Article_Category]
GO
ALTER TABLE [dbo].[T_Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Article] FOREIGN KEY([article_id])
REFERENCES [dbo].[T_Article] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Comment] CHECK CONSTRAINT [FK_Comment_Article]
GO
ALTER TABLE [dbo].[T_Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[T_User] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[T_Popularity]  WITH CHECK ADD  CONSTRAINT [FK_Popularity_Article] FOREIGN KEY([article_id])
REFERENCES [dbo].[T_Article] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Popularity] CHECK CONSTRAINT [FK_Popularity_Article]
GO
ALTER TABLE [dbo].[T_Popularity]  WITH CHECK ADD  CONSTRAINT [FK_Popularity_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[T_User] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Popularity] CHECK CONSTRAINT [FK_Popularity_User]
GO
ALTER TABLE [dbo].[T_SocialArticle]  WITH CHECK ADD  CONSTRAINT [FK_SocialArticle_Social] FOREIGN KEY([social_id])
REFERENCES [dbo].[T_Social] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_SocialArticle] CHECK CONSTRAINT [FK_SocialArticle_Social]
GO
USE [master]
GO
ALTER DATABASE [IziWatch] SET  READ_WRITE 
GO
