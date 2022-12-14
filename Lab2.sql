USE [master]
GO
/****** Object:  Database [Supermarket]    Script Date: 03.12.2022 19:04:35 ******/
CREATE DATABASE [Supermarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Supermarket', FILENAME = N'D:\Installed\sqlServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\Supermarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Supermarket_log', FILENAME = N'D:\Installed\sqlServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\Supermarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Supermarket] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Supermarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Supermarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Supermarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Supermarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Supermarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Supermarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [Supermarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Supermarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Supermarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Supermarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Supermarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Supermarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Supermarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Supermarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Supermarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Supermarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Supermarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Supermarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Supermarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Supermarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Supermarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Supermarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Supermarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Supermarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Supermarket] SET  MULTI_USER 
GO
ALTER DATABASE [Supermarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Supermarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Supermarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Supermarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Supermarket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Supermarket] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Supermarket] SET QUERY_STORE = OFF
GO
USE [Supermarket]
GO
/****** Object:  User [proba]    Script Date: 03.12.2022 19:04:35 ******/
CREATE USER [proba] FOR LOGIN [proba] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Petrov_Dep]    Script Date: 03.12.2022 19:04:35 ******/
CREATE USER [Petrov_Dep] FOR LOGIN [Petrov_Dep] WITH DEFAULT_SCHEMA=[Petrov_Dep]
GO
/****** Object:  User [Ivanov_Acc]    Script Date: 03.12.2022 19:04:35 ******/
CREATE USER [Ivanov_Acc] FOR LOGIN [Ivanov_Acc] WITH DEFAULT_SCHEMA=[Ivanov_Acc]
GO
/****** Object:  DatabaseRole [HEAD_OF_DEPARTMENT]    Script Date: 03.12.2022 19:04:35 ******/
CREATE ROLE [HEAD_OF_DEPARTMENT]
GO
/****** Object:  DatabaseRole [ACCOUNTANT]    Script Date: 03.12.2022 19:04:35 ******/
CREATE ROLE [ACCOUNTANT]
GO
ALTER ROLE [db_owner] ADD MEMBER [proba]
GO
ALTER ROLE [HEAD_OF_DEPARTMENT] ADD MEMBER [Petrov_Dep]
GO
ALTER ROLE [ACCOUNTANT] ADD MEMBER [Ivanov_Acc]
GO
/****** Object:  Schema [ACCOUNTANT]    Script Date: 03.12.2022 19:04:35 ******/
CREATE SCHEMA [ACCOUNTANT]
GO
/****** Object:  Schema [HEAD_OF_DEPARTMENT]    Script Date: 03.12.2022 19:04:35 ******/
CREATE SCHEMA [HEAD_OF_DEPARTMENT]
GO
/****** Object:  Schema [Ivanov_Acc]    Script Date: 03.12.2022 19:04:35 ******/
CREATE SCHEMA [Ivanov_Acc]
GO
/****** Object:  Schema [Petrov_Dep]    Script Date: 03.12.2022 19:04:35 ******/
CREATE SCHEMA [Petrov_Dep]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 03.12.2022 19:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] NOT NULL,
	[surname] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[patronymic] [varchar](50) NOT NULL,
	[department] [varchar](50) NOT NULL,
	[year_of_birth] [int] NOT NULL,
	[year_of_employment] [int] NOT NULL,
	[expirience] [varchar](50) NOT NULL,
	[job_title] [varchar](50) NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[telephone] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[find_notNull]    Script Date: 03.12.2022 19:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[find_notNull]() returns table
as return(select * from Employees where year_of_birth is not NULL );

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 03.12.2022 19:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[ID] [int] NOT NULL,
	[department_name] [varchar](50) NOT NULL,
	[number_of_counters] [int] NOT NULL,
	[number_of_sellers] [int] NOT NULL,
	[room_number] [int] NULL,
 CONSTRAINT [PK_Departments_1] PRIMARY KEY CLUSTERED 
(
	[department_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 03.12.2022 19:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[ID] [int] NOT NULL,
	[job_title] [varchar](50) NOT NULL,
	[bet_amount] [int] NOT NULL,
 CONSTRAINT [PK_Positions_1] PRIMARY KEY CLUSTERED 
(
	[job_title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 03.12.2022 19:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] NOT NULL,
	[product_name] [varchar](50) NOT NULL,
	[department] [varchar](50) NOT NULL,
	[producing_country] [varchar](50) NOT NULL,
	[storage_conditions] [varchar](50) NOT NULL,
	[storage_periods] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale_of_goods]    Script Date: 03.12.2022 19:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_of_goods](
	[employee_salesman] [varchar](50) NOT NULL,
	[ID] [int] NOT NULL,
	[item_date] [date] NOT NULL,
	[time] [time](7) NOT NULL,
	[amount] [int] NOT NULL,
	[price] [int] NOT NULL,
	[sum] [int] NOT NULL,
 CONSTRAINT [PK_Sale_of_goods_1] PRIMARY KEY CLUSTERED 
(
	[employee_salesman] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Index_Department]    Script Date: 03.12.2022 19:04:35 ******/
CREATE NONCLUSTERED INDEX [Index_Department] ON [dbo].[Departments]
(
	[department_name] ASC,
	[number_of_counters] ASC,
	[number_of_sellers] ASC,
	[room_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([department])
REFERENCES [dbo].[Departments] ([department_name])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Departments] FOREIGN KEY([department])
REFERENCES [dbo].[Departments] ([department_name])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Departments]
GO
ALTER TABLE [dbo].[Sale_of_goods]  WITH CHECK ADD  CONSTRAINT [FK_Sale_of_goods_Sale_of_goods] FOREIGN KEY([employee_salesman])
REFERENCES [dbo].[Employees] ([surname])
GO
ALTER TABLE [dbo].[Sale_of_goods] CHECK CONSTRAINT [FK_Sale_of_goods_Sale_of_goods]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [CK_Departments] CHECK  (([room_number]<(100)))
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [CK_Departments]
GO
USE [master]
GO
ALTER DATABASE [Supermarket] SET  READ_WRITE 
GO
