USE [master]
GO
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
ALTER DATABASE [IziWatch] SET AUTO_CREATE_STATISTICS ON 
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
/****** Object:  Table [dbo].[T_Article]    Script Date: 02/07/2016 02:17:41 ******/
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
/****** Object:  Table [dbo].[T_Category]    Script Date: 02/07/2016 02:17:41 ******/
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
/****** Object:  Table [dbo].[T_Comment]    Script Date: 02/07/2016 02:17:41 ******/
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
/****** Object:  Table [dbo].[T_Popularity]    Script Date: 02/07/2016 02:17:41 ******/
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
/****** Object:  Table [dbo].[T_Social]    Script Date: 02/07/2016 02:17:41 ******/
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
/****** Object:  Table [dbo].[T_SocialArticle]    Script Date: 02/07/2016 02:17:41 ******/
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
/****** Object:  Table [dbo].[T_User]    Script Date: 02/07/2016 02:17:41 ******/
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
SET IDENTITY_INSERT [dbo].[T_Article] ON 

INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (1, N'Note on Blindness : la VR pour entrer dans le monde d''un non-voyant', N'http://img1.lesnumeriques.com/news/53/53173/note-on-blindness-fes-stand.jpg', 1, N'A l''occasion du festival Futur en Seine, une co-production française a présenté une nouvelle expérience en réalité virtuelle basée sur l''expérience audiovisuelle d''un non-visuel. Une approche à part, saisissante et originale.     note-on-blindness-fes-stand.jpg   Voir à travers les yeux d''un non-voyant, ou plutôt comment il perçoit le monde, c''est ce que propose l''expérience VR Note on Blindness : Into Darkness. Soutenu par Arte et issu du travail commun des sociétés Ex Nihilo, Audiogaming et Archer''s Mark, ce jeu, sorte de simulateur d''ambiance et de marche à la That Dragon Cancer, s''inspire du documentaire Note on Blindness, primé au festival de Sundance et fondé sur plus de 6 heures de notes audio de l''écrivain et professeur de théologie John Hull. Ce dernier perdit progressivement la vue jusqu''à devenir non-voyant en 1983. Ses notes, véritable journal de bord de découvertes et redécouvertes de sons, d''expériences sensorielles, se retrouve ainsi exposées en réalité virtuelle au sein de 6 tableaux.     note-on-blindness-vr-inside-1.jpg   Des tableaux comme autant de moments de vie de John Hull, parsemés de ses notes audio et composés d''une vision partielle, construction mentale et cognitive de l''auteur à partir des sons, du toucher, du vent sur la peau. L''audio, d''ailleurs, est capté en binaural, de manière à immerger le joueur/spectateur dans un univers sonore spatialisé avec n''importe quel casque ou paire d''écouteurs.      1_note-on-blindness-fes-ecran-vr.jpg   Conçu en premier lieu pour le casque Gear VR de Samsung, Note on Blindness : Into Darkness sera disponible gratuitement sur sa plate-forme de téléchargement, à partir du 30 juin. Le choix du casque du constructeur coréen est dû aux besoins du jeu et surtout du pavé tactile situé sur son flanc. Programmé ici comme un bouton d''action, il permet de focaliser l''attention du joueur sur un point précis de l''expérience, prolongeant alors certaines interactions sonores. Comme un effet de concentration, en somme. Note on Blindness : Into Darkness de fait peut se terminer en quelques minutes ou se prolonger bien plus longtemps en fonction des explorations sensorielle du joueur. L''expérience mérite que l''on s''y intéresse, aussi bien en matière de sensibilisation qu''en termes d''expérience VR pure.      1_note-on-blindness-vr-inside-2.jpg     A noter que les développeurs du titre travaillent déjà au portage vers iOS et Android pour la rentrée prochaine, en vue notamment de l''arrivée de la seconde version du casque Cardboard de Google, qui proposera un bouton d''action garantissant ainsi les mêmes interactions qu''avec le Gear VR. ', CAST(0x0000A69200000000 AS DateTime), 4)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (2, N'Drone Volt Janus 360, un drone dédié à la réalité virtuelle', N'http://img1.lesnumeriques.com/news/53/53145/janus-360-by-drone-volt-2.jpg', 2, N'Pour rappel, une étude de Goldmann Sachs estime que le marché des contenus 3D filmés à 360° sur le secteur de l''audiovisuel, du tourisme, de la publicité et du sport représentera 80 milliards de dollars en 2025. On comprend donc mieux l''intérêt de certains acteurs pour ce marché. Ces derniers devront toutefois se méfier de la réponse de DJI, qui pourrait réagir très vite... et à bon prix.', CAST(0x0000A69300000000 AS DateTime), 8)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (4, N'Samsung ouvre un parc d''attraction dédié à la réalité virtuelle', N'http://img1.lesnumeriques.com/produits/36/28793/samsung-gear-vr-2015-sm-322_1bb427813ffd2a02_450x400.jpg', 1, N'Un outil de promo pour le Gear VR Si vous êtes à Paris du 17 au 19 juin et que vous voulez découvrir les bienfaits de la réalité virtuelle façon Samsung, direction la Bibliothèque François-Mitterrand, dans le 12e arrondissement, au parc d''attraction éphémère Samsung. Samsung Gear VR 2015 (SM-322) Samsung Gear VR 2015 (SM-322) Voir le test 4/5 3 sont intéressés Moi aussi ! Donnez votre avis     €        Marchand FR 	Prix € Priceminister 	 95,00 	   Misco.fr 	 95,88 	   Webdistrib 	 96,09 	   Cdiscount 	 96,99 	   Fnac.com marketplace 	 97,66 	   Amazon 	 98,54 	   Voir plus d''offres   6 500 m², un espace pouvant accueillir jusqu''à 2 000 personnes à la fois : Samsung n''a pas fait les choses à moitié pour son premier parc dédié à la réalité virtuelle. Et le plus beau dans tout  ça, c''est que l''accès est entièrement gratuit. Il faut dire que, au-delà d''un lieu de loisirs, ce "S7 Life Changer Park" est avant tout un énorme outil de promotion pour le Galaxy S7, le Gear VR, mais aussi la caméra Gear 360. Un showroom avec tous les produits trône au milieu du lieu et chaque attraction se termine par une petite pub pour le trio. Personne n''est dupe. Samsung VR Park 1.jpg Et sinon, que peut-on y faire ? Une petite dizaine d''attractions sont proposées, exploitant à chaque fois le Gear VR et une vidéo à 360°. Pas de jeu vidéo, donc, et c''est un peu dommage. En vrac, on peut y faire du surf sur une planche mouvante, des montagnes russes dans au fauteuil monté sur vérins ou encore connaître le frisson d''une attaque de zombies. Soyons honnêtes : toutes les attractions ne se valent pas. "Ibiza", notamment, n''est qu''une bête vidéo dans la peau d''un DJ et il ne s''y passe pas grand-chose, d''autant plus que l''image est particulièrement sombre. Samsung VR Park 3.jpg Jurassic World est l''occasion d''une belle rencontre avec Diplodocus. En revanche, il faut avouer que le saut à ski, le surf et  le rollercoaster font très bien le job. La synchronisation entre l''image et les mouvements est impeccable, tandis qu''une soufflerie se charge de vous faire ressentir un peu plus de sensations. Clairement, si vous y faites un tour dans les 3 prochains jours, c''est ce trio d''attraction qu''il faut tester en priorité. À noter également, la plupart des vidéos utilisées dans ce parc sont déjà disponibles sur le Gear VR. ', CAST(0x0000A69400000000 AS DateTime), 5)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (5, N'Magic Leap lance des expériences Star Wars en réalité augmentée', N'http://img1.lesnumeriques.com/news/53/53113/magic-leap-star-wars.jpg', 4, N'Trop bluffant pour être honnête ? R2D2 et C3PO dans votre salon, à la cool, commentent une bataille de X-Wing en hologramme. Une scène de science-fiction ? Peut-être plus vraiment... Magic Leap, c''est cette société assez mystérieuse qui travaille depuis longtemps sur une technologie de réalité augmentée. Malgré sa discrétion, la compagnie a réussi à lever plusieurs centaines de millions de dollars ces dernières années, auprès d''investisseurs comme Google, Alibaba ou la banque JP Morgan. Bref, même si elle n''a pour le moment sorti aucun projet commercial, la compagnie a clairement le vent en poupe, à tel point qu''elle a réussi à séduire un acteur majeur du divertissement : Lucasfilm et par extension, Disney. Magic Leap Star Wars.jpg ILMxLAB (un studio spécialisé dans la VR et l''AR, créé par Lucasfilm) et Magic Leap se sont en effet associés pour lancer des expériences de réalité augmentée dans l''univers de Star Wars. C''est lors de la "Wired''s Business Conference" que le projet a été dévoilé, à travers notamment une vidéo très impressionnante, censée avoir été capturée directement depuis un appareil Magic Leap, et sans aucun post-traitement. On peut y voir C3PO et R2D2 évoluer de manière très naturelle dans un salon, et commenter des hologrammes, à la fois diffusés sur une table et en l''air. Bref, un peu à la manière des vidéos de démos pour l''HoloLens, la technologie paraît presque trop belle pour être vraie. On rappelle en effet que HoloLens, malgré toutes ses qualités, souffre pour le moment d''un champ de vision réduit, qui nuit à l''immersion. Difficile — voire impossible — de savoir ce qu''il en est pour Magic Leap, et encore plus d''avoir une confiance aveugle dans cette vidéo. Il n''empêche ; peut-être que, dans quelques années, nous rejouerons la bataille de Yavin dans notre salon, en dirigeant au doigt une escouade de X-Wing, épaulé par deux droïdes.', CAST(0x0000A69500000000 AS DateTime), 37)
INSERT [dbo].[T_Article] ([id], [title], [image], [category_id], [text], [date], [views]) VALUES (10, N'Dyson V8 : une nouvelle petite bombe ?', N'http://img1.lesnumeriques.com/produits/458/33417/dyson-v8_56f2754d0af54ed1_450x400.jpg', 3, N'Cela fait un bon moment que le V6 Absolute squatte la première place de notre guide d''achat des aspirateurs-balais. Il faut dire qu''avec ce modèle tout terrain très efficace, Dyson a pris une sacrée longueur d''avance sur ses concurrents, qu''il creuse encore en présentant le V8 cette semaine, successeur encore amélioré du V6. Si plusieurs points ont été revus pour optimiser le confort d''usage, les deux principales évolutions concernent l''autonomie et le système de vidange. Dyson V8 Dyson V8 14 sont intéressés Moi aussi ! Donnez votre avis     Le top        En l''absence d''offre FR Le choix de la rédaction Dyson V6 Absolute     Aspirateur-balai et serpillière Philips PowerPro Aqua FC6402/01      Polyvalent et pas cher Electrolux Ergorapido      Grosse autonomie LG CordZero VHB511CDB     Plus de propositions   Esthétiquement, outre un coloris différent, le V8 ressemble trait pour trait au V6. Il en reprend l''équilibrage spécifique à Dyson, permettant de nettoyer aussi bien le sol que le plafond ou les surfaces à mi-hauteur en détachant le tube télescopique. On retrouve également le système de gâchette qui enclenche l''aspiration et la stoppe quand on la relâche. Pour rappel, Dyson a fait ce choix pour favoriser les économies de batterie : lorsque l''utilisateur doit déplacer un objet ou un meuble, comme une chaise (ce que l''on fait régulièrement quand on passe l''aspirateur), il relâche la gâchette et la batterie cesse de se décharger. Dommage par contre, nous avons souvent regretté que Dyson n''ait pas prévu de système de blocage de la gâchette pour les séances prolongée, et ce n''est toujours pas le cas. En revanche, on trouve d''autres améliorations. La première concerne le bouton pour passer à la puissance "max". Alors qu''il était précédemment situé sur le dessus du collecteur (à l''arrière du filtre), il s''agit désormais d''un poussoir positionné à l''avant de l''aspirette. Actu-dyson-v8-bouton-demarrage.jpg Le clip de sécurité pour raccorder le tube télescopique à l''aspirette n''est plus situé sur le bloc moteur/collecteur, mais sur le tube télescopique, facilitant le désassemblage qui nous a semblé plus souple. Idem pour raccorder le tube télescopique aux accessoires : c''est désormais sur les accessoires que l''on trouve ce clip de sécurité. Actu-dyson-v8-clics-securite.jpg Quant à l''indicateur du niveau de batterie, il est désormais graduel. Sur les précédentes moutures, lorsque la batterie se vidait, un unique voyant clignotait peu avant l''épuisement et l''arrêt de l''aspirateur. Désormais, 3 leds qui s''éteignent graduellement, permettant d''anticiper l''épuisement. Actu-dyson-v8-leds-charge-batterie.jpg Une meilleure autonomie L''optimisation de l''autonomie fait partie des deux principales évolutions apportées à ce V8. En effet, alors que le V6 tenait 20 min à puissance normale, le V8 tient jusqu''à 40 min (avec un accessoire non motorisé). Avec la brosse motorisée, l''autonomie diminue à 25 min, ce qui est toujours plus que celle du V6 Absolute. Il est à noter que l''autonomie varie selon la brosse utilisée. Actu-dyson-v8-brosse-torsadee.jpg Brosse torsadée que l''on trouvait déjà avec le V6 Absolute. Selon Dyson, elle serait plus large. D''ailleurs, le V8 est particulièrement bien doté en la matière : il est livré avec une brosse de type Fluffy (pour les sols durs), une brosse aux poils torsadés espacés, un suceur plat 2-en-1 transformable en brosse large, un suceur long et une mini turbo-brosse. Avec une telle panoplie, il semble paré à toute éventualité. Actu-dyson-v8-brosses.jpg Pack complet d''accessoires ; à droite, la mini turbo-brosse. Un système de vidange hygiénique Une amélioration nous semble tout particulièrement importante : le système de vidange. Sur les précédents balais de Dyson, une trappe s''ouvrait par le bas, en pressant un bouton situé face à la gâchette. Dyson a cherché à développer un système de vidange plus hygiénique, inspiré de ce qui a été fait sur son traîneau Big Ball. En effet, l''ouverture de la trappe déclenche le glissement d''un joint sur toute la longueur du bloc de filtration, éjectant ainsi la poussière vers le bas. Actu-dyson-v8-vidange-collecteur.jpg Le collecteur étant relativement petit et surtout pas bien large, pour peu qu''on aspire des poils d''animaux ou des fibres de tapis, ils peuvent se retrouver bloqués entre le bloc de filtration et la paroi. Ce système facilitera donc la vidange, en plus de la rendre plus hygiénique. Le bouton d''ouverture de la trappe a lui aussi un peu changé. Au lieu de se pousser vers le bas, face à la gâchette, il se tire, sur le dessus du collecteur. C''est pratique et facile d''accès. Actu-dyson-v8-filtres.jpg On trouve toujours deux filtres, comme sur le V6 Absolute. En bref, ce V8 intègre bien des améliorations prometteuses : Dyson a repris ses brosses — qui ont déjà prouvé leur efficacité — et tout ce qui a fait le succès du V6 Absolute, tout en améliorant considérablement certains points. Un test nous permettra de vérifier si le fabricant nous livre là l''aspirateur-balai "parfait", répondant sans concession à toutes nos attentes. ', CAST(0x0000A69600000000 AS DateTime), 24)
SET IDENTITY_INSERT [dbo].[T_Article] OFF
SET IDENTITY_INSERT [dbo].[T_Category] ON 

