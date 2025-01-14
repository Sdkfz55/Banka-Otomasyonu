USE [master]
GO
/****** Object:  Database [Banka]    Script Date: 5.01.2025 18:16:11 ******/
CREATE DATABASE [Banka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Banka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Banka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Banka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Banka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Banka] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Banka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Banka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Banka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Banka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Banka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Banka] SET ARITHABORT OFF 
GO
ALTER DATABASE [Banka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Banka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Banka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Banka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Banka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Banka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Banka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Banka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Banka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Banka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Banka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Banka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Banka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Banka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Banka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Banka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Banka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Banka] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Banka] SET  MULTI_USER 
GO
ALTER DATABASE [Banka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Banka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Banka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Banka] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Banka] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Banka] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Banka] SET QUERY_STORE = ON
GO
ALTER DATABASE [Banka] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Banka]
GO
/****** Object:  Table [dbo].[Bankakart]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bankakart](
	[BankaKartID] [int] NOT NULL,
	[KartID] [int] NOT NULL,
	[Bakiye] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destek]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destek](
	[DestekID] [int] NOT NULL,
	[MusteriID] [int] NOT NULL,
	[Konu] [nchar](40) NOT NULL,
	[Aciklama] [nchar](100) NOT NULL,
	[Durum] [nchar](10) NOT NULL,
	[OlusturmaTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_Destek] PRIMARY KEY CLUSTERED 
(
	[DestekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeriOdeme]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeriOdeme](
	[GeriOdemeID] [int] NOT NULL,
	[KrediID] [int] NOT NULL,
	[TaksitNo] [int] NOT NULL,
	[OdemeTarihi] [date] NOT NULL,
	[OdemeTutari] [money] NOT NULL,
	[OdendiMi] [bit] NOT NULL,
 CONSTRAINT [PK_GeriOdeme] PRIMARY KEY CLUSTERED 
(
	[GeriOdemeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Giris]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giris](
	[GirisID] [int] NOT NULL,
	[MusteriID] [int] NOT NULL,
	[GirisTarihi] [datetime] NOT NULL,
	[IPAdresi] [nchar](20) NOT NULL,
	[Basarilimi] [bit] NOT NULL,
 CONSTRAINT [PK_Giris] PRIMARY KEY CLUSTERED 
(
	[GirisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hesaplar]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hesaplar](
	[HesapNo] [varchar](16) NOT NULL,
	[MusteriID] [int] NOT NULL,
	[SubeID] [int] NOT NULL,
	[Bakiye] [money] NOT NULL,
	[HesapTuru] [varchar](15) NOT NULL,
	[Durum] [bit] NOT NULL,
	[OlusturmaTarihi] [datetime] NOT NULL,
	[IBAN] [nchar](40) NOT NULL,
 CONSTRAINT [PK_Hesaplar_1] PRIMARY KEY CLUSTERED 
(
	[HesapNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[islemler]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[islemler](
	[islemID] [int] NOT NULL,
	[HesapNo] [varchar](16) NOT NULL,
	[islemTuru] [nchar](15) NOT NULL,
	[Tutar] [money] NOT NULL,
	[Aciklama] [varchar](250) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[HavaleHesapNo] [varchar](16) NULL,
 CONSTRAINT [PK_islemler] PRIMARY KEY CLUSTERED 
(
	[islemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kartlar]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kartlar](
	[KartID] [int] NOT NULL,
	[MusteriId] [int] NOT NULL,
	[KartNo] [varchar](20) NOT NULL,
	[KartTuru] [nchar](10) NOT NULL,
	[SonKullanmaTarihi] [date] NOT NULL,
	[CVV] [nchar](3) NOT NULL,
 CONSTRAINT [PK_Kartlar] PRIMARY KEY CLUSTERED 
(
	[KartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KrediBasvuru]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KrediBasvuru](
	[BasvuruID] [int] NOT NULL,
	[MusteriID] [int] NOT NULL,
	[KrediTuru] [nchar](10) NOT NULL,
	[Miktar] [money] NOT NULL,
	[Durum] [nchar](10) NOT NULL,
	[BasvuruTarihi] [datetime] NOT NULL,
	[OnayTarihi] [datetime] NULL,
 CONSTRAINT [PK_KrediBasvuru] PRIMARY KEY CLUSTERED 
(
	[BasvuruID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KrediEkstre]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KrediEkstre](
	[KrediEkstre] [int] NOT NULL,
	[KrediKartID] [int] NOT NULL,
	[Donem] [nchar](12) NOT NULL,
	[ToplamHarcama] [money] NOT NULL,
	[AsgariOdemeTutari] [money] NOT NULL,
	[SonOdemeTarihi] [datetime] NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_KrediEkstre] PRIMARY KEY CLUSTERED 
(
	[KrediEkstre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KrediKart]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KrediKart](
	[kredikartID] [int] NOT NULL,
	[KartID] [int] NOT NULL,
	[limit] [money] NOT NULL,
	[Borc] [money] NOT NULL,
	[kullanılabilir_limit] [money] NOT NULL,
	[HesapKesimTarih] [date] NOT NULL,
 CONSTRAINT [PK_KrediKart] PRIMARY KEY CLUSTERED 
(
	[kredikartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[MusteriID] [int] NOT NULL,
	[Ad] [nchar](40) NOT NULL,
	[Soyad] [nchar](10) NOT NULL,
	[TC] [char](11) NOT NULL,
	[Tel] [varchar](15) NOT NULL,
	[E-mail] [nchar](30) NOT NULL,
	[Sifre] [varchar](50) NOT NULL,
	[OlusturmaTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odeme]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odeme](
	[FaturaID] [int] NOT NULL,
	[FaturaNo] [nchar](20) NOT NULL,
	[MusteriID] [int] NOT NULL,
	[Tutar] [money] NOT NULL,
	[FaturaTarihi] [date] NOT NULL,
	[SonOdemeTarihi] [date] NOT NULL,
	[OdemeDurumu] [bit] NOT NULL,
 CONSTRAINT [PK_Odeme] PRIMARY KEY CLUSTERED 
(
	[FaturaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubeBilgileri]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubeBilgileri](
	[SubeID] [int] NOT NULL,
	[SubeAdi] [nchar](20) NOT NULL,
	[Adres] [nchar](50) NOT NULL,
	[Telefon] [nchar](11) NOT NULL,
	[E-posta] [nchar](40) NOT NULL,
 CONSTRAINT [PK_SubeBilgileri] PRIMARY KEY CLUSTERED 
(
	[SubeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bankakart] ([BankaKartID], [KartID], [Bakiye]) VALUES (1, 2, 35000.0000)
INSERT [dbo].[Bankakart] ([BankaKartID], [KartID], [Bakiye]) VALUES (2, 4, 125000.0000)
INSERT [dbo].[Bankakart] ([BankaKartID], [KartID], [Bakiye]) VALUES (3, 6, 6500.0000)
INSERT [dbo].[Bankakart] ([BankaKartID], [KartID], [Bakiye]) VALUES (4, 7, 2500.0000)
GO
INSERT [dbo].[Destek] ([DestekID], [MusteriID], [Konu], [Aciklama], [Durum], [OlusturmaTarihi]) VALUES (1, 1, N'Kredi Basvurusu                         ', N'Kredi başvurumun durumu hakkında bilgi almak istiyorum.                                             ', N'İslemde   ', CAST(N'2024-01-04T09:00:00.000' AS DateTime))
INSERT [dbo].[Destek] ([DestekID], [MusteriID], [Konu], [Aciklama], [Durum], [OlusturmaTarihi]) VALUES (2, 2, N'Kart Sifresi                            ', N'Kartımın şifresini unuttum, yeni şifre talep ediyorum.                                              ', N'Cozuldu   ', CAST(N'2024-01-04T10:30:45.000' AS DateTime))
INSERT [dbo].[Destek] ([DestekID], [MusteriID], [Konu], [Aciklama], [Durum], [OlusturmaTarihi]) VALUES (3, 6, N'Hesap Hareketleri Hatası                ', N'Hesap hareketlerimde tutarsızlık görüyorum. Yardımcı olur musunuz?                                  ', N'Beklemede ', CAST(N'2024-01-03T16:00:12.000' AS DateTime))
INSERT [dbo].[Destek] ([DestekID], [MusteriID], [Konu], [Aciklama], [Durum], [OlusturmaTarihi]) VALUES (4, 5, N'Online Alışveriş Sorunu                 ', N'Online alışverişte ödeme yapamıyorum.                                                               ', N'Cozuldu   ', CAST(N'2024-01-02T12:15:25.000' AS DateTime))
GO
INSERT [dbo].[GeriOdeme] ([GeriOdemeID], [KrediID], [TaksitNo], [OdemeTarihi], [OdemeTutari], [OdendiMi]) VALUES (1, 2, 4, CAST(N'2025-01-15' AS Date), 1000.0000, 0)
GO
INSERT [dbo].[Giris] ([GirisID], [MusteriID], [GirisTarihi], [IPAdresi], [Basarilimi]) VALUES (1, 1, CAST(N'2025-05-22T14:50:10.000' AS DateTime), N'192.168.1.1         ', 1)
INSERT [dbo].[Giris] ([GirisID], [MusteriID], [GirisTarihi], [IPAdresi], [Basarilimi]) VALUES (2, 2, CAST(N'2025-06-05T09:20:37.000' AS DateTime), N'172.16.0.10
       ', 0)
INSERT [dbo].[Giris] ([GirisID], [MusteriID], [GirisTarihi], [IPAdresi], [Basarilimi]) VALUES (3, 6, CAST(N'2025-06-27T12:28:14.000' AS DateTime), N'203.0.113.5         ', 1)
INSERT [dbo].[Giris] ([GirisID], [MusteriID], [GirisTarihi], [IPAdresi], [Basarilimi]) VALUES (4, 3, CAST(N'2025-06-28T12:28:14.000' AS DateTime), N'198.51.100.23       ', 1)
INSERT [dbo].[Giris] ([GirisID], [MusteriID], [GirisTarihi], [IPAdresi], [Basarilimi]) VALUES (5, 5, CAST(N'2025-06-28T12:28:14.000' AS DateTime), N'192.168.0.100       ', 0)
INSERT [dbo].[Giris] ([GirisID], [MusteriID], [GirisTarihi], [IPAdresi], [Basarilimi]) VALUES (6, 4, CAST(N'2025-06-29T12:28:14.000' AS DateTime), N'172.20.15.6         ', 1)
GO
INSERT [dbo].[Hesaplar] ([HesapNo], [MusteriID], [SubeID], [Bakiye], [HesapTuru], [Durum], [OlusturmaTarihi], [IBAN]) VALUES (N'1122334455667788', 3, 103, 18200.0000, N'Vadeli', 0, CAST(N'2023-03-18T22:40:55.000' AS DateTime), N'TR34 0007 8002 3456 7890 1122 33        ')
INSERT [dbo].[Hesaplar] ([HesapNo], [MusteriID], [SubeID], [Bakiye], [HesapTuru], [Durum], [OlusturmaTarihi], [IBAN]) VALUES (N'1234567890123456', 1, 101, 35000.0000, N'Vadeli', 1, CAST(N'2025-05-22T14:50:10.000' AS DateTime), N'TR45 0006 2000 1234 5678 9001 02        ')
INSERT [dbo].[Hesaplar] ([HesapNo], [MusteriID], [SubeID], [Bakiye], [HesapTuru], [Durum], [OlusturmaTarihi], [IBAN]) VALUES (N'3456789012346789', 2, 102, 58000.0000, N'Vadesiz', 1, CAST(N'2021-12-30T11:45:23.000' AS DateTime), N'TR98 0004 6001 9876 5432 1098 76        ')
INSERT [dbo].[Hesaplar] ([HesapNo], [MusteriID], [SubeID], [Bakiye], [HesapTuru], [Durum], [OlusturmaTarihi], [IBAN]) VALUES (N'5566778899001234', 6, 104, 67500.0000, N'Vadesiz', 1, CAST(N'2022-05-11T18:45:00.000' AS DateTime), N'TR21 0002 3005 7890 1234 4455 66        ')
INSERT [dbo].[Hesaplar] ([HesapNo], [MusteriID], [SubeID], [Bakiye], [HesapTuru], [Durum], [OlusturmaTarihi], [IBAN]) VALUES (N'6655443322110099', 4, 103, 12000.0000, N'Vadeli', 1, CAST(N'2022-07-09T19:05:18.000' AS DateTime), N'TR67 0009 1003 4567 8901 2233 44        ')
INSERT [dbo].[Hesaplar] ([HesapNo], [MusteriID], [SubeID], [Bakiye], [HesapTuru], [Durum], [OlusturmaTarihi], [IBAN]) VALUES (N'7788990011223344', 5, 101, 240000.0000, N'Vadesiz', 1, CAST(N'2023-11-15T08:15:32.000' AS DateTime), N'TR89 0005 7004 6789 0123 3344 55        ')
INSERT [dbo].[Hesaplar] ([HesapNo], [MusteriID], [SubeID], [Bakiye], [HesapTuru], [Durum], [OlusturmaTarihi], [IBAN]) VALUES (N'9876543210987654', 6, 101, 37000.0000, N'Vadesiz', 1, CAST(N'2022-10-28T17:55:29.000' AS DateTime), N'TR12 0001 5001 2345 6789 1011 13        ')
GO
INSERT [dbo].[islemler] ([islemID], [HesapNo], [islemTuru], [Tutar], [Aciklama], [Tarih], [HavaleHesapNo]) VALUES (1, N'1234567890123456', N'Havale         ', 1000.0000, N'aasa', CAST(N'2025-01-03T14:30:00.000' AS DateTime), N'1122334455667788')
INSERT [dbo].[islemler] ([islemID], [HesapNo], [islemTuru], [Tutar], [Aciklama], [Tarih], [HavaleHesapNo]) VALUES (2, N'1122334455667788', N'ParaYatırma    ', 2000.0000, N'.', CAST(N'2025-02-22T14:50:10.000' AS DateTime), NULL)
INSERT [dbo].[islemler] ([islemID], [HesapNo], [islemTuru], [Tutar], [Aciklama], [Tarih], [HavaleHesapNo]) VALUES (3, N'5566778899001234', N'ParaCekme      ', 2500.0000, N'.', CAST(N'2025-02-23T12:54:10.000' AS DateTime), NULL)
INSERT [dbo].[islemler] ([islemID], [HesapNo], [islemTuru], [Tutar], [Aciklama], [Tarih], [HavaleHesapNo]) VALUES (4, N'6655443322110099', N'Odeme          ', 1200.0000, N'Alısveris', CAST(N'2025-03-04T12:00:30.000' AS DateTime), NULL)
INSERT [dbo].[islemler] ([islemID], [HesapNo], [islemTuru], [Tutar], [Aciklama], [Tarih], [HavaleHesapNo]) VALUES (5, N'7788990011223344', N'Havale         ', 15000.0000, N'Bireysel Odeme', CAST(N'2025-05-22T13:40:10.000' AS DateTime), N'6655443322110099')
INSERT [dbo].[islemler] ([islemID], [HesapNo], [islemTuru], [Tutar], [Aciklama], [Tarih], [HavaleHesapNo]) VALUES (6, N'1122334455667788', N'Havale         ', 1000.0000, N'.', CAST(N'2025-05-22T13:40:10.000' AS DateTime), N'9876543210987654')
INSERT [dbo].[islemler] ([islemID], [HesapNo], [islemTuru], [Tutar], [Aciklama], [Tarih], [HavaleHesapNo]) VALUES (7, N'9876543210987654', N'Havale         ', 5000.0000, N'gule gule harca', CAST(N'2023-03-18T22:40:55.000' AS DateTime), N'1122334455667788')
INSERT [dbo].[islemler] ([islemID], [HesapNo], [islemTuru], [Tutar], [Aciklama], [Tarih], [HavaleHesapNo]) VALUES (8, N'1122334455667788', N'Havale         ', 1000.0000, N'.', CAST(N'2023-03-18T00:00:00.000' AS DateTime), N'5566778899001234')
INSERT [dbo].[islemler] ([islemID], [HesapNo], [islemTuru], [Tutar], [Aciklama], [Tarih], [HavaleHesapNo]) VALUES (9, N'1122334455667788', N'Havale         ', 1000.0000, N'Harclık', CAST(N'2023-03-18T00:00:00.000' AS DateTime), N'5566778899001234')
INSERT [dbo].[islemler] ([islemID], [HesapNo], [islemTuru], [Tutar], [Aciklama], [Tarih], [HavaleHesapNo]) VALUES (10, N'1122334455667788', N'Havale         ', 1000.0000, N'.', CAST(N'2023-03-18T22:40:55.000' AS DateTime), N'1234567890123456')
GO
INSERT [dbo].[Kartlar] ([KartID], [MusteriId], [KartNo], [KartTuru], [SonKullanmaTarihi], [CVV]) VALUES (1, 1, N'4111 1111 1111 1111
', N'Kredi     ', CAST(N'2026-03-01' AS Date), N'128')
INSERT [dbo].[Kartlar] ([KartID], [MusteriId], [KartNo], [KartTuru], [SonKullanmaTarihi], [CVV]) VALUES (2, 2, N'4012888888881881', N'Banka     ', CAST(N'2029-09-01' AS Date), N'180')
INSERT [dbo].[Kartlar] ([KartID], [MusteriId], [KartNo], [KartTuru], [SonKullanmaTarihi], [CVV]) VALUES (3, 3, N'4222222222222', N'Kredi     ', CAST(N'2028-07-01' AS Date), N'162')
INSERT [dbo].[Kartlar] ([KartID], [MusteriId], [KartNo], [KartTuru], [SonKullanmaTarihi], [CVV]) VALUES (4, 4, N'4005519200000004', N'Banka     ', CAST(N'2027-08-01' AS Date), N'256')
INSERT [dbo].[Kartlar] ([KartID], [MusteriId], [KartNo], [KartTuru], [SonKullanmaTarihi], [CVV]) VALUES (5, 2, N'4500000000000009', N'Kredi     ', CAST(N'2029-03-01' AS Date), N'170')
INSERT [dbo].[Kartlar] ([KartID], [MusteriId], [KartNo], [KartTuru], [SonKullanmaTarihi], [CVV]) VALUES (6, 1, N'4005518000000004', N'Banka     ', CAST(N'2032-02-01' AS Date), N'145')
INSERT [dbo].[Kartlar] ([KartID], [MusteriId], [KartNo], [KartTuru], [SonKullanmaTarihi], [CVV]) VALUES (7, 3, N'4125518000000004', N'Banka     ', CAST(N'2031-05-01' AS Date), N'126')
INSERT [dbo].[Kartlar] ([KartID], [MusteriId], [KartNo], [KartTuru], [SonKullanmaTarihi], [CVV]) VALUES (8, 6, N'4125518000002584', N'Kredi     ', CAST(N'2032-04-01' AS Date), N'262')
GO
INSERT [dbo].[KrediBasvuru] ([BasvuruID], [MusteriID], [KrediTuru], [Miktar], [Durum], [BasvuruTarihi], [OnayTarihi]) VALUES (1, 1, N'İhtiyac   ', 10000.0000, N'Beklemede ', CAST(N'2024-12-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[KrediBasvuru] ([BasvuruID], [MusteriID], [KrediTuru], [Miktar], [Durum], [BasvuruTarihi], [OnayTarihi]) VALUES (2, 6, N'Tasıt     ', 250000.0000, N'Onaylandı ', CAST(N'2024-12-16T00:00:00.000' AS DateTime), CAST(N'2024-12-20T00:00:00.000' AS DateTime))
INSERT [dbo].[KrediBasvuru] ([BasvuruID], [MusteriID], [KrediTuru], [Miktar], [Durum], [BasvuruTarihi], [OnayTarihi]) VALUES (3, 5, N'Konut     ', 500000.0000, N'Reddedildi', CAST(N'2024-12-18T00:00:00.000' AS DateTime), CAST(N'2024-12-21T00:00:00.000' AS DateTime))
INSERT [dbo].[KrediBasvuru] ([BasvuruID], [MusteriID], [KrediTuru], [Miktar], [Durum], [BasvuruTarihi], [OnayTarihi]) VALUES (4, 3, N'İhtiyac   ', 100000.0000, N'Onaylandı ', CAST(N'2025-05-22T14:50:10.000' AS DateTime), CAST(N'2025-05-27T09:55:10.000' AS DateTime))
GO
INSERT [dbo].[KrediEkstre] ([KrediEkstre], [KrediKartID], [Donem], [ToplamHarcama], [AsgariOdemeTutari], [SonOdemeTarihi], [Durum]) VALUES (1, 1, N'Ocak        ', 4200.0000, 1050.0000, CAST(N'2025-02-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[KrediEkstre] ([KrediEkstre], [KrediKartID], [Donem], [ToplamHarcama], [AsgariOdemeTutari], [SonOdemeTarihi], [Durum]) VALUES (2, 2, N'Ocak        ', 8000.0000, 2000.0000, CAST(N'2025-02-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[KrediEkstre] ([KrediEkstre], [KrediKartID], [Donem], [ToplamHarcama], [AsgariOdemeTutari], [SonOdemeTarihi], [Durum]) VALUES (3, 3, N'Ocak        ', 2400.0000, 1000.0000, CAST(N'2025-02-15T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[KrediEkstre] ([KrediEkstre], [KrediKartID], [Donem], [ToplamHarcama], [AsgariOdemeTutari], [SonOdemeTarihi], [Durum]) VALUES (4, 4, N'Ocak        ', 25000.0000, 2000.0000, CAST(N'2025-02-17T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[KrediKart] ([kredikartID], [KartID], [limit], [Borc], [kullanılabilir_limit], [HesapKesimTarih]) VALUES (1, 1, 8000.0000, 7000.0000, 1000.0000, CAST(N'2025-01-25' AS Date))
INSERT [dbo].[KrediKart] ([kredikartID], [KartID], [limit], [Borc], [kullanılabilir_limit], [HesapKesimTarih]) VALUES (2, 3, 16000.0000, 5000.0000, 11000.0000, CAST(N'2025-01-24' AS Date))
INSERT [dbo].[KrediKart] ([kredikartID], [KartID], [limit], [Borc], [kullanılabilir_limit], [HesapKesimTarih]) VALUES (3, 5, 24000.0000, 4000.0000, 20000.0000, CAST(N'2025-01-21' AS Date))
INSERT [dbo].[KrediKart] ([kredikartID], [KartID], [limit], [Borc], [kullanılabilir_limit], [HesapKesimTarih]) VALUES (4, 8, 12000.0000, 2000.0000, 10000.0000, CAST(N'2025-01-19' AS Date))
GO
INSERT [dbo].[Kullanicilar] ([MusteriID], [Ad], [Soyad], [TC], [Tel], [E-mail], [Sifre], [OlusturmaTarihi]) VALUES (1, N'Ahmet                                   ', N'Yıldız    ', N'1245678900 ', N'5551234567', N'ahmet.yildiz@gmail.com        ', N'ahmet123', CAST(N'2025-01-03T14:30:00.000' AS DateTime))
INSERT [dbo].[Kullanicilar] ([MusteriID], [Ad], [Soyad], [TC], [Tel], [E-mail], [Sifre], [OlusturmaTarihi]) VALUES (2, N'Zeynep                                  ', N'Çoban     ', N'78901234567', N'5558907341', N'zynpcbn@gmail.com             ', N'saadwsf123', CAST(N'2023-08-19T06:35:42.000' AS DateTime))
INSERT [dbo].[Kullanicilar] ([MusteriID], [Ad], [Soyad], [TC], [Tel], [E-mail], [Sifre], [OlusturmaTarihi]) VALUES (3, N'Murat                                   ', N'Aydın     ', N'89012345678', N'5552200451', N'murat_aydin@gmail.com         ', N'mrtaydn44', CAST(N'2024-09-12T16:30:00.000' AS DateTime))
INSERT [dbo].[Kullanicilar] ([MusteriID], [Ad], [Soyad], [TC], [Tel], [E-mail], [Sifre], [OlusturmaTarihi]) VALUES (4, N'Mehmet                                  ', N'Yıldırım  ', N'95678901234', N'5447418342', N'mhmet2020@hotmail.com         ', N'sifre123', CAST(N'2022-07-09T19:05:18.000' AS DateTime))
INSERT [dbo].[Kullanicilar] ([MusteriID], [Ad], [Soyad], [TC], [Tel], [E-mail], [Sifre], [OlusturmaTarihi]) VALUES (5, N'Ozan                                    ', N'Kurt      ', N'95678901234', N'5464581355', N'ozn_krt@gmail.com             ', N'as12345', CAST(N'2025-11-23T15:12:08.000' AS DateTime))
INSERT [dbo].[Kullanicilar] ([MusteriID], [Ad], [Soyad], [TC], [Tel], [E-mail], [Sifre], [OlusturmaTarihi]) VALUES (6, N'Cem                                     ', N'Aslan     ', N'93456789012', N'5329451256', N'cemaslan12@hotmail.com        ', N'cmasln4545', CAST(N'2024-12-17T05:20:30.000' AS DateTime))
GO
INSERT [dbo].[Odeme] ([FaturaID], [FaturaNo], [MusteriID], [Tutar], [FaturaTarihi], [SonOdemeTarihi], [OdemeDurumu]) VALUES (1, N'FTR123456           ', 1, 2000.0000, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-15' AS Date), 1)
INSERT [dbo].[Odeme] ([FaturaID], [FaturaNo], [MusteriID], [Tutar], [FaturaTarihi], [SonOdemeTarihi], [OdemeDurumu]) VALUES (2, N'FTR234567           ', 2, 350.0000, CAST(N'2024-01-05' AS Date), CAST(N'2024-01-20' AS Date), 0)
INSERT [dbo].[Odeme] ([FaturaID], [FaturaNo], [MusteriID], [Tutar], [FaturaTarihi], [SonOdemeTarihi], [OdemeDurumu]) VALUES (3, N'FTR345678           ', 4, 250.0000, CAST(N'2024-01-10' AS Date), CAST(N'2024-01-25' AS Date), 1)
INSERT [dbo].[Odeme] ([FaturaID], [FaturaNo], [MusteriID], [Tutar], [FaturaTarihi], [SonOdemeTarihi], [OdemeDurumu]) VALUES (4, N'FTR456789           ', 5, 2500.0000, CAST(N'2024-01-12' AS Date), CAST(N'2024-01-19' AS Date), 1)
INSERT [dbo].[Odeme] ([FaturaID], [FaturaNo], [MusteriID], [Tutar], [FaturaTarihi], [SonOdemeTarihi], [OdemeDurumu]) VALUES (5, N'FTR567890           ', 3, 450.0000, CAST(N'2024-01-15' AS Date), CAST(N'2024-01-30' AS Date), 0)
GO
INSERT [dbo].[SubeBilgileri] ([SubeID], [SubeAdi], [Adres], [Telefon], [E-posta]) VALUES (101, N'Levent              ', N'Levent Mah. Büyükdere Cad. No:125, Beşiktaş       ', N'2123456789 ', N'levent.subesi@bankaniz.com              ')
INSERT [dbo].[SubeBilgileri] ([SubeID], [SubeAdi], [Adres], [Telefon], [E-posta]) VALUES (102, N'Ankara Kızılay      ', N'Karanfil Sok. No:18, Kızılay, Çankaya             ', N'312234567  ', N'kizilay.subesi@bankaniz.com             ')
INSERT [dbo].[SubeBilgileri] ([SubeID], [SubeAdi], [Adres], [Telefon], [E-posta]) VALUES (103, N'İzmir Alsancak      ', N'Kordonboyu Cad. No:45, Alsancak, Konak            ', N'232458456  ', N'alsancak.subesi@bankaniz.com            ')
INSERT [dbo].[SubeBilgileri] ([SubeID], [SubeAdi], [Adres], [Telefon], [E-posta]) VALUES (104, N'Bursa Nilüfer       ', N'Fatih Sultan Mehmet Blv. No:30, Nilüfer           ', N'02443456780', N'nilufer.subesi@bankaniz.com             ')
GO
ALTER TABLE [dbo].[Bankakart]  WITH CHECK ADD  CONSTRAINT [FK_Bankakart_Kartlar] FOREIGN KEY([KartID])
REFERENCES [dbo].[Kartlar] ([KartID])
GO
ALTER TABLE [dbo].[Bankakart] CHECK CONSTRAINT [FK_Bankakart_Kartlar]
GO
ALTER TABLE [dbo].[Destek]  WITH CHECK ADD  CONSTRAINT [FK_Destek_Kullanicilar] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Kullanicilar] ([MusteriID])
GO
ALTER TABLE [dbo].[Destek] CHECK CONSTRAINT [FK_Destek_Kullanicilar]
GO
ALTER TABLE [dbo].[GeriOdeme]  WITH CHECK ADD  CONSTRAINT [FK_GeriOdeme_KrediBasvuru] FOREIGN KEY([KrediID])
REFERENCES [dbo].[KrediBasvuru] ([BasvuruID])
GO
ALTER TABLE [dbo].[GeriOdeme] CHECK CONSTRAINT [FK_GeriOdeme_KrediBasvuru]
GO
ALTER TABLE [dbo].[Giris]  WITH CHECK ADD  CONSTRAINT [FK_Giris_Kullanicilar] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Kullanicilar] ([MusteriID])
GO
ALTER TABLE [dbo].[Giris] CHECK CONSTRAINT [FK_Giris_Kullanicilar]
GO
ALTER TABLE [dbo].[Hesaplar]  WITH CHECK ADD  CONSTRAINT [FK_Hesaplar_Kullanicilar] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Kullanicilar] ([MusteriID])
GO
ALTER TABLE [dbo].[Hesaplar] CHECK CONSTRAINT [FK_Hesaplar_Kullanicilar]
GO
ALTER TABLE [dbo].[Hesaplar]  WITH CHECK ADD  CONSTRAINT [FK_Hesaplar_SubeBilgileri] FOREIGN KEY([SubeID])
REFERENCES [dbo].[SubeBilgileri] ([SubeID])
GO
ALTER TABLE [dbo].[Hesaplar] CHECK CONSTRAINT [FK_Hesaplar_SubeBilgileri]
GO
ALTER TABLE [dbo].[islemler]  WITH CHECK ADD  CONSTRAINT [FK_islemler_Hesaplar] FOREIGN KEY([HesapNo])
REFERENCES [dbo].[Hesaplar] ([HesapNo])
GO
ALTER TABLE [dbo].[islemler] CHECK CONSTRAINT [FK_islemler_Hesaplar]
GO
ALTER TABLE [dbo].[Kartlar]  WITH CHECK ADD  CONSTRAINT [FK_Kartlar_Kullanicilar] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[Kullanicilar] ([MusteriID])
GO
ALTER TABLE [dbo].[Kartlar] CHECK CONSTRAINT [FK_Kartlar_Kullanicilar]
GO
ALTER TABLE [dbo].[KrediBasvuru]  WITH CHECK ADD  CONSTRAINT [FK_KrediBasvuru_Kullanicilar] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Kullanicilar] ([MusteriID])
GO
ALTER TABLE [dbo].[KrediBasvuru] CHECK CONSTRAINT [FK_KrediBasvuru_Kullanicilar]
GO
ALTER TABLE [dbo].[KrediEkstre]  WITH CHECK ADD  CONSTRAINT [FK_KrediEkstre_KrediKart] FOREIGN KEY([KrediKartID])
REFERENCES [dbo].[KrediKart] ([kredikartID])
GO
ALTER TABLE [dbo].[KrediEkstre] CHECK CONSTRAINT [FK_KrediEkstre_KrediKart]
GO
ALTER TABLE [dbo].[KrediKart]  WITH CHECK ADD  CONSTRAINT [FK_KrediKart_Kartlar] FOREIGN KEY([KartID])
REFERENCES [dbo].[Kartlar] ([KartID])
GO
ALTER TABLE [dbo].[KrediKart] CHECK CONSTRAINT [FK_KrediKart_Kartlar]
GO
ALTER TABLE [dbo].[Odeme]  WITH CHECK ADD  CONSTRAINT [FK_Odeme_Kullanicilar] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Kullanicilar] ([MusteriID])
GO
ALTER TABLE [dbo].[Odeme] CHECK CONSTRAINT [FK_Odeme_Kullanicilar]
GO
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 5.01.2025 18:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCustomer]
    @islemID int,
    @HesapNo varchar(16),
	@islemturu NCHAR(15),
	@tutar money,
	@aciklama varchar(250),
	@Tarih date
AS
BEGIN 
    INSERT INTO islemler (islemID, HesapNo,islemTuru,Tutar,Aciklama,Tarih)
    VALUES (@islemID, @HesapNo,@islemturu,@tutar,@aciklama,@Tarih);
END;
GO
USE [master]
GO
ALTER DATABASE [Banka] SET  READ_WRITE 
GO
