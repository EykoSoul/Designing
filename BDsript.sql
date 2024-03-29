USE [master]
GO
/****** Object:  Database [DemoBK]    Script Date: 28.04.2022 8:52:00 ******/
CREATE DATABASE [DemoBK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoBK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DemoBK.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoBK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DemoBK_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DemoBK] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoBK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoBK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoBK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoBK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoBK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoBK] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoBK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoBK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoBK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoBK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoBK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoBK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoBK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoBK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoBK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoBK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoBK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoBK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoBK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoBK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoBK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoBK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoBK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoBK] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DemoBK] SET  MULTI_USER 
GO
ALTER DATABASE [DemoBK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoBK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoBK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoBK] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoBK] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoBK] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DemoBK] SET QUERY_STORE = OFF
GO
USE [DemoBK]
GO
/****** Object:  Table [dbo].[Абонент]    Script Date: 28.04.2022 8:52:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Абонент](
	[ID_Абонента] [int] IDENTITY(1,1) NOT NULL,
	[НомерАбонента] [nchar](20) NOT NULL,
	[ФИО] [nchar](100) NOT NULL,
	[Пол] [nchar](7) NOT NULL,
	[Дата_Рождения] [date] NOT NULL,
	[Номер_телефона] [nchar](12) NOT NULL,
	[Электорнная_почта] [nchar](50) NOT NULL,
	[Адрес_проживания] [nchar](70) NOT NULL,
	[Серия_номер_паспорта] [int] NOT NULL,
	[Пароль] [nchar](15) NOT NULL,
 CONSTRAINT [PK_Абонент] PRIMARY KEY CLUSTERED 
(
	[ID_Абонента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ВидУслуг]    Script Date: 28.04.2022 8:52:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ВидУслуг](
	[ID_ВидУслуг] [int] NOT NULL,
	[Название_услуги] [nchar](30) NOT NULL,
 CONSTRAINT [PK_ВидУслуг] PRIMARY KEY CLUSTERED 
(
	[ID_ВидУслуг] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявки]    Script Date: 28.04.2022 8:52:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявки](
	[ID_Заявки] [int] IDENTITY(1,1) NOT NULL,
	[Номер_заявки] [nchar](10) NOT NULL,
	[Дата_создания] [date] NOT NULL,
	[ЛС] [int] NOT NULL,
	[Услуга] [nchar](30) NOT NULL,
	[Вид_услуги] [int] NOT NULL,
	[Тип_услуги] [nchar](100) NOT NULL,
	[Статус] [nchar](30) NOT NULL,
	[ID_Оборудования] [int] NOT NULL,
	[Проблемы] [nchar](10) NULL,
	[Дата_закрытия] [date] NULL,
	[Тип_проблемы] [nchar](10) NULL,
	[ID_Сотрудника] [int] NOT NULL,
	[ID_района] [int] NOT NULL,
	[ID_Абонента] [int] NOT NULL,
 CONSTRAINT [PK_Заявки] PRIMARY KEY CLUSTERED 
(
	[ID_Заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Оборудование]    Script Date: 28.04.2022 8:52:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оборудование](
	[ID_Оборудования] [int] IDENTITY(1,1) NOT NULL,
	[Наименование_оборудования] [nchar](50) NOT NULL,
	[Тип_оборудования] [int] NOT NULL,
	[Серийный_номер] [nchar](20) NOT NULL,
	[MAC] [nchar](12) NOT NULL,
	[IP] [nchar](12) NOT NULL,
	[Номер_телефонов] [nchar](12) NOT NULL,
	[Дата_установки] [date] NOT NULL,
	[Место_подключения] [int] NOT NULL,
 CONSTRAINT [PK_Оборудование] PRIMARY KEY CLUSTERED 
(
	[ID_Оборудования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Порты]    Script Date: 28.04.2022 8:52:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Порты](
	[ID_Порта] [int] IDENTITY(1,1) NOT NULL,
	[Тип_порта] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Порты] PRIMARY KEY CLUSTERED 
(
	[ID_Порта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Порты_В_Оборудовании]    Script Date: 28.04.2022 8:52:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Порты_В_Оборудовании](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_порта] [int] NOT NULL,
	[ID_оборудования] [int] NOT NULL,
 CONSTRAINT [PK_Порты_В_Оборудовании] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Районы]    Script Date: 28.04.2022 8:52:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Районы](
	[ID_района] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nchar](40) NOT NULL,
	[Площадь] [float] NOT NULL,
	[Население] [int] NOT NULL,
	[Колличество_станций_метро] [int] NOT NULL,
	[Тип_застройки] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Районы] PRIMARY KEY CLUSTERED 
(
	[ID_района] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ТехПерсонал]    Script Date: 28.04.2022 8:52:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТехПерсонал](
	[ID_Сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nchar](100) NOT NULL,
	[Должность] [nchar](50) NOT NULL,
	[Номер_телефона] [nchar](12) NOT NULL,
	[Пароль] [nchar](15) NOT NULL,
 CONSTRAINT [PK_ТехПерсонал] PRIMARY KEY CLUSTERED 
(
	[ID_Сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ТипОборудования]    Script Date: 28.04.2022 8:52:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТипОборудования](
	[ID_Типа] [int] IDENTITY(1,1) NOT NULL,
	[Наименование_типа] [nchar](30) NOT NULL,
 CONSTRAINT [PK_ТипОборудования] PRIMARY KEY CLUSTERED 
(
	[ID_Типа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ТочкаПодключения]    Script Date: 28.04.2022 8:52:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТочкаПодключения](
	[ID_ТочкиПодключения] [int] IDENTITY(1,1) NOT NULL,
	[Координаты] [geography] NOT NULL,
 CONSTRAINT [PK_ТочкаПодключения] PRIMARY KEY CLUSTERED 
(
	[ID_ТочкиПодключения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_Абонент] FOREIGN KEY([ID_Абонента])
REFERENCES [dbo].[Абонент] ([ID_Абонента])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_Абонент]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_ВидУслуг] FOREIGN KEY([Вид_услуги])
REFERENCES [dbo].[ВидУслуг] ([ID_ВидУслуг])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_ВидУслуг]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_Оборудование] FOREIGN KEY([ID_Оборудования])
REFERENCES [dbo].[Оборудование] ([ID_Оборудования])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_Оборудование]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_Районы] FOREIGN KEY([ID_района])
REFERENCES [dbo].[Районы] ([ID_района])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_Районы]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_ТехПерсонал] FOREIGN KEY([ID_Сотрудника])
REFERENCES [dbo].[ТехПерсонал] ([ID_Сотрудника])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_ТехПерсонал]
GO
ALTER TABLE [dbo].[Оборудование]  WITH CHECK ADD  CONSTRAINT [FK_Оборудование_ТипОборудования] FOREIGN KEY([Тип_оборудования])
REFERENCES [dbo].[ТипОборудования] ([ID_Типа])
GO
ALTER TABLE [dbo].[Оборудование] CHECK CONSTRAINT [FK_Оборудование_ТипОборудования]
GO
ALTER TABLE [dbo].[Оборудование]  WITH CHECK ADD  CONSTRAINT [FK_Оборудование_ТочкаПодключения] FOREIGN KEY([Место_подключения])
REFERENCES [dbo].[ТочкаПодключения] ([ID_ТочкиПодключения])
GO
ALTER TABLE [dbo].[Оборудование] CHECK CONSTRAINT [FK_Оборудование_ТочкаПодключения]
GO
ALTER TABLE [dbo].[Порты_В_Оборудовании]  WITH CHECK ADD  CONSTRAINT [FK_Порты_В_Оборудовании_Оборудование] FOREIGN KEY([ID_оборудования])
REFERENCES [dbo].[Оборудование] ([ID_Оборудования])
GO
ALTER TABLE [dbo].[Порты_В_Оборудовании] CHECK CONSTRAINT [FK_Порты_В_Оборудовании_Оборудование]
GO
ALTER TABLE [dbo].[Порты_В_Оборудовании]  WITH CHECK ADD  CONSTRAINT [FK_Порты_В_Оборудовании_Порты] FOREIGN KEY([ID_порта])
REFERENCES [dbo].[Порты] ([ID_Порта])
GO
ALTER TABLE [dbo].[Порты_В_Оборудовании] CHECK CONSTRAINT [FK_Порты_В_Оборудовании_Порты]
GO
USE [master]
GO
ALTER DATABASE [DemoBK] SET  READ_WRITE 
GO
