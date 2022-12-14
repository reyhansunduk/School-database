USE [okulProje]
GO
/****** Object:  UserDefinedFunction [dbo].[vfpNotEkle]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[vfpNotEkle](
@v int,
@f int)
returns money
as 
begin
return  @v+@f
end
GO
/****** Object:  Table [dbo].[bolum]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bolum](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bolum_adi] [nvarchar](50) NULL,
	[bolum_telno] [nvarchar](50) NULL,
	[eposta] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ders]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ders_adi] [nvarchar](50) NULL,
	[ders_kodu] [nvarchar](50) NULL,
	[kredi] [int] NULL,
	[akts] [int] NULL,
	[bolumId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ogrenci]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogrenci](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ogrenci_ad] [nvarchar](50) NULL,
	[ogrenci_soyad] [nvarchar](50) NULL,
	[ogenci_no] [nvarchar](50) NULL,
	[bolumId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ogrenciDers]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogrenciDers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[dersId] [int] NULL,
	[ogrenciId] [int] NULL,
	[vize] [int] NULL,
	[final] [int] NULL,
	[proje] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ogretmen]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogretmen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ogretmen_adi] [nvarchar](50) NULL,
	[ogretmen_soyadi] [nvarchar](50) NULL,
	[dogumyeri] [nvarchar](50) NULL,
	[bolumId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ogretmenDers]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogretmenDers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ogretmenId] [int] NULL,
	[dersId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bolum] ON 

INSERT [dbo].[bolum] ([Id], [bolum_adi], [bolum_telno], [eposta]) VALUES (1, N'Elektrik Elektronik Mühendisliği', N'02124563459', N'eem@beun.edu.tr')
INSERT [dbo].[bolum] ([Id], [bolum_adi], [bolum_telno], [eposta]) VALUES (2, N'Bilgisayar Mühendisliği', N'02126354789', N'bilgisayar@beun.edu.tr')
INSERT [dbo].[bolum] ([Id], [bolum_adi], [bolum_telno], [eposta]) VALUES (3, N'Ekonometri ', N'02123654578', N'ekonometri@beun.edu.tr')
INSERT [dbo].[bolum] ([Id], [bolum_adi], [bolum_telno], [eposta]) VALUES (4, N'Çalışma Ekonomisi ve Endüstriyel İlişkileri', N'02126354789', N'ceko@beun.edu.tr')
INSERT [dbo].[bolum] ([Id], [bolum_adi], [bolum_telno], [eposta]) VALUES (5, N'İnşaat Mühendisliği', N'02126547893', N'insaatmüh@beun.edu.tr')
INSERT [dbo].[bolum] ([Id], [bolum_adi], [bolum_telno], [eposta]) VALUES (6, N'Makine Mühendisliği', N'02123654259', N'mak@beun.edu.tr')
INSERT [dbo].[bolum] ([Id], [bolum_adi], [bolum_telno], [eposta]) VALUES (7, N'Tıp Fakültesi', N'02125469685', N'tipfak@beun.edu.tr')
INSERT [dbo].[bolum] ([Id], [bolum_adi], [bolum_telno], [eposta]) VALUES (8, N'İstatistik', N'02123654894', N'istatistik@beun.edu.tr')
INSERT [dbo].[bolum] ([Id], [bolum_adi], [bolum_telno], [eposta]) VALUES (9, N'İş Sağlığı ve Güvenliği', N'02126354789', N'isg@beun.edu.tr')
INSERT [dbo].[bolum] ([Id], [bolum_adi], [bolum_telno], [eposta]) VALUES (10, N'Geoematik Mühendisliği', N'02123654758', N'geomatik@beun.edu.tr')
INSERT [dbo].[bolum] ([Id], [bolum_adi], [bolum_telno], [eposta]) VALUES (11, N'Mimarlık Fakültesi', NULL, N'mimarlık@beun.edu.tr')
SET IDENTITY_INSERT [dbo].[bolum] OFF
GO
SET IDENTITY_INSERT [dbo].[ders] ON 

INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (1, N'Yüksek Gerilim Tekniği', N'10100', 3, 4, 1)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (2, N'Mühendislik Matematiği', N'10101', 3, 4, 1)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (3, N'Elektrik Makinaları', N'10102', 3, 4, 1)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (4, N'Kablosuz Haberleşme', N'10103', 4, 5, 1)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (5, N'Elektromanyetik Dalga Teorisi', N'10104', 4, 5, 1)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (6, N'Nesneye Dayanımlı Yazılım Geliştirme', N'20101', 5, 6, 2)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (7, N'Genel İşletme', N'40100', 4, 7, 4)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (8, N'Genel Muhasebe', N'40101', 6, 8, 4)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (9, N'Doğrusal Cebir', N'30100', 4, 5, 3)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (10, N'Sayısal Analiz', N'20102', 6, 7, 2)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (11, N'İlk ve Acil Yardım', N'90100', 3, 4, 9)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (12, N'Tehlike Belirleme ve Risk Yönetimi', N'90101', 4, 5, 9)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (13, N'Biyokimya', N'70100', 7, 8, 7)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (14, N'Pediatri', N'70101', 8, 9, 7)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (15, N'İstatiksel Okuryazarlık', N'80100', 3, 4, 8)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (16, N'Lazer Tarama', N'10000', 5, 6, 10)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (17, N'Mukavemet', N'50100', 6, 7, 5)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (18, N'Makine Elemanları', N'60100', 6, 7, 6)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (19, N'Elektroniğe Giriş', N'20103', 4, 5, 2)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (20, N'Varyans Analizi ve Deney Tasarımı', N'30101', 5, 6, 3)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (21, N'Mühendislik Ekonomisi', N'50101', 4, 5, 5)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (22, N'Mikroişlemci Sistemleri', N'20104', 5, 6, 2)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (23, N'Genel Cerrahi', N'70102', 8, 9, 7)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (24, N'Genel İşletme', N'40102', 2, 3, 4)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (25, N'Görsel Programlama', N'80101', 2, 4, 8)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (26, N'İSG Yönetim Sistemleri', N'90102', 3, 4, 9)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (27, N'Uydu Gravimetresi', N'10001', 5, 6, 10)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (28, N'Mikrobilgisayar Laboratuvarı', N'20105', 2, 2, 2)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (29, N'Zaman Serileri Analizi', N'30102', 3, 4, 3)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (30, N'Yöneylem Araştırması', N'80102', 5, 6, 8)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (31, N'Nöroloji', N'70103', 4, 5, 7)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (32, N'Akışkanlar Mekaniği', N'60102', 5, 6, 6)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (33, N'Çalışma Ekonomisi', N'40103', 6, 7, 4)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (34, N'Malzeme Bilimi', N'50102', 5, 6, 5)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (35, N'Su Kaynakları', N'50103', 3, 3, 5)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (36, N'Uzay Zaman Referans Sistemleri', N'10002', 4, 5, 10)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (37, N'Olasılığa Giriş', N'80103', 5, 6, 8)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (38, N'Hukukun Temel Kavramları', N'90103', 3, 3, 9)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (39, N'Kardiyoloji', N'70104', 4, 5, 7)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (40, N'Temel Bilgi Teknolojileri', N'30103', 6, 7, 3)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (41, N'Sosyal Politika', N'40104', 5, 6, 4)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (42, N'Jeodezide Özel Konular', N'10003', 8, 9, 10)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (43, N'İstatistiğe Giriş', N'80104', 8, 9, 8)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (44, N'Çevre Sağlığı ve Güvenliği', N'90104', 5, 6, 9)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (45, N'İleri Matematik', N'30104', 5, 9, 3)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (46, N'Sayısal Haritalama Teknikleri', N'10004', 4, 5, 10)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (47, N'Ortopedi', N'70105', 3, 4, 7)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (48, N'Betonarme', N'50104', 6, 7, 5)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (49, N'Motorlar', N'60103', 5, 5, 6)
INSERT [dbo].[ders] ([Id], [ders_adi], [ders_kodu], [kredi], [akts], [bolumId]) VALUES (50, N'İktisada Giriş', N'40105', 4, 5, 4)
SET IDENTITY_INSERT [dbo].[ders] OFF
GO
SET IDENTITY_INSERT [dbo].[ogrenci] ON 

INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (1, N'Reyhan', N'Sündük', N'17010606045', 1)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (2, N'Beyza ', N'Şahin', N'17010610002', 7)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (3, N'Kübra', N' Kurt', N'17010010040', 8)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (4, N'Mikail ', N'Ayan', N'17010610221', 2)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (5, N'Seyit Hamza', N'Yılmaz', N'17010603024', 3)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (6, N'Mert', N'Kızılırmak', N'17010604040', 4)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (7, N'Burak ', N'Özer', N'17010610229', 2)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (8, N'Elif ', N'Altuntaş', N'17010610236', 2)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (9, N'Sinem ', N'Çetin', N'17010610249', 2)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (10, N'Şahinder', N'Eker', N'17010601059', 10)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (11, N'Enes ', N'Kılıç', N'17010604052', 4)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (12, N'Feyzanur', N'Aydın', N'17010605048', 5)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (13, N'Gülbeyaz ', N'Yılmaz', N'17010605033', 5)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (14, N'Demet', N'Kaya', N'17010601049', 10)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (15, N'Nedim ', N'Özturan', N'17010609026', 6)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (16, N'Büşra ', N'Karataş', N'17010010049', 8)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (17, N'Şükriye', N'İlbaş', N'17010690020', 9)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (18, N'Sümeyye ', N'Selçuk', N'17010603028', 3)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (19, N'Emrullah', N'Küçüker', N'17010610003', 7)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (20, N'Furkan', N'Çetin', N'17010609025', 6)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (21, N'Zeynep', N'Kılınç', N'17010690029', 9)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (22, N'Canan', N'Tasasız', N'17010606020', 1)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (23, N'Şeyda', N'Zengin', N'17010605028', 5)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (24, N'Eslem', N'Yılmaz', N'17010010032', 8)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (25, N'Afra', N'Sönmez', N'17010609010', 6)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (26, N'Pelin', N'Aksoy', N'17010606054', 1)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (27, N'Kemal ', N'Yılmaz', N'17010610254', 2)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (28, N'Nursel', N'Tanrıverdi', N'17010601018', 10)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (29, N'Gülsen ', N'Uçar', N'17010610050', 7)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (30, N'Kemal', N'Ak', N'17010603043', 3)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (31, N'Atakan', N'Özsoy', N'17010604041', 4)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (33, N'Merve Ezgi', N'Durmuş', N'17010010028', 8)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (34, N'Vildan', N'Tilki', N'17010604032', 4)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (35, N'Aslı', N'Çetin', N'17010603046', 3)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (36, N'Semih', N'Öztürk', N'17010610045', 7)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (37, N'Eyüp', N'Ersoy', N'17010606027', 1)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (38, N'Furkan', N'Ateş', N'17010605057', 5)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (39, N'Yılmaz', N'Özer', N'17010606060', 1)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (40, N'Mahmut ', N'Bacanak', N'17010604017', 4)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (41, N'Melike', N'Bayraktar', N'17010690029', 9)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (42, N'İrem ', N'Göktepe', N'17010603081', 3)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (43, N'Özgür', N'Çetinbaş', N'17010609036', 6)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (44, N'Rumeysa', N'Özgür', N'17010605023', 5)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (45, N'Sena', N'Kurt', N'17010610055', 7)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (46, N'Razaman', N'Çam', N'17010601043', 10)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (47, N'Adnan', N'Özkan', N'17010690028', 9)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (48, N'Alin', N'Aksöz', N'17010010064', 8)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (49, N'Pelin', N'Uçar', N'17010609045', 6)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (50, N'Yeşim', N'Çelikkıran', N'17010601021', 10)
INSERT [dbo].[ogrenci] ([Id], [ogrenci_ad], [ogrenci_soyad], [ogenci_no], [bolumId]) VALUES (53, N'reyhan', N'sündük', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ogrenci] OFF
GO
SET IDENTITY_INSERT [dbo].[ogrenciDers] ON 

INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (1, 1, 6, 50, 60, 24)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (2, 50, 4, 55, 70, 29)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (3, 4, 13, 40, 50, 54)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (4, 3, 12, 20, 30, 14)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (5, 6, 24, 30, 40, 24)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (6, 8, 47, 45, 55, 39)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (7, 15, 5, 86, 96, 74)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (8, 25, 6, 75, 85, 61)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (9, 4, 7, 45, 35, 29)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (10, 6, 7, 15, 10, -1)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (11, 7, 8, 35, 40, 24)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (12, 24, 6, 45, 55, 39)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (13, 35, 8, 85, 70, 54)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (14, 48, 45, 46, 67, 47)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (15, 13, 6, 78, 65, 59)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (16, 17, 10, 36, 63, 34)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (17, 16, 8, 24, 42, 29)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (18, 18, 45, 65, 56, 34)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (19, 23, 6, 78, 87, 64)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (20, 26, 1, 78, 80, 64)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (21, 18, 4, 14, 41, 29)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (22, 6, 7, 35, 28, 39)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (23, 9, 3, 68, 56, 43)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (24, 1, 8, 47, 55, 29)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (25, 45, 45, 90, 95, 34)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (26, 19, 2, 45, 54, 42)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (27, 20, 3, 46, 63, 39)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (28, 33, 12, 78, 87, 69)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (29, 38, 9, 36, 63, 39)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (30, 12, 2, 78, 78, 57)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (31, 13, 13, 45, 54, 39)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (32, 9, 3, 69, 96, 64)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (33, 4, 15, 78, 42, 24)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (34, 5, 10, 14, 35, 14)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (35, 49, 2, 65, 75, 59)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (36, 24, 12, 98, 47, 49)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (37, 35, 12, 0, 15, -6)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (38, 21, 2, 0, 20, 9)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (39, 17, 9, 100, 85, 59)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (40, 6, 12, 54, 45, 34)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (41, 7, 3, 98, 90, 69)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (42, 8, 12, 0, 10, -11)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (43, 9, 9, 56, 0, -21)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (44, 47, 2, 60, 54, 33)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (45, 37, 3, 0, 26, 5)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (46, 33, 12, 78, 87, 69)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (47, 13, 3, 54, 45, 24)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (48, 13, 4, 63, 60, 44)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (49, 10, 9, 45, 0, 24)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (50, 24, 15, 0, 6, -15)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (51, 28, 17, 14, 0, -6)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (52, 34, 11, 25, 52, 39)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (53, 39, 16, 25, 30, 24)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (54, 50, 20, 100, 100, 100)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (55, 1, 14, 45, 50, 34)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (56, 5, 21, 3, 0, -11)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (57, 7, 17, 50, 45, 24)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (58, 13, 10, 35, 45, 27)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (59, 18, 15, 50, 60, 54)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (60, 13, 11, 45, 55, 39)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (61, 14, 17, 69, 45, 33)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (62, 2, 14, 60, 30, 9)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (63, 16, 20, 47, 46, 43)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (64, 22, 23, 78, 78, 57)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (65, 23, 25, 60, 65, 38)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (66, 18, 20, 0, 45, 33)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (67, 13, 25, 65, 75, 36)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (68, 43, 16, 45, 45, 33)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (69, 1, 25, 45, 0, 24)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (70, 3, 28, 70, 34, 34)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (71, 5, 18, 47, 57, 39)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (72, 7, 22, 70, 96, 69)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (73, 9, 16, 45, 54, 34)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (74, 11, 30, 90, 90, 69)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (75, 5, 19, 100, 100, 100)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (76, 14, 28, 35, 47, 24)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (77, 28, 23, 75, 65, 64)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (78, 24, 25, 90, 97, 69)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (79, 35, 19, 100, 90, 100)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (80, 45, 47, 65, 55, 54)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (81, 48, 22, 90, 85, 64)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (82, 13, 29, 47, 53, 29)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (83, 5, 48, 100, 100, 100)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (84, 8, 24, 75, 64, 64)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (85, 12, 43, 95, 54, 59)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (86, 25, 47, 74, 95, 74)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (87, 27, 26, 90, 95, 100)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (88, 28, 37, 98, 67, 74)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (89, 47, 29, 100, 98, 77)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (90, 46, 24, 95, 80, 29)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (91, 27, 50, 67, 67, 49)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (92, 29, 26, 100, 74, 54)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (93, 30, 49, 96, 86, 65)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (94, 34, 29, 64, 68, 49)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (95, 41, 50, 75, 57, 44)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (96, 40, 27, 46, 64, 54)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (97, 20, 33, 100, 86, 64)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (98, 15, 50, 85, 58, 62)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (99, 17, 29, 70, 65, 54)
GO
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (100, 18, 48, 46, 67, 44)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (101, 19, 30, 75, 80, 59)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (102, 19, 29, 100, 86, 69)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (103, 13, 30, 100, 78, 74)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (104, 15, 27, 25, 0, 4)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (105, 21, 23, 35, 45, 29)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (106, 25, 49, 45, 50, 39)
INSERT [dbo].[ogrenciDers] ([Id], [dersId], [ogrenciId], [vize], [final], [proje]) VALUES (107, NULL, NULL, 60, 70, 59)
SET IDENTITY_INSERT [dbo].[ogrenciDers] OFF
GO
SET IDENTITY_INSERT [dbo].[ogretmen] ON 

INSERT [dbo].[ogretmen] ([Id], [ogretmen_adi], [ogretmen_soyadi], [dogumyeri], [bolumId]) VALUES (1, N'İbrahim', N'Alışkan', N'Gaziosmanpaşa', 8)
INSERT [dbo].[ogretmen] ([Id], [ogretmen_adi], [ogretmen_soyadi], [dogumyeri], [bolumId]) VALUES (2, N'Aytaç', N'Altan', N'Sultangazi', 9)
INSERT [dbo].[ogretmen] ([Id], [ogretmen_adi], [ogretmen_soyadi], [dogumyeri], [bolumId]) VALUES (3, N'Gülhan', N'ustabaş', N'Kağıthane', 5)
INSERT [dbo].[ogretmen] ([Id], [ogretmen_adi], [ogretmen_soyadi], [dogumyeri], [bolumId]) VALUES (4, N'Zehra', N'Saraç', N'Ümraniye', 1)
INSERT [dbo].[ogretmen] ([Id], [ogretmen_adi], [ogretmen_soyadi], [dogumyeri], [bolumId]) VALUES (5, N'Egemen ', N'Belge', N'Üsküdar', 3)
INSERT [dbo].[ogretmen] ([Id], [ogretmen_adi], [ogretmen_soyadi], [dogumyeri], [bolumId]) VALUES (6, N'Nihat', N'Pamuk', N'Gaziosmanpaşa', 7)
INSERT [dbo].[ogretmen] ([Id], [ogretmen_adi], [ogretmen_soyadi], [dogumyeri], [bolumId]) VALUES (7, N'Seda', N'Kartal', N'Kağıthane', 6)
INSERT [dbo].[ogretmen] ([Id], [ogretmen_adi], [ogretmen_soyadi], [dogumyeri], [bolumId]) VALUES (8, N'Hakan', N'ustabaş', N'Üsküdar', 10)
INSERT [dbo].[ogretmen] ([Id], [ogretmen_adi], [ogretmen_soyadi], [dogumyeri], [bolumId]) VALUES (9, N'İrem', N'Şenyer', N'Çatalca', 2)
INSERT [dbo].[ogretmen] ([Id], [ogretmen_adi], [ogretmen_soyadi], [dogumyeri], [bolumId]) VALUES (10, N'Rıdvan ', N'Keskin', N'Gaziosmanpaşa', 4)
INSERT [dbo].[ogretmen] ([Id], [ogretmen_adi], [ogretmen_soyadi], [dogumyeri], [bolumId]) VALUES (13, N'Aysun', NULL, N'Silivri', NULL)
SET IDENTITY_INSERT [dbo].[ogretmen] OFF
GO
SET IDENTITY_INSERT [dbo].[ogretmenDers] ON 

INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (1, 1, 7)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (2, 3, 8)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (3, 5, 20)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (4, 7, 13)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (5, 9, 2)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (6, 10, 4)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (7, 3, 8)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (8, 2, 17)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (9, 4, 5)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (10, 6, 23)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (11, 8, 20)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (12, 1, 22)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (13, 5, 1)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (14, 7, 21)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (15, 9, 18)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (16, 4, 5)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (17, 10, 2)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (18, 4, 3)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (19, 4, 5)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (20, 5, 6)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (21, 10, 29)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (22, 1, 34)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (23, 3, 35)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (24, 5, 24)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (25, 2, 35)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (26, 4, 36)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (27, 3, 24)
INSERT [dbo].[ogretmenDers] ([Id], [ogretmenId], [dersId]) VALUES (28, 6, 28)
SET IDENTITY_INSERT [dbo].[ogretmenDers] OFF
GO
ALTER TABLE [dbo].[ders]  WITH CHECK ADD FOREIGN KEY([bolumId])
REFERENCES [dbo].[bolum] ([Id])
GO
ALTER TABLE [dbo].[ogrenci]  WITH CHECK ADD FOREIGN KEY([bolumId])
REFERENCES [dbo].[bolum] ([Id])
GO
ALTER TABLE [dbo].[ogrenciDers]  WITH CHECK ADD FOREIGN KEY([ogrenciId])
REFERENCES [dbo].[ogrenci] ([Id])
GO
ALTER TABLE [dbo].[ogretmen]  WITH CHECK ADD FOREIGN KEY([bolumId])
REFERENCES [dbo].[bolum] ([Id])
GO
ALTER TABLE [dbo].[ogretmenDers]  WITH CHECK ADD FOREIGN KEY([dersId])
REFERENCES [dbo].[ders] ([Id])
GO
ALTER TABLE [dbo].[ogretmenDers]  WITH CHECK ADD FOREIGN KEY([ogretmenId])
REFERENCES [dbo].[ogretmen] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[bolumEkleyici]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bolumEkleyici]
(@bolumad nvarchar(20),
@bolumtel nvarchar(20))
as insert into bolum(bolum_adi,bolum.eposta)
values(@bolumad, @bolumtel)
GO
/****** Object:  StoredProcedure [dbo].[isimEkle]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[isimEkle]
(@Adi nvarchar(20),
@dyeri nvarchar(100))
as insert into ogretmen(ogretmen_adi,dogumyeri) 
values(@Adi,@dyeri)
GO
/****** Object:  StoredProcedure [dbo].[notEkle]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[notEkle]
(@vize int,
@final int,
@proje int)
as insert into ogrenciDers(vize,final,proje)
values(@vize,@final,@proje)
GO
/****** Object:  StoredProcedure [dbo].[notGetir]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[notGetir]
(@bolumAdi nvarchar (30),
@Not1 int,
@Not2 int)
as select* from ogrenciDers inner join bolum on  ogrenciDers.Id=bolum.Id 
where bolum_adi=@bolumAdi and vize between @Not1 and @Not2
GO
/****** Object:  StoredProcedure [dbo].[ogrenciSil]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ogrenciSil]
(@ogrencisil nvarchar(20))
as 
	begin
		if exists (select*from ogrenci where ogrenci_ad=@ogrencisil)
	delete from ogrenci where ogrenci_ad=@ogrencisil
	end
GO
/****** Object:  StoredProcedure [dbo].[projeNotuEkle]    Script Date: 6.12.2022 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[projeNotuEkle](
@proje int)
as update ogrenciDers set proje-=@proje where proje!=100
GO
