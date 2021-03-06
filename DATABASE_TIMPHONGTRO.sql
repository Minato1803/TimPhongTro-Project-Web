USE [master]
GO
/****** Object:  Database [TimPhongTro]    Script Date: 1/13/2021 11:30:46 AM ******/
CREATE DATABASE [TimPhongTro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimPhongTro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TimPhongTro.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TimPhongTro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TimPhongTro_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TimPhongTro] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimPhongTro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimPhongTro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimPhongTro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimPhongTro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimPhongTro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimPhongTro] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimPhongTro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TimPhongTro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimPhongTro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimPhongTro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimPhongTro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimPhongTro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimPhongTro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimPhongTro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimPhongTro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimPhongTro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TimPhongTro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimPhongTro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimPhongTro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimPhongTro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimPhongTro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimPhongTro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimPhongTro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimPhongTro] SET RECOVERY FULL 
GO
ALTER DATABASE [TimPhongTro] SET  MULTI_USER 
GO
ALTER DATABASE [TimPhongTro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimPhongTro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimPhongTro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimPhongTro] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TimPhongTro] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TimPhongTro', N'ON'
GO
USE [TimPhongTro]
GO
/****** Object:  Table [dbo].[CT_HinhAnh]    Script Date: 1/13/2021 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_HinhAnh](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaPhong] [int] NOT NULL,
	[UrlHinhAnh] [nvarchar](100) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DuongPho]    Script Date: 1/13/2021 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuongPho](
	[MaDuong] [nvarchar](50) NOT NULL,
	[TenDuong] [nvarchar](50) NOT NULL,
	[MaQuan] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DuongPho] PRIMARY KEY CLUSTERED 
(
	[MaDuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhongTro]    Script Date: 1/13/2021 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongTro](
	[MaPhong] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [ntext] NOT NULL,
	[Loai] [nvarchar](100) NOT NULL,
	[LienHe] [nvarchar](100) NOT NULL,
	[SDT] [nvarchar](50) NOT NULL,
	[DienTich] [int] NOT NULL,
	[GiaThue] [float] NOT NULL,
	[DiaChi] [ntext] NOT NULL,
	[GhiChu] [ntext] NOT NULL,
	[MaDuong] [nvarchar](50) NOT NULL,
	[MaUser] [int] NOT NULL,
 CONSTRAINT [PK_PhongTro] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuanHuyen]    Script Date: 1/13/2021 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanHuyen](
	[MaQuan] [nvarchar](50) NOT NULL,
	[TenQuan] [nvarchar](50) NOT NULL,
	[MaTP] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QuanHuyen] PRIMARY KEY CLUSTERED 
(
	[MaQuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/13/2021 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaUser] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[SDT] [nvarchar](50) NOT NULL,
	[EmailLienHe] [nvarchar](50) NULL,
	[DiaChi] [ntext] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhPho]    Script Date: 1/13/2021 11:30:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhPho](
	[MaTP] [nvarchar](50) NOT NULL,
	[TenTP] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ThanhPho] PRIMARY KEY CLUSTERED 
(
	[MaTP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[CT_HinhAnh]  WITH CHECK ADD  CONSTRAINT [FK_CT_HinhAnh_PhongTro] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PhongTro] ([MaPhong])
GO
ALTER TABLE [dbo].[CT_HinhAnh] CHECK CONSTRAINT [FK_CT_HinhAnh_PhongTro]
GO
ALTER TABLE [dbo].[DuongPho]  WITH CHECK ADD  CONSTRAINT [FK_DuongPho_QuanHuyen] FOREIGN KEY([MaQuan])
REFERENCES [dbo].[QuanHuyen] ([MaQuan])
GO
ALTER TABLE [dbo].[DuongPho] CHECK CONSTRAINT [FK_DuongPho_QuanHuyen]
GO
ALTER TABLE [dbo].[PhongTro]  WITH CHECK ADD  CONSTRAINT [FK_PhongTro_DuongPho] FOREIGN KEY([MaDuong])
REFERENCES [dbo].[DuongPho] ([MaDuong])
GO
ALTER TABLE [dbo].[PhongTro] CHECK CONSTRAINT [FK_PhongTro_DuongPho]
GO
ALTER TABLE [dbo].[PhongTro]  WITH CHECK ADD  CONSTRAINT [FK_PhongTro_TaiKhoan] FOREIGN KEY([MaUser])
REFERENCES [dbo].[TaiKhoan] ([MaUser])
GO
ALTER TABLE [dbo].[PhongTro] CHECK CONSTRAINT [FK_PhongTro_TaiKhoan]
GO
ALTER TABLE [dbo].[QuanHuyen]  WITH CHECK ADD  CONSTRAINT [FK_QuanHuyen_ThanhPho] FOREIGN KEY([MaTP])
REFERENCES [dbo].[ThanhPho] ([MaTP])
GO
ALTER TABLE [dbo].[QuanHuyen] CHECK CONSTRAINT [FK_QuanHuyen_ThanhPho]
GO
USE [master]
GO
ALTER DATABASE [TimPhongTro] SET  READ_WRITE 
GO