INSERT [dbo].[T_Category] ([id], [name]) VALUES (1, N'Réalité Virtuelle')
INSERT [dbo].[T_Category] ([id], [name]) VALUES (2, N'Drône')
INSERT [dbo].[T_Category] ([id], [name]) VALUES (3, N'Ventilateur')
INSERT [dbo].[T_Category] ([id], [name]) VALUES (4, N'Réalité Augmentée')
SET IDENTITY_INSERT [dbo].[T_Category] OFF
SET IDENTITY_INSERT [dbo].[T_Comment] ON 

INSERT [dbo].[T_Comment] ([id], [title], [text], [article_id], [user_id]) VALUES (1, N'Test 1 ', N'Test 333 ', 5, 1)
INSERT [dbo].[T_Comment] ([id], [title], [text], [article_id], [user_id]) VALUES (2, N'Ceci est un titre', N'Je suis en train de poster un texte parce que ca me fait drolement chier LOL XD ', 5, 1)
SET IDENTITY_INSERT [dbo].[T_Comment] OFF
SET IDENTITY_INSERT [dbo].[T_Popularity] ON 

INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (1, 1, 0, 1, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (2, 1, 0, 2, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (3, 1, 0, 4, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (4, 1, 1, 5, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (5, 1, 0, 10, 1)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (46, 0, 0, 1, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (47, 0, 0, 2, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (48, 0, 0, 4, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (49, 0, 0, 5, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (50, 0, 0, 10, 13)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (56, 0, 0, 1, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (57, 0, 0, 2, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (58, 0, 0, 4, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (59, 0, 0, 5, 14)
INSERT [dbo].[T_Popularity] ([id], [viewed], [liked], [article_id], [user_id]) VALUES (60, 0, 0, 10, 14)
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
SET IDENTITY_INSERT [dbo].[T_SocialArticle] OFF
SET IDENTITY_INSERT [dbo].[T_User] ON 

INSERT [dbo].[T_User] ([id], [login], [password], [email], [role]) VALUES (1, N'root', N'password', N'root@epita.fr', 0)
INSERT [dbo].[T_User] ([id], [login], [password], [email], [role]) VALUES (13, N'admin', N'password', N'admin@epita.fr', 1)
INSERT [dbo].[T_User] ([id], [login], [password], [email], [role]) VALUES (14, N'user', N'password', N'user@epita.fr', 2)
SET IDENTITY_INSERT [dbo].[T_User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__T_User__7838F2729CB4236A]    Script Date: 02/07/2016 02:17:41 ******/
ALTER TABLE [dbo].[T_User] ADD UNIQUE NONCLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
