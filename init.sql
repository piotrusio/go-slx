IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'ERPXL_GO')
BEGIN
  CREATE DATABASE ERPXL_GO;
END
GO

USE ERPXL_GO;
GO

-- create schema if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'CDN')
BEGIN
  EXEC('CREATE SCHEMA CDN');
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[Dostawy](
	[Dst_GIDTyp] [smallint] NULL,
	[Dst_GIDFirma] [int] NULL,
	[Dst_GIDNumer] [int] IDENTITY(1,1) NOT NULL,
	[Dst_GIDLp] [smallint] NULL,
	[Dst_TrnTyp] [smallint] NULL,
	[Dst_TrnFirma] [int] NULL,
	[Dst_TrnNumer] [int] NULL,
	[Dst_TrnLp] [smallint] NULL,
	[Dst_SubTrnLp] [smallint] NULL,
	[Dst_TwrTyp] [smallint] NULL,
	[Dst_TwrFirma] [int] NULL,
	[Dst_TwrNumer] [int] NULL,
	[Dst_TwrLp] [smallint] NULL,
	[Dst_KsiegowaNetto] [decimal](15, 2) NULL,
	[Dst_KsiegowaBrutto] [decimal](15, 2) NULL,
	[Dst_RzeczywistaNetto] [decimal](15, 2) NULL,
	[Dst_KosztKsiegowy] [decimal](15, 2) NULL,
	[Dst_KosztRzeczywisty] [decimal](15, 2) NULL,
	[Dst_Cecha] [varchar](255) NULL,
	[Dst_Ean] [varchar](40) NULL,
	[Dst_DataW] [int] NULL,
	[Dst_Ilosc] [decimal](15, 4) NULL,
	[Dst_DstTStamp] [int] NULL,
	[Dst_Polozenie] [varchar](64) NULL,
	[Dst_CCKTyp] [smallint] NULL,
	[Dst_CCKFirma] [int] NULL,
	[Dst_CCKNumer] [int] NULL,
	[Dst_CCKLp] [smallint] NULL,
	[Dst_WspFin] [decimal](10, 4) NULL,
	[Dst_KosztUstalono] [tinyint] NULL,
	[Dst_TpAId] [int] NULL,
	[Dst_ZewnetrznySys] [int] NULL,
	[Dst_ZewnetrznyId] [int] NULL,
	[Dst_OplataSpozFlaga] [tinyint] NULL,
 CONSTRAINT [Dst_Primary] PRIMARY KEY CLUSTERED 
(
	[Dst_GIDNumer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[KntAdresy]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[KntAdresy](
	[KnA_GIDTyp] [smallint] NULL,
	[KnA_GIDFirma] [int] NULL,
	[KnA_GIDNumer] [int] IDENTITY(1,1) NOT NULL,
	[KnA_GIDLp] [smallint] NULL,
	[KnA_KntTyp] [smallint] NULL,
	[KnA_KntFirma] [int] NULL,
	[KnA_KntNumer] [int] NULL,
	[KnA_KntLp] [smallint] NULL,
	[KnA_DataArc] [int] NULL,
	[KnA_Akronim] [varchar](20) NULL,
	[KnA_Wysylkowy] [tinyint] NULL,
	[KnA_Nazwa1] [varchar](50) NULL,
	[KnA_Nazwa2] [varchar](50) NULL,
	[KnA_Nazwa3] [varchar](250) NULL,
	[KnA_KodP] [varchar](10) NULL,
	[KnA_Miasto] [varchar](30) NULL,
	[KnA_Ulica] [varchar](30) NULL,
	[KnA_Adres] [varchar](30) NULL,
	[KnA_NipE] [varchar](20) NULL,
	[KnA_Nip] [varchar](20) NULL,
	[KnA_NipPrefiks] [varchar](2) NULL,
	[KnA_Regon] [varchar](20) NULL,
	[KnA_Pesel] [varchar](11) NULL,
	[KnA_KontoDostawcy] [varchar](50) NULL,
	[KnA_KontoOdbiorcy] [varchar](50) NULL,
	[KnA_Kraj] [varchar](2) NULL,
	[KnA_Powiat] [varchar](30) NULL,
	[KnA_Gmina] [varchar](30) NULL,
	[KnA_Wojewodztwo] [varchar](30) NULL,
	[KnA_RegionCRM] [int] NULL,
	[KnA_GLN] [varchar](13) NULL,
	[KnA_Telefon1] [varchar](30) NULL,
	[KnA_Telefon2] [varchar](30) NULL,
	[KnA_Fax] [varchar](30) NULL,
	[KnA_Modem] [varchar](30) NULL,
	[KnA_Telex] [varchar](30) NULL,
	[KnA_EMail] [varchar](255) NULL,
	[KnA_BnkTyp] [smallint] NULL,
	[KnA_BnkFirma] [int] NULL,
	[KnA_BnkNumer] [int] NULL,
	[KnA_BnkLp] [smallint] NULL,
	[KnA_NrRachunku] [varchar](50) NULL,
	[KnA_LastModL] [int] NULL,
	[KnA_Odleglosc] [decimal](10, 2) NULL,
	[KnA_NRB] [smallint] NULL,
	[KnA_NiePublikuj] [smallint] NULL,
	[KnA_Domyslny] [smallint] NULL,
	[KnA_DokumentTozsamosci] [varchar](50) NULL,
	[KnA_DataWydania] [int] NULL,
	[KnA_OrganWydajacy] [varchar](50) NULL,
	[KnA_RolnikRyczaltowy] [tinyint] NULL,
	[KnA_StanPostep] [tinyint] NULL,
	[KnA_PlatnikVat] [tinyint] NULL,
	[KnA_GPSSz] [decimal](9, 6) NULL,
	[KnA_GPSDl] [decimal](9, 6) NULL,
	[KnA_GPSDataPobrania] [int] NULL,
	[KnA_GPSGodzinaPobrania] [int] NULL,
	[KnA_KnaPierwotny] [int] NULL,
	[KnA_KnaArchiwizowanego] [int] NULL,
	[KnA_Osoba] [smallint] NULL,
	[KnA_Opis] [varchar](2000) NULL,
	[KnA_Anonim] [tinyint] NULL,
	[KnA_AdresBank] [tinyint] NULL,
	[KnA_MetodaKasowa] [tinyint] NULL,
	[KnA_GUID] [varchar](41) NULL,
	[KnA_GUIDdane] [varchar](41) NULL,
	[KnA_VatDataRejestracji] [int] NULL,
	[KnA_VatDataOdmowy] [int] NULL,
	[KnA_VatDataPrzywrocenia] [int] NULL,
	[KnA_VatDataUsuniecia] [int] NULL,
	[KnA_VatDataSprawdzenia] [int] NULL,
	[KnA_KrajSiedziby] [varchar](2) NULL,
	[KnA_TypPOS] [smallint] NULL,
	[KnA_GUIDEmail] [varchar](41) NULL,
	[KnA_GUIDTelefon] [varchar](41) NULL,
	[KnA_UlicaCDC] [varchar](60) NULL,
	[KnA_NrDomuCDC] [varchar](10) NULL,
	[KnA_NrMieszkaniaCDC] [varchar](10) NULL,
	[KnA_CharsetANSI] [tinyint] NULL,
 CONSTRAINT [KnA_Primary] PRIMARY KEY CLUSTERED 
(
	[KnA_GIDNumer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[KntGrupyDom]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[KntGrupyDom](
	[KGD_GIDTyp] [smallint] NOT NULL,
	[KGD_GIDFirma] [int] NULL,
	[KGD_GIDNumer] [int] NOT NULL,
	[KGD_GIDLp] [smallint] NULL,
	[KGD_GrOTyp] [smallint] NULL,
	[KGD_GrOFirma] [int] NULL,
	[KGD_GrONumer] [int] NULL,
	[KGD_GrOLp] [smallint] NULL,
	[KGD_Kod] [varchar](40) NULL,
 CONSTRAINT [KGD_Primary] PRIMARY KEY CLUSTERED 
(
	[KGD_GIDTyp] ASC,
	[KGD_GIDNumer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[KntKarty]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[KntKarty](
	[Knt_GIDTyp] [smallint] NULL,
	[Knt_GIDFirma] [int] NULL,
	[Knt_GIDNumer] [int] IDENTITY(1,1) NOT NULL,
	[Knt_GIDLp] [smallint] NULL,
	[Knt_KnATyp] [smallint] NULL,
	[Knt_KnAFirma] [int] NULL,
	[Knt_KnANumer] [int] NULL,
	[Knt_KnALp] [smallint] NULL,
	[Knt_Typ] [tinyint] NULL,
	[Knt_Akwizytor] [smallint] NULL,
	[Knt_Akronim] [varchar](20) NULL,
	[Knt_AkronimFormat] [varchar](30) NULL,
	[Knt_FppKod] [varchar](8) NULL,
	[Knt_Nazwa1] [varchar](50) NULL,
	[Knt_Nazwa2] [varchar](50) NULL,
	[Knt_Nazwa3] [varchar](250) NULL,
	[Knt_KodP] [varchar](10) NULL,
	[Knt_Miasto] [varchar](30) NULL,
	[Knt_Ulica] [varchar](30) NULL,
	[Knt_Adres] [varchar](30) NULL,
	[Knt_NipE] [varchar](20) NULL,
	[Knt_Nip] [varchar](20) NULL,
	[Knt_NipPrefiks] [varchar](2) NULL,
	[Knt_Regon] [varchar](20) NULL,
	[Knt_Pesel] [varchar](11) NULL,
	[Knt_KontoDostawcy] [varchar](50) NULL,
	[Knt_KontoOdbiorcy] [varchar](50) NULL,
	[Knt_Kraj] [varchar](2) NULL,
	[Knt_Powiat] [varchar](30) NULL,
	[Knt_Gmina] [varchar](30) NULL,
	[Knt_Wojewodztwo] [varchar](30) NULL,
	[Knt_RegionCRM] [int] NULL,
	[Knt_GLN] [varchar](13) NULL,
	[Knt_Telefon1] [varchar](30) NULL,
	[Knt_Telefon2] [varchar](30) NULL,
	[Knt_Fax] [varchar](30) NULL,
	[Knt_Modem] [varchar](30) NULL,
	[Knt_Telex] [varchar](30) NULL,
	[Knt_EMail] [varchar](255) NULL,
	[Knt_URL] [varchar](255) NULL,
	[Knt_BnkTyp] [smallint] NULL,
	[Knt_BnkFirma] [int] NULL,
	[Knt_BnkNumer] [int] NULL,
	[Knt_BnkLp] [smallint] NULL,
	[Knt_NrRachunku] [varchar](50) NULL,
	[Knt_Soundex] [varchar](20) NULL,
	[Knt_Rabat] [decimal](5, 2) NULL,
	[Knt_LimitWart] [decimal](15, 2) NULL,
	[Knt_MaxLimitWart] [decimal](15, 2) NULL,
	[Knt_LimitPoTerminie] [decimal](15, 2) NULL,
	[Knt_LimitOkres] [smallint] NULL,
	[Knt_Dewizowe] [tinyint] NULL,
	[Knt_Symbol] [varchar](3) NULL,
	[Knt_NrKursu] [smallint] NULL,
	[Knt_Cena] [smallint] NULL,
	[Knt_FormaPl] [tinyint] NULL,
	[Knt_Marza] [decimal](5, 2) NULL,
	[Knt_TypKarty] [smallint] NULL,
	[Knt_NumerKarty] [varchar](16) NULL,
	[Knt_DataKarty] [int] NULL,
	[Knt_Ean] [varchar](16) NULL,
	[Knt_ObcaKarta] [smallint] NULL,
	[Knt_Osoba] [smallint] NULL,
	[Knt_ExpoKraj] [tinyint] NULL,
	[Knt_SeriaFa] [varchar](5) NULL,
	[Knt_PlatnikVat] [tinyint] NULL,
	[Knt_TypDok] [smallint] NULL,
	[Knt_Status] [tinyint] NULL,
	[Knt_FAVATData] [int] NULL,
	[Knt_SposobDostawy] [varchar](20) NULL,
	[Knt_HasloChk] [varchar](2) NULL,
	[Knt_HasloKontrahent] [varchar](11) NULL,
	[Knt_Dzialalnosc] [tinyint] NULL,
	[Knt_ZTrTyp] [smallint] NULL,
	[Knt_ZTrFirma] [int] NULL,
	[Knt_ZTrNumer] [int] NULL,
	[Knt_ZTrLp] [smallint] NULL,
	[Knt_OpeTyp] [smallint] NULL,
	[Knt_OpeFirma] [int] NULL,
	[Knt_OpeNumer] [int] NULL,
	[Knt_OpeLp] [smallint] NULL,
	[Knt_AkwTyp] [smallint] NULL,
	[Knt_AkwFirma] [int] NULL,
	[Knt_AkwNumer] [int] NULL,
	[Knt_AkwLp] [smallint] NULL,
	[Knt_PrcTyp] [smallint] NULL,
	[Knt_PrcFirma] [int] NULL,
	[Knt_PrcNumer] [int] NULL,
	[Knt_PrcLp] [smallint] NULL,
	[Knt_Atrybut1] [varchar](20) NULL,
	[Knt_Format1] [tinyint] NULL,
	[Knt_Wartosc1] [varchar](255) NULL,
	[Knt_Atrybut2] [varchar](20) NULL,
	[Knt_Format2] [tinyint] NULL,
	[Knt_Wartosc2] [varchar](255) NULL,
	[Knt_Atrybut3] [varchar](20) NULL,
	[Knt_Format3] [tinyint] NULL,
	[Knt_Wartosc3] [varchar](255) NULL,
	[Knt_AkwProwizja] [decimal](7, 4) NULL,
	[Knt_Umowa] [varchar](30) NULL,
	[Knt_DataW] [int] NULL,
	[Knt_LastModL] [int] NULL,
	[Knt_LastModO] [int] NULL,
	[Knt_LastModC] [int] NULL,
	[Knt_FaVATOsw] [varchar](30) NULL,
	[Knt_CechaOpis] [varchar](250) NULL,
	[Knt_Aktywna] [int] NULL,
	[Knt_Wsk] [tinyint] NULL,
	[Knt_OutlookUrl] [varchar](255) NULL,
	[Knt_Nieaktywny] [tinyint] NULL,
	[Knt_Zrodlo] [int] NULL,
	[Knt_Branza] [int] NULL,
	[Knt_Rodzaj] [int] NULL,
	[Knt_RolaPartnera] [int] NULL,
	[Knt_Odleglosc] [decimal](10, 2) NULL,
	[Knt_KarTyp] [smallint] NULL,
	[Knt_KarFirma] [int] NULL,
	[Knt_KarNumer] [int] NULL,
	[Knt_KarLp] [smallint] NULL,
	[Knt_NRB] [smallint] NULL,
	[Knt_Archiwalny] [smallint] NULL,
	[Knt_AdresNieAktualny] [smallint] NULL,
	[Knt_LastTransLockDate] [int] NULL,
	[Knt_OpeTypM] [smallint] NULL,
	[Knt_OpeFirmaM] [int] NULL,
	[Knt_OpeNumerM] [int] NULL,
	[Knt_OpeLpM] [smallint] NULL,
	[Knt_BlokadaTransakcji] [smallint] NULL,
	[Knt_Oddzialowy] [smallint] NULL,
	[Knt_Spedytor] [tinyint] NULL,
	[Knt_TerminPlKa] [int] NULL,
	[Knt_FormaPlKa] [int] NULL,
	[Knt_TerminPlZak] [int] NULL,
	[Knt_FormaPlZak] [int] NULL,
	[Knt_SpTerminPlSpr] [int] NULL,
	[Knt_SpTerminPlRK] [int] NULL,
	[Knt_SpTerminPlZak] [int] NULL,
	[Knt_LimitTerminowy] [smallint] NULL,
	[Knt_DataWygasniecia] [int] NULL,
	[Knt_PIN] [varchar](4) NULL,
	[Knt_Priorytet] [int] NULL,
	[Knt_FrsID] [int] NULL,
	[Knt_Controlling] [tinyint] NULL,
	[Knt_RolnikRyczaltowy] [tinyint] NULL,
	[Knt_PriorytetRez] [tinyint] NULL,
	[Knt_Powiazany] [tinyint] NULL,
	[Knt_PlatnoscKaucji] [tinyint] NULL,
	[Knt_TerminRozliczeniaKaucji] [int] NULL,
	[Knt_KnPTyp] [smallint] NULL,
	[Knt_KnPNumer] [int] NULL,
	[Knt_KnPParam] [tinyint] NULL,
	[Knt_DataUtworzenia] [int] NULL,
	[Knt_DokumentTozsamosci] [varchar](50) NULL,
	[Knt_DataWydania] [int] NULL,
	[Knt_OrganWydajacy] [varchar](50) NULL,
	[Knt_MaxDniPoTerminie] [int] NULL,
	[Knt_KalendarzDst] [int] NULL,
	[Knt_KalendarzWys] [int] NULL,
	[Knt_KnGTyp] [smallint] NULL,
	[Knt_KnGNumer] [int] NULL,
	[Knt_Punkty] [decimal](14, 2) NULL,
	[Knt_KnCTyp] [smallint] NULL,
	[Knt_KnCNumer] [int] NULL,
	[Knt_EFaVatAktywne] [tinyint] NULL,
	[Knt_EFaVatOsw] [varchar](30) NULL,
	[Knt_EFaVatDataDo] [int] NULL,
	[Knt_EFaVatEMail] [varchar](255) NULL,
	[Knt_PodatnikiemNabywca] [tinyint] NULL,
	[Knt_MSTwrGrupaNumer] [int] NULL,
	[Knt_StanPostep] [tinyint] NULL,
	[Knt_ESklep] [tinyint] NULL,
	[Knt_BlokadaZam] [tinyint] NULL,
	[Knt_BlokadaZamTS] [int] NULL,
	[Knt_OpZTyp] [smallint] NULL,
	[Knt_OpZFirma] [int] NULL,
	[Knt_OpZNumer] [int] NULL,
	[Knt_OpZLp] [smallint] NULL,
	[Knt_TypDokZS] [int] NULL,
	[Knt_TypDokZZ] [int] NULL,
	[Knt_PojedynczeDokDoZam] [tinyint] NULL,
	[Knt_MaxTerminPlSpr] [int] NULL,
	[Knt_MaxTerminPlZak] [int] NULL,
	[Knt_DataOdLoj] [int] NULL,
	[Knt_DataDoLoj] [int] NULL,
	[Knt_KartaLoj] [varchar](40) NULL,
	[Knt_PunktyOdebr] [decimal](13, 2) NULL,
	[Knt_PunktyNalicz] [decimal](13, 2) NULL,
	[Knt_PunktyKorekta] [decimal](10, 2) NULL,
	[Knt_PodzialPlat] [tinyint] NULL,
	[Knt_VatWalSys] [tinyint] NULL,
	[Knt_SplitPayment] [tinyint] NULL,
	[Knt_Anonim] [tinyint] NULL,
	[Knt_MetodaKasowa] [tinyint] NULL,
	[Knt_GUID] [varchar](41) NULL,
	[Knt_GUIDdane] [varchar](41) NULL,
	[Knt_DataPromocji] [tinyint] NULL,
	[Knt_VatDataRejestracji] [int] NULL,
	[Knt_VatDataPrzywrocenia] [int] NULL,
	[Knt_VatDataOdmowy] [int] NULL,
	[Knt_VatDataUsuniecia] [int] NULL,
	[Knt_KrajSiedziby] [varchar](2) NULL,
	[Knt_ProcTrnJpk] [varchar](50) NULL,
	[Knt_Kurier] [int] NULL,
	[Knt_OplataSpozZakup] [int] NULL,
	[Knt_OplataSpozSprzedaz] [int] NULL,
	[Knt_WSTO] [tinyint] NULL,
	[Knt_KSeFWyslij] [tinyint] NULL,
	[Knt_AutoZatw] [tinyint] NULL,
	[Knt_KSeFZrodlowy] [tinyint] NULL,
	[Knt_GUIDKarta] [varchar](41) NULL,
	[Knt_CharsetANSI] [tinyint] NULL,
	[Knt_BigApfinoVycWynik] [int] NULL,
	[Knt_BigApfinoVycWynikData] [int] NULL,
	[Knt_BigApfinoVycOczekiwanie] [int] NULL,
	[Knt_AutoWindykacjaApfino] [tinyint] NULL,
 CONSTRAINT [Knt_Primary] PRIMARY KEY CLUSTERED 
(
	[Knt_GIDNumer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[KntLimityK]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[KntLimityK](
	[KLK_Id] [int] IDENTITY(1,1) NOT NULL,
	[KLK_KntTyp] [smallint] NULL,
	[KLK_KntNumer] [int] NULL,
	[KLK_MaxLimitWart] [decimal](15, 2) NULL,
	[KLK_LimitPoTerminie] [decimal](15, 2) NULL,
	[KLK_DataOd] [int] NULL,
	[KLK_DataDo] [int] NULL,
	[KLK_Waluta] [varchar](3) NULL,
	[KLK_NrKursu] [smallint] NULL,
	[KLK_KursM] [decimal](5, 0) NULL,
	[KLK_KursL] [decimal](15, 10) NULL,
	[KLK_PrzeliczajWg] [varchar](20) NULL,
	[KLK_CzasUtworzenia] [int] NULL,
	[KLK_OpeUtworzyl] [int] NULL,
	[KLK_CzasModyfikacji] [int] NULL,
	[KLK_OpeModyfikowal] [int] NULL,
	[KLK_PrzeliczajWgTyp] [tinyint] NULL,
 CONSTRAINT [KLK_Primary] PRIMARY KEY CLUSTERED 
(
	[KLK_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[KntOpiekun]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[KntOpiekun](
	[KtO_KntTyp] [smallint] NOT NULL,
	[KtO_KntNumer] [int] NOT NULL,
	[KtO_KntLp] [smallint] NOT NULL,
	[KtO_PrcNumer] [int] NOT NULL,
	[KtO_DataOd] [int] NOT NULL,
	[KtO_DataDo] [int] NOT NULL,
	[KtO_Glowny] [tinyint] NULL,
	[KtO_OpeTyp] [smallint] NULL,
	[KtO_OpeFirma] [int] NULL,
	[KtO_OpeNumer] [int] NULL,
	[KtO_OpeLp] [smallint] NULL,
	[KtO_OpeTypM] [smallint] NULL,
	[KtO_OpeFirmaM] [int] NULL,
	[KtO_OpeNumerM] [int] NULL,
	[KtO_OpeLpM] [smallint] NULL,
	[KtO_Uwagi] [varchar](256) NULL,
	[KtO_CzasPrzypisania] [int] NULL,
	[KtO_CzasModyfikacji] [int] NULL,
 CONSTRAINT [KtO_Primary] PRIMARY KEY CLUSTERED 
(
	[KtO_KntNumer] ASC,
	[KtO_KntTyp] ASC,
	[KtO_KntLp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[KntOsoby]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[KntOsoby](
	[KnS_KntTyp] [smallint] NOT NULL,
	[KnS_KntFirma] [int] NULL,
	[KnS_KntNumer] [int] NOT NULL,
	[KnS_KntLp] [smallint] NOT NULL,
	[KnS_Upowazniona] [tinyint] NULL,
	[KnS_UpowaznionaZam] [tinyint] NULL,
	[KnS_Dzial] [varchar](40) NULL,
	[KnS_Stanowisko] [varchar](40) NULL,
	[KnS_Tytul] [varchar](40) NULL,
	[KnS_Nazwa] [varchar](40) NULL,
	[KnS_Telefon] [varchar](30) NULL,
	[KnS_EMail] [varchar](255) NULL,
	[KnS_HasloChk] [varchar](2) NULL,
	[KnS_HasloOsoby] [varchar](11) NULL,
	[KnS_Notatki] [varchar](1024) NULL,
	[KnS_RolaDecyzyjna] [int] NULL,
	[KnS_Fax] [varchar](30) NULL,
	[KnS_TelefonK] [varchar](30) NULL,
	[KnS_UpoDoK] [smallint] NULL,
	[KnS_Archiwalny] [tinyint] NULL,
	[KnS_Pozycja] [smallint] NULL,
	[KnS_CzasModyfikacji] [int] NULL,
	[KnS_AdresId] [int] NULL,
	[KnS_OdpWindykacja] [tinyint] NULL,
	[KnS_Anonim] [tinyint] NULL,
	[KnS_SyncID] [int] IDENTITY(1,1) NOT NULL,
	[KnS_ESklep] [tinyint] NULL,
	[KnS_AdminESklep] [tinyint] NULL,
	[KnS_PreferowanyJezyk] [int] NULL,
	[KnS_GUID] [varchar](40) NULL,
	[KnS_GUID2] [varchar](40) NULL,
	[KnS_CzyEMailUpom] [tinyint] NULL,
	[KnS_CharsetANSI] [tinyint] NULL,
 CONSTRAINT [KnS_Primary] PRIMARY KEY CLUSTERED 
(
	[KnS_KntTyp] ASC,
	[KnS_KntNumer] ASC,
	[KnS_KntLp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[KntPromocje]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[KntPromocje](
	[KPR_Id] [int] IDENTITY(1,1) NOT NULL,
	[KPR_PrmId] [int] NULL,
	[KPR_KntTyp] [smallint] NULL,
	[KPR_KntFirma] [int] NULL,
	[KPR_KntNumer] [int] NULL,
	[KPR_KntLp] [smallint] NULL,
	[KPR_KngTyp] [smallint] NULL,
	[KPR_KngFirma] [int] NULL,
	[KPR_KngNumer] [int] NULL,
	[KPR_KngLp] [smallint] NULL,
	[KPR_Typ] [int] NULL,
	[KPR_Wartosc] [decimal](15, 4) NULL,
	[KPR_OkresTransakcjiOd] [int] NULL,
	[KPR_OkresTransakcjiDo] [int] NULL,
	[KPR_Punkty] [decimal](13, 2) NULL,
	[KPR_GUID] [varchar](41) NULL,
 CONSTRAINT [KPR_Primary] PRIMARY KEY CLUSTERED 
(
	[KPR_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[Magazyny]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[Magazyny](
	[MAG_GIDTyp] [smallint] NULL,
	[MAG_GIDFirma] [int] NULL,
	[MAG_GIDNumer] [int] IDENTITY(1,1) NOT NULL,
	[MAG_GIDLp] [smallint] NULL,
	[MAG_Kod] [varchar](10) NULL,
	[MAG_Nazwa] [varchar](30) NULL,
	[MAG_KodP] [varchar](10) NULL,
	[MAG_Miasto] [varchar](30) NULL,
	[MAG_Ulica] [varchar](30) NULL,
	[MAG_Adres] [varchar](30) NULL,
	[MAG_PrcTyp] [smallint] NULL,
	[MAG_PrcFirma] [int] NULL,
	[MAG_PrcNumer] [int] NULL,
	[MAG_PrcLp] [smallint] NULL,
	[MAG_Pojemnosc] [decimal](15, 2) NULL,
	[MAG_Konto] [varchar](50) NULL,
	[MAG_Opis] [varchar](200) NULL,
	[MAG_Wewnetrzny] [tinyint] NULL,
	[MAG_Pico] [tinyint] NULL,
	[MAG_Zarzadzanie] [tinyint] NULL,
	[MAG_KntTyp] [smallint] NULL,
	[MAG_KntFirma] [int] NULL,
	[MAG_KntNumer] [int] NULL,
	[MAG_KntLp] [smallint] NULL,
	[MAG_Zablokowany] [tinyint] NULL,
	[MAG_DataInw] [int] NULL,
	[MAG_KontoInw] [varchar](50) NULL,
	[MAG_Kraj] [varchar](2) NULL,
	[MAG_CzasModyfikacji] [int] NULL,
	[MAG_OpeMNumer] [int] NULL,
	[MAG_AnalizaA] [decimal](5, 2) NULL,
	[MAG_AnalizaB] [decimal](5, 2) NULL,
	[MAG_AnalizaX] [decimal](5, 2) NULL,
	[MAG_AnalizaY] [decimal](5, 2) NULL,
	[MAG_AnalizaABCXYZ] [tinyint] NULL,
	[MAG_WMS] [tinyint] NULL,
	[MAG_SposobPracyZWMS] [smallint] NULL,
	[MAG_RealizujTylkoRezZas] [tinyint] NULL,
	[MAG_WMSNumer] [int] NULL,
	[MAG_WMSRodzaj] [tinyint] NULL,
	[MAG_SposobGenDokMagWMS] [tinyint] NULL,
	[MAG_PcKId] [int] NULL,
	[MAG_RezerwujZasoby] [tinyint] NULL,
	[MAG_KontrolaIlosciWZWM] [tinyint] NULL,
	[MAG_RealizujwPOS] [tinyint] NULL,
 CONSTRAINT [MAG_Primary] PRIMARY KEY CLUSTERED 
(
	[MAG_GIDNumer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[Nazwy]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[Nazwy](
	[Naz_GIDTyp] [smallint] NOT NULL,
	[Naz_GIDFirma] [int] NULL,
	[Naz_GIDNumer] [int] NULL,
	[Naz_GIDLp] [smallint] NOT NULL,
	[Naz_Nazwa] [varchar](250) NULL,
	[Naz_Nazwa1] [varchar](30) NULL,
	[Naz_Opis] [varchar](60) NULL,
	[Naz_Archiwalny] [tinyint] NULL,
	[Naz_CzasModyfikacji] [int] NULL,
	[Naz_Predefiniowana] [tinyint] NULL,
	[Naz_Nazwa2] [varchar](30) NULL,
 CONSTRAINT [Naz_Primary] PRIMARY KEY CLUSTERED 
(
	[Naz_GIDTyp] ASC,
	[Naz_GIDLp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[PrcKarty]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[PrcKarty](
	[Prc_GIDTyp] [smallint] NULL,
	[Prc_GIDFirma] [int] NULL,
	[Prc_GIDNumer] [int] IDENTITY(1,1) NOT NULL,
	[Prc_GIDLp] [smallint] NULL,
	[Prc_OpeTyp] [smallint] NULL,
	[Prc_OpeFirma] [int] NULL,
	[Prc_OpeNumer] [int] NULL,
	[Prc_OpeLp] [smallint] NULL,
	[Prc_BnkTyp] [smallint] NULL,
	[Prc_BnkFirma] [int] NULL,
	[Prc_BnkNumer] [int] NULL,
	[Prc_BnkLp] [smallint] NULL,
	[Prc_ZakTyp] [smallint] NULL,
	[Prc_ZakFirma] [int] NULL,
	[Prc_ZakNumer] [int] NULL,
	[Prc_ZakLp] [smallint] NULL,
	[Prc_Akronim] [varchar](20) NULL,
	[Prc_Imie1] [varchar](30) NULL,
	[Prc_Imie2] [varchar](30) NULL,
	[Prc_Nazwisko] [varchar](50) NULL,
	[Prc_KodP] [varchar](10) NULL,
	[Prc_Miasto] [varchar](40) NULL,
	[Prc_Poczta] [varchar](40) NULL,
	[Prc_Ulica] [varchar](30) NULL,
	[Prc_NrDomu] [varchar](10) NULL,
	[Prc_NrLokalu] [varchar](10) NULL,
	[Prc_NipE] [varchar](20) NULL,
	[Prc_Nip] [varchar](20) NULL,
	[Prc_Pesel] [varchar](11) NULL,
	[Prc_EMail] [varchar](255) NULL,
	[Prc_EMail2] [varchar](255) NULL,
	[Prc_Telefon1] [varchar](30) NULL,
	[Prc_TelefonWew1] [varchar](10) NULL,
	[Prc_Telefon2] [varchar](30) NULL,
	[Prc_Telefon3] [varchar](30) NULL,
	[Prc_Telefon4] [varchar](30) NULL,
	[Prc_URL] [varchar](255) NULL,
	[Prc_URL2] [varchar](255) NULL,
	[Prc_NrRachunku] [varchar](50) NULL,
	[Prc_NRB] [tinyint] NULL,
	[Prc_KontoKs1] [varchar](50) NULL,
	[Prc_KontoKs2] [varchar](50) NULL,
	[Prc_KontoKs3] [varchar](50) NULL,
	[Prc_KontoKs4] [varchar](50) NULL,
	[Prc_KontoKs5] [varchar](50) NULL,
	[Prc_FormaNr] [tinyint] NULL,
	[Prc_Ksiegowany] [tinyint] NULL,
	[Prc_Archiwalny] [smallint] NULL,
	[Prc_ArchiwalnyData] [int] NULL,
	[Prc_WmrID] [int] NULL,
	[Prc_TypWymiaru] [tinyint] NULL,
	[Prc_Wyrazenie] [tinyint] NULL,
	[Prc_Inbox] [varchar](2000) NULL,
	[Prc_FrSId] [int] NULL,
	[Prc_OptimaId] [int] NULL,
	[Prc_NTSid] [varchar](100) NULL,
	[Prc_NTKonto] [varchar](255) NULL,
	[Prc_Haslo] [varbinary](16) NULL,
	[Prc_Serwisant] [tinyint] NULL,
	[Prc_PKAId] [int] NULL,
	[Prc_Rodzaj] [int] NULL,
	[Prc_WojStosunek] [tinyint] NULL,
	[Prc_WojWKU] [varchar](50) NULL,
	[Prc_WojNumer] [varchar](20) NULL,
	[Prc_WojPrzydzial] [varchar](30) NULL,
	[Prc_WojStopien] [varchar](30) NULL,
	[Prc_WojSpec] [varchar](30) NULL,
	[Prc_Karany] [tinyint] NULL,
	[Prc_KaranyOpis] [varchar](100) NULL,
	[Prc_ZgodaNaPrzetwarzanie] [tinyint] NULL,
	[Prc_WypadekOsoba] [varchar](50) NULL,
	[Prc_WypadekTelefon] [varchar](30) NULL,
	[Prc_WypadekAdres] [varchar](255) NULL,
	[Prc_Opis] [varchar](500) NULL,
	[Prc_Omnie] [varchar](501) NULL,
	[Prc_MiejscePracy] [varchar](40) NULL,
	[Prc_NrPokoju] [varchar](20) NULL,
	[Prc_PoziomWyksztalcenia] [tinyint] NULL,
	[Prc_OpeWNumer] [int] NULL,
	[Prc_CzasWprowadzenia] [int] NULL,
	[Prc_OpeMNumer] [int] NULL,
	[Prc_CzasModyfikacji] [int] NULL,
	[Prc_ZewnetrznySys] [int] NULL,
	[Prc_DomyslneCentrumKosztId] [int] NULL,
	[Prc_Kraj] [varchar](2) NULL,
	[Prc_ESklep] [tinyint] NULL,
 CONSTRAINT [Prc_Primary] PRIMARY KEY CLUSTERED 
(
	[Prc_GIDNumer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[PrmKarty]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[PrmKarty](
	[PRM_Id] [int] IDENTITY(1,1) NOT NULL,
	[PRM_Akronim] [varchar](200) NULL,
	[PRM_DataOd] [int] NULL,
	[PRM_DataDo] [int] NULL,
	[PRM_Typ] [int] NULL,
	[PRM_Priorytet] [int] NULL,
	[PRM_Stan] [int] NULL,
	[PRM_Aktywna] [int] NULL,
	[PRM_SposobStosowania] [smallint] NULL,
	[PRM_PominPozostale] [smallint] NULL,
	[PRM_Uwagi] [varchar](512) NULL,
	[PRM_Dokument] [smallint] NULL,
	[PRM_LastMod] [int] NULL,
	[PRM_PriorytetLp] [int] NULL,
	[PRM_Cykliczna] [int] NULL,
	[PRM_BlokadaCeny] [tinyint] NULL,
	[PRM_OpeTypM] [smallint] NULL,
	[PRM_OpeFirmaM] [int] NULL,
	[PRM_OpeNumerM] [int] NULL,
	[PRM_OpeLpM] [smallint] NULL,
	[PRM_Pakietowa] [tinyint] NULL,
	[PRM_RodzajPakietu] [tinyint] NULL,
	[PRM_NajwyzszyProg] [tinyint] NULL,
	[PRM_OpeTypU] [smallint] NULL,
	[PRM_OpeNumerU] [int] NULL,
	[PRM_OpeTypP] [smallint] NULL,
	[PRM_OpeNumerP] [int] NULL,
	[PRM_OpeTypZ] [smallint] NULL,
	[PRM_OpeNumerZ] [int] NULL,
	[PRM_DataUtworzenia] [int] NULL,
	[PRM_DataPotwierdzenia] [int] NULL,
	[PRM_DataZamkniecia] [int] NULL,
	[PRM_Kolor] [int] NULL,
	[PRM_KolorBG] [int] NULL,
	[PRM_CyklCzestotliwosc] [smallint] NULL,
	[PRM_CyklRodzaj] [smallint] NULL,
	[PRM_CyklWystepowanie] [int] NULL,
	[PRM_CyklDniOd] [smallint] NULL,
	[PRM_CyklDniDo] [smallint] NULL,
	[PRM_ZamknietaLista] [tinyint] NULL,
	[PRM_LimitTyp] [tinyint] NULL,
	[PRM_LimitWartosc] [decimal](15, 4) NULL,
	[PRM_GrupaTwrWazniejsza] [tinyint] NULL,
	[PRM_ProgTyp] [tinyint] NULL,
	[PRM_ProgWartosc] [decimal](13, 4) NULL,
	[PRM_OkresTransakcjiOd] [int] NULL,
	[PRM_OkresTransakcjiDo] [int] NULL,
	[PRM_WarunekProgSQL] [varchar](2000) NULL,
	[PRM_MaxIloscPakietow] [int] NULL,
	[PRM_LimitRodzaj] [tinyint] NULL,
	[PRM_WymagajJm] [tinyint] NULL,
	[PRM_JmZ] [varchar](8) NULL,
	[PRM_GUID] [varchar](41) NULL,
 CONSTRAINT [PRM_Primary] PRIMARY KEY CLUSTERED 
(
	[PRM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[TwrCeny]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[TwrCeny](
	[TwC_TwrTyp] [smallint] NULL,
	[TwC_TwrFirma] [int] NULL,
	[TwC_TwrNumer] [int] NULL,
	[TwC_TwrLp] [smallint] NULL,
	[TwC_ID] [int] IDENTITY(1,1) NOT NULL,
	[TwC_Waluta] [varchar](3) NULL,
	[TwC_NrKursu] [smallint] NULL,
	[TwC_Marza] [decimal](6, 2) NULL,
	[TwC_Zaok] [decimal](7, 4) NULL,
	[TwC_Offset] [decimal](7, 4) NULL,
	[TwC_RodzajPodstawy] [tinyint] NULL,
	[TwC_Wartosc] [decimal](15, 4) NULL,
	[TwC_Aktualizacja] [tinyint] NULL,
	[TwC_Priorytet] [tinyint] NULL,
	[TwC_CzasModyfikacji] [int] NULL,
	[TwC_KosztyDodatkowe] [decimal](15, 4) NULL,
	[TwC_DokTyp] [smallint] NULL,
	[TwC_DokFirma] [int] NULL,
	[TwC_DokNumer] [int] NULL,
	[TwC_DokLp] [smallint] NULL,
	[TwC_TcnId] [int] NULL,
	[TwC_DataOd] [int] NULL,
	[TwC_KntTyp] [smallint] NULL,
	[TwC_KntFirma] [int] NULL,
	[TwC_KntNumer] [int] NULL,
	[TwC_KntLp] [smallint] NULL,
	[TwC_Aktywny] [int] NULL,
 CONSTRAINT [TwC_Primary] PRIMARY KEY CLUSTERED 
(
	[TwC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[TwrCenyNag]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[TwrCenyNag](
	[TCN_Id] [int] IDENTITY(1,1) NOT NULL,
	[TCN_RodzajCeny] [int] NULL,
	[TCN_Nazwa] [varchar](100) NULL,
	[TCN_DataOd] [int] NULL,
	[TCN_Stan] [tinyint] NULL,
	[TCN_Aktywny] [int] NULL,
	[TCN_DataUtworzenia] [int] NULL,
	[TCN_OpeWTyp] [smallint] NULL,
	[TCN_OpeWNumer] [int] NULL,
	[TCN_OpeMTyp] [smallint] NULL,
	[TCN_OpeMNumer] [int] NULL,
	[TCN_OpeZTyp] [smallint] NULL,
	[TCN_OpeZNumer] [int] NULL,
	[TCN_TCNId] [int] NULL,
	[TCN_WalutaCenySprzedazy] [varchar](3) NULL,
	[TCN_NrKursu] [smallint] NULL,
	[TCN_Marza] [decimal](6, 2) NULL,
	[TCN_Zaok] [decimal](7, 4) NULL,
	[TCN_Offset] [decimal](7, 4) NULL,
	[TCN_RodzajPodstawy] [tinyint] NULL,
	[TCN_MarzaNarzutOpcja] [tinyint] NULL,
	[TCN_Aktualizacja] [tinyint] NULL,
	[TCN_KntTyp] [smallint] NULL,
	[TCN_KntFirma] [int] NULL,
	[TCN_KntNumer] [int] NULL,
	[TCN_KntLp] [smallint] NULL,
	[TCN_ZmianaProc] [decimal](5, 2) NULL,
	[TCN_Opis] [varchar](255) NULL,
	[TCN_CzasModyfikacji] [int] NULL,
	[TCN_Wsk] [tinyint] NULL,
 CONSTRAINT [TCN_Primary] PRIMARY KEY CLUSTERED 
(
	[TCN_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[TwrGrupyDom]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[TwrGrupyDom](
	[TGD_GIDTyp] [smallint] NOT NULL,
	[TGD_GIDFirma] [int] NULL,
	[TGD_GIDNumer] [int] NOT NULL,
	[TGD_GIDLp] [smallint] NULL,
	[TGD_GrOTyp] [smallint] NULL,
	[TGD_GrOFirma] [int] NULL,
	[TGD_GrONumer] [int] NULL,
	[TGD_GrOLp] [smallint] NULL,
	[TGD_Kod] [varchar](40) NULL,
 CONSTRAINT [TGD_Primary] PRIMARY KEY CLUSTERED 
(
	[TGD_GIDTyp] ASC,
	[TGD_GIDNumer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[TwrKarty]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[TwrKarty](
	[Twr_GIDTyp] [smallint] NULL,
	[Twr_GIDFirma] [int] NULL,
	[Twr_GIDNumer] [int] IDENTITY(1,1) NOT NULL,
	[Twr_GIDLp] [smallint] NULL,
	[Twr_Typ] [tinyint] NULL,
	[Twr_Kod] [varchar](40) NULL,
	[Twr_KodFormat] [varchar](50) NULL,
	[Twr_FPPKod] [varchar](20) NULL,
	[Twr_Nazwa] [varchar](255) NULL,
	[Twr_Nazwa1] [varchar](255) NULL,
	[Twr_Certyfikat] [varchar](60) NULL,
	[Twr_Sww] [varchar](20) NULL,
	[Twr_Ean] [varchar](40) NULL,
	[Twr_Jm] [varchar](8) NULL,
	[Twr_Waga] [decimal](9, 3) NULL,
	[Twr_WJm] [varchar](5) NULL,
	[Twr_JmFormat] [tinyint] NULL,
	[Twr_IloscZam] [decimal](11, 4) NULL,
	[Twr_IloscMin] [decimal](11, 4) NULL,
	[Twr_IloscMax] [decimal](11, 4) NULL,
	[Twr_Ubytek] [decimal](5, 2) NULL,
	[Twr_Prog] [tinyint] NULL,
	[Twr_Upust] [tinyint] NULL,
	[Twr_UpustData] [tinyint] NULL,
	[Twr_UpustDataOd] [int] NULL,
	[Twr_UpustDataDo] [int] NULL,
	[Twr_UpustGodz] [tinyint] NULL,
	[Twr_UpustGodzOd] [int] NULL,
	[Twr_UpustGodzDo] [int] NULL,
	[Twr_AutoZam] [tinyint] NULL,
	[Twr_IloscAZam] [decimal](11, 4) NULL,
	[Twr_CzasDst] [int] NULL,
	[Twr_CenaSpr] [smallint] NULL,
	[Twr_JmDomyslna] [smallint] NULL,
	[Twr_DstDomyslny] [smallint] NULL,
	[Twr_RozliczMag] [tinyint] NULL,
	[Twr_Zakup] [tinyint] NULL,
	[Twr_Sprzedaz] [tinyint] NULL,
	[Twr_GrupaPod] [varchar](1) NULL,
	[Twr_Akcyza] [decimal](5, 2) NULL,
	[Twr_OpeTyp] [smallint] NULL,
	[Twr_OpeFirma] [int] NULL,
	[Twr_OpeNumer] [int] NULL,
	[Twr_OpeLp] [smallint] NULL,
	[Twr_PrcTyp] [smallint] NULL,
	[Twr_PrcFirma] [int] NULL,
	[Twr_PrcNumer] [int] NULL,
	[Twr_PrcLp] [smallint] NULL,
	[Twr_KontaktTyp] [tinyint] NULL,
	[Twr_KontaktZa] [smallint] NULL,
	[Twr_KontaktJC] [tinyint] NULL,
	[Twr_Okresowy] [tinyint] NULL,
	[Twr_Cel] [varchar](200) NULL,
	[Twr_Atrybut1] [varchar](20) NULL,
	[Twr_Format1] [tinyint] NULL,
	[Twr_Wartosc1] [varchar](255) NULL,
	[Twr_Atrybut2] [varchar](20) NULL,
	[Twr_Format2] [tinyint] NULL,
	[Twr_Wartosc2] [varchar](255) NULL,
	[Twr_Atrybut3] [varchar](20) NULL,
	[Twr_Format3] [tinyint] NULL,
	[Twr_Wartosc3] [varchar](255) NULL,
	[Twr_Punkty] [decimal](11, 2) NULL,
	[Twr_Koncesja] [int] NULL,
	[Twr_Konto1] [varchar](50) NULL,
	[Twr_Konto2] [varchar](50) NULL,
	[Twr_Konto3] [varchar](50) NULL,
	[Twr_Polozenie] [varchar](64) NULL,
	[Twr_Katalog] [varchar](40) NULL,
	[Twr_WCenniku] [tinyint] NULL,
	[Twr_EdycjaNazwy] [tinyint] NULL,
	[Twr_BezRabatu] [tinyint] NULL,
	[Twr_KopiujOpis] [tinyint] NULL,
	[Twr_URL] [varchar](255) NULL,
	[Twr_Warunek] [varchar](255) NULL,
	[Twr_ObjetoscL] [decimal](7, 2) NULL,
	[Twr_ObjetoscM] [decimal](5, 0) NULL,
	[Twr_LastModL] [int] NULL,
	[Twr_LastModO] [int] NULL,
	[Twr_LastModC] [int] NULL,
	[Twr_TerminZwrotu] [int] NULL,
	[Twr_ZakupAutoryz] [tinyint] NULL,
	[Twr_MagTyp] [smallint] NULL,
	[Twr_MagFirma] [int] NULL,
	[Twr_MagNumer] [int] NULL,
	[Twr_MagLp] [smallint] NULL,
	[Twr_MarzaMin] [decimal](5, 2) NULL,
	[Twr_KosztUslugi] [decimal](15, 2) NULL,
	[Twr_KosztUTyp] [tinyint] NULL,
	[Twr_CzasWykonania] [int] NULL,
	[Twr_CzasWykonaniaJedn] [tinyint] NULL,
	[Twr_Clo] [decimal](7, 2) NULL,
	[Twr_PodatekImp] [decimal](7, 2) NULL,
	[Twr_StanInfoLimit] [tinyint] NULL,
	[Twr_StanInfoMax] [decimal](15, 4) NULL,
	[Twr_StanInfoProcent] [decimal](3, 0) NULL,
	[Twr_Aktywna] [int] NULL,
	[Twr_Wsk] [tinyint] NULL,
	[Twr_CCKTyp] [smallint] NULL,
	[Twr_CCKFirma] [int] NULL,
	[Twr_CCKNumer] [int] NULL,
	[Twr_CCKLp] [smallint] NULL,
	[Twr_PrdTyp] [smallint] NULL,
	[Twr_PrdFirma] [int] NULL,
	[Twr_PrdNumer] [int] NULL,
	[Twr_PrdLp] [smallint] NULL,
	[Twr_OpeTypM] [smallint] NULL,
	[Twr_OpeFirmaM] [int] NULL,
	[Twr_OpeNumerM] [int] NULL,
	[Twr_OpeLpM] [smallint] NULL,
	[Twr_PCN] [varchar](10) NULL,
	[Twr_Notowania] [int] NULL,
	[Twr_WagaBrutto] [decimal](9, 3) NULL,
	[Twr_WJmBrutto] [varchar](5) NULL,
	[Twr_StawkaPod] [decimal](5, 2) NULL,
	[Twr_FlagaVat] [tinyint] NULL,
	[Twr_Zrodlowa] [decimal](5, 2) NULL,
	[Twr_GrupaPodSpr] [varchar](1) NULL,
	[Twr_StawkaPodSpr] [decimal](5, 2) NULL,
	[Twr_FlagaVatSpr] [tinyint] NULL,
	[Twr_ZrodlowaSpr] [decimal](5, 2) NULL,
	[Twr_Licencja] [smallint] NULL,
	[Twr_Blokada] [smallint] NULL,
	[Twr_Archiwalny] [smallint] NULL,
	[Twr_JMCalkowita] [tinyint] NULL,
	[Twr_Oddzialowy] [smallint] NULL,
	[Twr_JmDomyslnaZak] [smallint] NULL,
	[Twr_KrajPoch] [varchar](2) NULL,
	[Twr_WspFin] [decimal](10, 4) NULL,
	[Twr_PobierzWgCech] [tinyint] NULL,
	[Twr_Kaucja] [tinyint] NULL,
	[Twr_SkNId] [int] NULL,
	[Twr_RejWyposazenia] [tinyint] NULL,
	[Twr_OkresGwarancji] [int] NULL,
	[Twr_GrupaWyposazenia] [int] NULL,
	[Twr_ProdTechnologia] [int] NULL,
	[Twr_ProdAktualnaWersja] [tinyint] NULL,
	[Twr_TwZOdNajwiekszego] [tinyint] NULL,
	[Twr_DataUtworzenia] [int] NULL,
	[Twr_WymJm] [varchar](5) NULL,
	[Twr_PartiaDataW] [tinyint] NULL,
	[Twr_TerminW] [smallint] NULL,
	[Twr_PartiaDostawa] [tinyint] NULL,
	[Twr_NrSeryjnyZCechy] [tinyint] NULL,
	[Twr_ESklep] [tinyint] NULL,
	[Twr_StawkaKGO] [int] NULL,
	[Twr_DostawaEAN] [tinyint] NULL,
	[Twr_MarkaId] [int] NULL,
	[Twr_RejestrujUrzadzenie] [tinyint] NULL,
	[Twr_RodzajUrzadzenia] [int] NULL,
	[Twr_OpisUrzadzenia] [varchar](511) NULL,
	[Twr_KategoriaABCXYZ] [varchar](2) NULL,
	[Twr_RodzajId] [int] NULL,
	[Twr_MobSpr] [tinyint] NULL,
	[Twr_PLM] [tinyint] NULL,
	[Twr_JMBlokujZmiane] [tinyint] NULL,
	[Twr_AnalizaABCXYZ] [tinyint] NULL,
	[Twr_Zlom] [tinyint] NULL,
	[Twr_JMiSklep] [int] NULL,
	[Twr_JMPulpitKnt] [int] NULL,
	[Twr_JMMobSpr] [smallint] NULL,
	[Twr_PIADostepnoscFlaga] [int] NULL,
	[Twr_ObowPodSprId] [int] NULL,
	[Twr_ObowPodZakId] [int] NULL,
	[Twr_RodzajKosztu] [int] NULL,
	[Twr_JMDopelnianiaMobSpr] [smallint] NULL,
	[Twr_Techniczna1] [varchar](255) NULL,
	[Twr_Techniczna2] [varchar](255) NULL,
	[Twr_Techniczna3] [varchar](255) NULL,
	[Twr_Techniczna4] [varchar](255) NULL,
	[Twr_Obcy] [tinyint] NULL,
	[Twr_TechnicznaDec1] [decimal](28, 4) NULL,
	[Twr_MrpId] [int] NULL,
	[Twr_MrpEoq] [decimal](11, 4) NULL,
	[Twr_MrpZaok] [decimal](7, 4) NULL,
	[Twr_AutonumeracjaKod] [varchar](40) NULL,
	[Twr_AutonumeracjaLiczba] [int] NULL,
	[Twr_WysylaniePartiiMobSpr] [tinyint] NULL,
	[Twr_DodEleZez] [tinyint] NULL,
	[Twr_KodOdpadu] [varchar](6) NULL,
	[Twr_MPP] [tinyint] NULL,
	[Twr_GrupaJpk] [varchar](50) NULL,
	[Twr_OplataSpozFlaga] [int] NULL,
	[Twr_StawkaCukierStala] [decimal](7, 2) NULL,
	[Twr_StawkaCukierZmienna] [decimal](7, 2) NULL,
	[Twr_StawkaKofeina] [decimal](7, 2) NULL,
	[Twr_ZawartoscCukru] [decimal](7, 2) NULL,
	[Twr_OplataSpozPrzeliczL] [decimal](15, 0) NULL,
	[Twr_OplataSpozPrzeliczM] [decimal](15, 0) NULL,
	[Twr_OplataSpozDostawyTyp] [tinyint] NULL,
	[Twr_OplataSpozDostawyFlaga] [int] NULL,
	[Twr_OplataSpozNrPartii] [int] NULL,
	[Twr_OplataSpozNrPartiiAtrybut] [int] NULL,
	[Twr_JLogWMS] [tinyint] NULL,
	[Twr_Bon] [tinyint] NULL,
	[Twr_ZPIAId] [int] NULL,
 CONSTRAINT [Twr_Primary] PRIMARY KEY CLUSTERED 
(
	[Twr_GIDNumer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[TwrPromocje]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[TwrPromocje](
	[TPR_Id] [int] IDENTITY(1,1) NOT NULL,
	[TPR_PrmId] [int] NULL,
	[TPR_TwrTyp] [smallint] NULL,
	[TPR_TwrFirma] [int] NULL,
	[TPR_TwrNumer] [int] NULL,
	[TPR_TwrLp] [smallint] NULL,
	[TPR_TwgTyp] [smallint] NULL,
	[TPR_TwgFirma] [int] NULL,
	[TPR_TwgNumer] [int] NULL,
	[TPR_TwgLp] [smallint] NULL,
	[TPR_Typ] [int] NULL,
	[TPR_Wartosc] [decimal](15, 4) NULL,
	[TPR_Prog] [decimal](15, 4) NULL,
	[TPR_Waluta] [varchar](3) NULL,
	[TPR_FlagaNB] [varchar](1) NULL,
	[TPR_Notatki] [varchar](200) NULL,
	[TPR_ZstID] [int] NULL,
	[TPR_LP] [int] NULL,
	[TPR_RodzajCeny] [int] NULL,
	[TPR_Wymagany] [tinyint] NULL,
	[TPR_LimitTyp] [tinyint] NULL,
	[TPR_LimitWartosc] [decimal](15, 4) NULL,
	[TPR_ProgTyp] [tinyint] NULL,
	[TPR_ProgWartosc] [decimal](15, 4) NULL,
	[TPR_LimitRodzaj] [tinyint] NULL,
	[TPR_GUID] [varchar](41) NULL,
	[TPR_Aktywny] [tinyint] NULL,
	[TPR_LastMod] [int] NULL,
	[TPR_OpeMod] [varchar](19) NULL,
 CONSTRAINT [TPR_Primary] PRIMARY KEY CLUSTERED 
(
	[TPR_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[ZamElem]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[ZamElem](
	[ZaE_GIDTyp] [smallint] NULL,
	[ZaE_GIDFirma] [int] NULL,
	[ZaE_GIDNumer] [int] NOT NULL,
	[ZaE_GIDLp] [smallint] NOT NULL,
	[ZaE_TwrTyp] [smallint] NULL,
	[ZaE_TwrFirma] [int] NULL,
	[ZaE_TwrNumer] [int] NULL,
	[ZaE_TwrLp] [smallint] NULL,
	[ZaE_TwrNazwa] [varchar](255) NULL,
	[ZaE_TwrKod] [varchar](40) NULL,
	[ZaE_KntTyp] [smallint] NULL,
	[ZaE_KntFirma] [int] NULL,
	[ZaE_KntNumer] [int] NULL,
	[ZaE_KntLp] [smallint] NULL,
	[ZaE_AkwTyp] [smallint] NULL,
	[ZaE_AkwFirma] [int] NULL,
	[ZaE_AkwNumer] [int] NULL,
	[ZaE_AkwLp] [smallint] NULL,
	[ZaE_CChTyp] [smallint] NULL,
	[ZaE_CChFirma] [int] NULL,
	[ZaE_CChNumer] [int] NULL,
	[ZaE_CChLp] [smallint] NULL,
	[ZaE_MagTyp] [smallint] NULL,
	[ZaE_MagFirma] [int] NULL,
	[ZaE_MagNumer] [int] NULL,
	[ZaE_MagLp] [smallint] NULL,
	[ZaE_TStamp] [int] NULL,
	[ZaE_Ilosc] [decimal](11, 4) NULL,
	[ZaE_JmZ] [varchar](8) NULL,
	[ZaE_TypJm] [tinyint] NULL,
	[ZaE_JmFormat] [tinyint] NULL,
	[ZaE_JmFormatZ] [tinyint] NULL,
	[ZaE_PrzeliczM] [decimal](15, 0) NULL,
	[ZaE_PrzeliczL] [decimal](15, 0) NULL,
	[ZaE_GrupaPod] [varchar](1) NULL,
	[ZaE_StawkaPod] [decimal](5, 2) NULL,
	[ZaE_FlagaVAT] [tinyint] NULL,
	[ZaE_Zrodlowa] [decimal](5, 2) NULL,
	[ZaE_Waluta] [varchar](3) NULL,
	[ZaE_NrKursu] [smallint] NULL,
	[ZaE_Rabat] [decimal](5, 2) NULL,
	[ZaE_Cecha] [varchar](255) NULL,
	[ZaE_CenaKatalogowa] [decimal](15, 4) NULL,
	[ZaE_CenaOferowana] [decimal](15, 4) NULL,
	[ZaE_CenaUzgodniona] [decimal](15, 4) NULL,
	[ZaE_RodzajCenyBazowej] [smallint] NULL,
	[ZaE_ProgTyp] [tinyint] NULL,
	[ZaE_Prog] [decimal](15, 2) NULL,
	[ZaE_UpustTyp] [tinyint] NULL,
	[ZaE_Upust] [decimal](15, 2) NULL,
	[ZaE_UpustKntTyp] [tinyint] NULL,
	[ZaE_UpustKnt] [decimal](15, 2) NULL,
	[ZaE_ReETyp] [smallint] NULL,
	[ZaE_ReEFirma] [int] NULL,
	[ZaE_ReENumer] [int] NULL,
	[ZaE_ReELp] [smallint] NULL,
	[ZaE_ReEProdLp] [smallint] NULL,
	[ZaE_DataWaznosciRez] [int] NULL,
	[ZaE_WartoscPoRabacie] [decimal](15, 2) NULL,
	[ZaE_DataPotwDst] [int] NULL,
	[ZaE_DataAktywacjiRez] [int] NULL,
	[ZaE_DataOdZam] [int] NULL,
	[ZaE_PrecyzjaCeny] [tinyint] NULL,
	[ZaE_Rownanie] [tinyint] NULL,
	[ZaE_FlagaNB] [varchar](1) NULL,
	[ZaE_Licencja] [smallint] NULL,
	[ZaE_Pozycja] [smallint] NULL,
	[ZaE_RabatPromocyjny] [decimal](15, 4) NULL,
	[ZaE_RabatKorekta] [decimal](15, 4) NULL,
	[ZaE_Promocje] [int] NULL,
	[ZaE_ZstTyp] [smallint] NULL,
	[ZaE_ZstFirma] [int] NULL,
	[ZaE_ZstNumer] [int] NULL,
	[ZaE_ZstLp] [smallint] NULL,
	[ZaE_PrecyzjaCenyPocz] [smallint] NULL,
	[ZaE_CenaSpr] [smallint] NULL,
	[ZaE_RodzajDatyRealizacji] [smallint] NULL,
	[ZaE_KGOJednostkowe] [decimal](9, 2) NULL,
	[ZaE_OddElemId] [int] NULL,
	[ZaE_IloscMin] [decimal](11, 4) NULL,
	[ZaE_IloscMax] [decimal](11, 4) NULL,
	[ZaE_PakietId] [int] NULL,
	[ZaE_Gratis] [smallint] NULL,
	[ZaE_PromocjaProgID] [int] NULL,
	[ZaE_Zlom] [smallint] NULL,
	[ZaE_FormatkaCyr] [tinyint] NULL,
	[ZaE_KPNId] [int] NULL,
	[ZaE_TypCenyNabycia] [tinyint] NULL,
	[ZaE_PakietWymaganaPoz] [tinyint] NULL,
	[ZaE_PakietTwgNumer] [int] NULL,
	[ZaE_PakietTwgTyp] [smallint] NULL,
	[ZaE_RabatOpeGen] [decimal](15, 2) NULL,
	[ZaE_WymuszonePRMID] [int] NULL,
	[ZaE_Punkty] [decimal](11, 2) NULL,
	[ZaE_Nagroda] [smallint] NULL,
	[ZaE_ReNNumer] [int] NULL,
	[ZaE_OplataSpozFlaga] [tinyint] NULL,
	[ZaE_StawkaCukierStala] [decimal](7, 2) NULL,
	[ZaE_StawkaCukierZmienna] [decimal](7, 2) NULL,
	[ZaE_StawkaKofeina] [decimal](7, 2) NULL,
	[ZaE_JmDzielWZWM] [tinyint] NULL,
	[ZaE_GUID] [varchar](36) NULL,
 CONSTRAINT [ZaE_Primary] PRIMARY KEY CLUSTERED 
(
	[ZaE_GIDNumer] ASC,
	[ZaE_GIDLp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CDN].[ZamNag]    Script Date: 29.07.2025 13:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CDN].[ZamNag](
	[ZaN_GIDTyp] [smallint] NULL,
	[ZaN_GIDFirma] [int] NULL,
	[ZaN_GIDNumer] [int] IDENTITY(1,1) NOT NULL,
	[ZaN_GIDLp] [smallint] NULL,
	[ZaN_ZrdTyp] [smallint] NULL,
	[ZaN_ZrdFirma] [int] NULL,
	[ZaN_ZrdNumer] [int] NULL,
	[ZaN_ZrdLp] [smallint] NULL,
	[ZaN_KorTyp] [smallint] NULL,
	[ZaN_KorFirma] [int] NULL,
	[ZaN_KorNumer] [int] NULL,
	[ZaN_KorLp] [smallint] NULL,
	[ZaN_KntTyp] [smallint] NULL,
	[ZaN_KntFirma] [int] NULL,
	[ZaN_KntNumer] [int] NULL,
	[ZaN_KntLp] [smallint] NULL,
	[ZaN_KnATyp] [smallint] NULL,
	[ZaN_KnAFirma] [int] NULL,
	[ZaN_KnANumer] [int] NULL,
	[ZaN_KnALp] [smallint] NULL,
	[ZaN_AkwTyp] [smallint] NULL,
	[ZaN_AkwFirma] [int] NULL,
	[ZaN_AkwNumer] [int] NULL,
	[ZaN_AkwLp] [smallint] NULL,
	[ZaN_AdWTyp] [smallint] NULL,
	[ZaN_AdwFirma] [int] NULL,
	[ZaN_AdWNumer] [int] NULL,
	[ZaN_AdWLp] [smallint] NULL,
	[ZaN_MagTyp] [smallint] NULL,
	[ZaN_MagFirma] [int] NULL,
	[ZaN_MagNumer] [int] NULL,
	[ZaN_MagLp] [smallint] NULL,
	[ZaN_FormaNr] [tinyint] NULL,
	[ZaN_FormaNazwa] [varchar](15) NULL,
	[ZaN_FormaRabat] [decimal](5, 2) NULL,
	[ZaN_TerminPlatnosci] [int] NULL,
	[ZaN_ZamTyp] [smallint] NULL,
	[ZaN_ZamRok] [smallint] NULL,
	[ZaN_ZamMiesiac] [tinyint] NULL,
	[ZaN_ZamSeria] [varchar](5) NULL,
	[ZaN_ZamNumer] [int] NULL,
	[ZaN_ZamLp] [smallint] NULL,
	[ZaN_PomTyp] [smallint] NULL,
	[ZaN_PomRok] [smallint] NULL,
	[ZaN_PomMiesiac] [tinyint] NULL,
	[ZaN_PomSeria] [varchar](5) NULL,
	[ZaN_PomNumer] [int] NULL,
	[ZaN_PomLp] [smallint] NULL,
	[ZaN_DokumentObcy] [varchar](40) NULL,
	[ZaN_DokumentObcyCharset] [int] NULL,
	[ZaN_DokumentObcyP] [varchar](40) NULL,
	[ZaN_DokumentObcyPCharset] [int] NULL,
	[ZaN_ExpoNorm] [tinyint] NULL,
	[ZaN_Waluta] [varchar](3) NULL,
	[ZaN_NrKursu] [smallint] NULL,
	[ZaN_KursM] [decimal](5, 0) NULL,
	[ZaN_KursL] [decimal](15, 10) NULL,
	[ZaN_TypKursu] [tinyint] NULL,
	[ZaN_WspolnaWaluta] [tinyint] NOT NULL,
	[ZaN_OpeTypW] [smallint] NULL,
	[ZaN_OpeFirmaW] [int] NULL,
	[ZaN_OpeNumerW] [int] NULL,
	[ZaN_OpeLpW] [smallint] NULL,
	[ZaN_OpeTypM] [smallint] NULL,
	[ZaN_OpeFirmaM] [int] NULL,
	[ZaN_OpeNumerM] [int] NULL,
	[ZaN_OpeLpM] [smallint] NULL,
	[ZaN_OpeTypZ] [smallint] NULL,
	[ZaN_OpeFirmaZ] [int] NULL,
	[ZaN_OpeNumerZ] [int] NULL,
	[ZaN_OpeLpZ] [smallint] NULL,
	[ZaN_OpeTypP] [smallint] NULL,
	[ZaN_OpeFirmaP] [int] NULL,
	[ZaN_OpeNumerP] [int] NULL,
	[ZaN_OpeLpP] [smallint] NULL,
	[ZaN_ID] [int] NULL,
	[ZaN_Rabat] [decimal](15, 2) NULL,
	[ZaN_TypRabatu] [tinyint] NULL,
	[ZaN_SpDostawy] [varchar](20) NULL,
	[ZaN_CechaOpis] [varchar](250) NULL,
	[ZaN_DataZapytania] [int] NULL,
	[ZaN_RealWCalosci] [tinyint] NULL,
	[ZaN_DataWystawienia] [int] NULL,
	[ZaN_DataRealizacji] [int] NULL,
	[ZaN_DataWaznosci] [int] NULL,
	[ZaN_DataPotwierdz] [int] NULL,
	[ZaN_DataAkceptacji] [int] NULL,
	[ZaN_DataOdZam] [int] NULL,
	[ZaN_Stan] [smallint] NULL,
	[ZaN_Aktywny] [int] NULL,
	[ZaN_DokZwiazane] [tinyint] NULL,
	[ZaN_LKopii] [tinyint] NULL,
	[ZaN_Wsk] [tinyint] NULL,
	[ZaN_KnSTyp] [smallint] NULL,
	[ZaN_KnSFirma] [int] NULL,
	[ZaN_KnSNumer] [int] NULL,
	[ZaN_KnSLp] [smallint] NULL,
	[ZaN_KnSTypP] [smallint] NULL,
	[ZaN_KnSFirmaP] [int] NULL,
	[ZaN_KnSNumerP] [int] NULL,
	[ZaN_KnSLpP] [smallint] NULL,
	[ZaN_Rodzaj] [smallint] NULL,
	[ZaN_PcKID] [int] NULL,
	[ZaN_KnDTyp] [smallint] NULL,
	[ZaN_KnDFirma] [int] NULL,
	[ZaN_KnDNumer] [int] NULL,
	[ZaN_KnDLp] [smallint] NULL,
	[ZaN_FiaskoID] [smallint] NULL,
	[ZaN_RokMiesiac] [int] NULL,
	[ZaN_PotwOferty] [smallint] NULL,
	[ZaN_DataPotwOferty] [int] NULL,
	[ZaN_OpeTypPotwOfe] [smallint] NULL,
	[ZaN_OpeFirmaPotwOfe] [int] NULL,
	[ZaN_OpeNumerPotwOfe] [int] NULL,
	[ZaN_OpeLpPotwOfe] [smallint] NULL,
	[ZaN_DataAktywacjiRez] [int] NULL,
	[ZaN_Url] [varchar](255) NULL,
	[ZaN_RabatW] [decimal](15, 2) NULL,
	[ZaN_FrSID] [int] NULL,
	[ZaN_FlagaNB] [varchar](1) NULL,
	[ZaN_OpeTypMod] [smallint] NULL,
	[ZaN_OpeFirmaMod] [int] NULL,
	[ZaN_OpeNumerMod] [int] NULL,
	[ZaN_OpeLpMod] [smallint] NULL,
	[ZaN_OddDokId] [int] NULL,
	[ZaN_LastMod] [int] NULL,
	[ZaN_OpiTyp] [smallint] NULL,
	[ZaN_OpiFirma] [int] NULL,
	[ZaN_OpiNumer] [int] NULL,
	[ZaN_OpiLP] [smallint] NULL,
	[ZaN_IncotermsSymbol] [varchar](4) NULL,
	[ZaN_IncotermsMiejsce] [varchar](255) NULL,
	[ZaN_KrajPrzezWys] [varchar](2) NULL,
	[ZaN_KodRodzajuTransportu] [varchar](2) NULL,
	[ZaN_KodRodzajuTransakcji] [varchar](2) NULL,
	[ZaN_Wyslano] [tinyint] NULL,
	[ZaN_CenaSpr] [smallint] NULL,
	[ZaN_GodzinaWystawienia] [int] NULL,
	[ZaN_GodzinaPotwierdzenia] [int] NULL,
	[ZaN_Promocje] [int] NULL,
	[ZaN_RezerwujZasoby] [tinyint] NULL,
	[ZaN_PriorytetRez] [tinyint] NULL,
	[ZaN_RabatPromocyjnyGlobalny] [decimal](15, 4) NULL,
	[ZaN_KnPTyp] [smallint] NULL,
	[ZaN_KnPNumer] [int] NULL,
	[ZaN_AdPNumer] [int] NULL,
	[ZaN_MaGDTyp] [smallint] NULL,
	[ZaN_MagDNumer] [int] NULL,
	[ZaN_KarNumer] [int] NULL,
	[ZaN_PrjId] [int] NULL,
	[ZaN_KnSTypOdb] [smallint] NULL,
	[ZaN_KnSFirmaOdb] [int] NULL,
	[ZaN_KnSNumerOdb] [int] NULL,
	[ZaN_KnSLpOdb] [smallint] NULL,
	[ZaN_KnSTypPlt] [smallint] NULL,
	[ZaN_KnSFirmaPlt] [int] NULL,
	[ZaN_KnSNumerPlt] [int] NULL,
	[ZaN_KnSLpPlt] [smallint] NULL,
	[ZaN_RodzajDatyRealizacji] [tinyint] NULL,
	[ZaN_FrMNumer] [int] NULL,
	[ZaN_PromocjePar] [tinyint] NULL,
	[ZaN_RezerwacjeNaNiepotwierdzonym] [tinyint] NULL,
	[ZaN_StanZapytania] [smallint] NULL,
	[ZaN_OpeNumerPotwZapyt] [int] NULL,
	[ZaN_GenerujWieleZam] [tinyint] NULL,
	[ZaN_FormatkaCyr] [tinyint] NULL,
	[ZaN_WtrID] [int] NULL,
	[ZaN_WtrProgID] [int] NULL,
	[ZaN_DomyslnyDokRealizacja] [smallint] NULL,
	[ZaN_DataPromocjiRodzaj] [tinyint] NULL,
	[ZaN_RezZasTylkoAktywne] [tinyint] NULL,
	[ZaN_PrzyczynaZW] [varchar](255) NULL,
	[ZaN_PodstawaZW] [tinyint] NULL,
	[ZaN_LimitKredytowy] [tinyint] NULL,
	[ZaN_LimitKredytowyKwota] [decimal](15, 2) NULL,
	[ZaN_LimitKredytowyWaznyDo] [int] NULL,
	[ZaN_LimitKredytowyWaluta] [varchar](3) NULL,
	[ZaN_KontrolujIlosciPrzyGenZam] [tinyint] NULL,
	[ZaN_OplataSpozFlaga] [tinyint] NULL,
	[ZaN_GUID] [varchar](36) NULL,
	[ZaN_OperatorPOS] [int] NULL,
	[ZaN_OstatniaModyfikacjaPOS] [int] NULL,
	[ZaN_ZrodloPochodzeniaESklep] [int] NULL,
	[ZaN_StatusPlatnosciPOS] [int] NULL,
	[ZaN_StatusRealizacji] [int] NULL,
	[ZaN_EAN] [varchar](50) NULL,
	[ZaN_PsAID] [int] NULL,
 CONSTRAINT [ZaN_Primary] PRIMARY KEY CLUSTERED 
(
	[ZaN_GIDNumer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_GIDTyp]  DEFAULT ((0)) FOR [Dst_GIDTyp]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_GIDFirma]  DEFAULT ((0)) FOR [Dst_GIDFirma]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_GIDLp]  DEFAULT ((0)) FOR [Dst_GIDLp]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_TrnTyp]  DEFAULT ((0)) FOR [Dst_TrnTyp]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_TrnFirma]  DEFAULT ((0)) FOR [Dst_TrnFirma]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_TrnNumer]  DEFAULT ((0)) FOR [Dst_TrnNumer]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_TrnLp]  DEFAULT ((0)) FOR [Dst_TrnLp]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_SubTrnLp]  DEFAULT ((0)) FOR [Dst_SubTrnLp]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_TwrTyp]  DEFAULT ((0)) FOR [Dst_TwrTyp]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_TwrFirma]  DEFAULT ((0)) FOR [Dst_TwrFirma]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_TwrNumer]  DEFAULT ((0)) FOR [Dst_TwrNumer]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_TwrLp]  DEFAULT ((0)) FOR [Dst_TwrLp]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_KsiegowaNetto]  DEFAULT ((0)) FOR [Dst_KsiegowaNetto]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_KsiegowaBrutto]  DEFAULT ((0)) FOR [Dst_KsiegowaBrutto]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_RzeczywistaNetto]  DEFAULT ((0)) FOR [Dst_RzeczywistaNetto]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_KosztKsiegowy]  DEFAULT ((0)) FOR [Dst_KosztKsiegowy]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_KosztRzeczywisty]  DEFAULT ((0)) FOR [Dst_KosztRzeczywisty]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_Cecha]  DEFAULT ('') FOR [Dst_Cecha]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_Ean]  DEFAULT ('') FOR [Dst_Ean]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_DataW]  DEFAULT ((0)) FOR [Dst_DataW]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_Ilosc]  DEFAULT ((0)) FOR [Dst_Ilosc]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_DstTStamp]  DEFAULT ((0)) FOR [Dst_DstTStamp]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_Polozenie]  DEFAULT ('') FOR [Dst_Polozenie]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_CCKTyp]  DEFAULT ((0)) FOR [Dst_CCKTyp]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_CCKFirma]  DEFAULT ((0)) FOR [Dst_CCKFirma]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_CCKNumer]  DEFAULT ((0)) FOR [Dst_CCKNumer]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_CCKLp]  DEFAULT ((0)) FOR [Dst_CCKLp]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_WspFin]  DEFAULT ((0)) FOR [Dst_WspFin]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_KosztUstalono]  DEFAULT ((0)) FOR [Dst_KosztUstalono]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_TpAId]  DEFAULT ((0)) FOR [Dst_TpAId]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_ZewnetrznySys]  DEFAULT ((0)) FOR [Dst_ZewnetrznySys]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_ZewnetrznyId]  DEFAULT ((0)) FOR [Dst_ZewnetrznyId]
GO
ALTER TABLE [CDN].[Dostawy] ADD  CONSTRAINT [DF_Dst_OplataSpozFlaga]  DEFAULT ((0)) FOR [Dst_OplataSpozFlaga]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_GIDTyp]  DEFAULT ((0)) FOR [KnA_GIDTyp]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_GIDFirma]  DEFAULT ((0)) FOR [KnA_GIDFirma]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_GIDLp]  DEFAULT ((0)) FOR [KnA_GIDLp]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_KntTyp]  DEFAULT ((0)) FOR [KnA_KntTyp]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_KntFirma]  DEFAULT ((0)) FOR [KnA_KntFirma]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_KntNumer]  DEFAULT ((0)) FOR [KnA_KntNumer]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_KntLp]  DEFAULT ((0)) FOR [KnA_KntLp]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_DataArc]  DEFAULT ((0)) FOR [KnA_DataArc]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Akronim]  DEFAULT ('') FOR [KnA_Akronim]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Wysylkowy]  DEFAULT ((0)) FOR [KnA_Wysylkowy]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Nazwa1]  DEFAULT ('') FOR [KnA_Nazwa1]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Nazwa2]  DEFAULT ('') FOR [KnA_Nazwa2]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Nazwa3]  DEFAULT ('') FOR [KnA_Nazwa3]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_KodP]  DEFAULT ('') FOR [KnA_KodP]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Miasto]  DEFAULT ('') FOR [KnA_Miasto]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Ulica]  DEFAULT ('') FOR [KnA_Ulica]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Adres]  DEFAULT ('') FOR [KnA_Adres]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_NipE]  DEFAULT ('') FOR [KnA_NipE]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Nip]  DEFAULT ('') FOR [KnA_Nip]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_NipPrefiks]  DEFAULT ('') FOR [KnA_NipPrefiks]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Regon]  DEFAULT ('') FOR [KnA_Regon]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Pesel]  DEFAULT ('') FOR [KnA_Pesel]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_KontoDostawcy]  DEFAULT ('') FOR [KnA_KontoDostawcy]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_KontoOdbiorcy]  DEFAULT ('') FOR [KnA_KontoOdbiorcy]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Kraj]  DEFAULT ('') FOR [KnA_Kraj]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Powiat]  DEFAULT ('') FOR [KnA_Powiat]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Gmina]  DEFAULT ('') FOR [KnA_Gmina]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Wojewodztwo]  DEFAULT ('') FOR [KnA_Wojewodztwo]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_RegionCRM]  DEFAULT ((0)) FOR [KnA_RegionCRM]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_GLN]  DEFAULT ('') FOR [KnA_GLN]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Telefon1]  DEFAULT ('') FOR [KnA_Telefon1]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Telefon2]  DEFAULT ('') FOR [KnA_Telefon2]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Fax]  DEFAULT ('') FOR [KnA_Fax]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Modem]  DEFAULT ('') FOR [KnA_Modem]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Telex]  DEFAULT ('') FOR [KnA_Telex]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_EMail]  DEFAULT ('') FOR [KnA_EMail]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_BnkTyp]  DEFAULT ((0)) FOR [KnA_BnkTyp]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_BnkFirma]  DEFAULT ((0)) FOR [KnA_BnkFirma]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_BnkNumer]  DEFAULT ((0)) FOR [KnA_BnkNumer]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_BnkLp]  DEFAULT ((0)) FOR [KnA_BnkLp]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_NrRachunku]  DEFAULT ('') FOR [KnA_NrRachunku]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_LastModL]  DEFAULT ((0)) FOR [KnA_LastModL]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Odleglosc]  DEFAULT ((0)) FOR [KnA_Odleglosc]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_NRB]  DEFAULT ((0)) FOR [KnA_NRB]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_NiePublikuj]  DEFAULT ((0)) FOR [KnA_NiePublikuj]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Domyslny]  DEFAULT ((0)) FOR [KnA_Domyslny]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_DokumentTozsamosci]  DEFAULT ('') FOR [KnA_DokumentTozsamosci]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_DataWydania]  DEFAULT ((0)) FOR [KnA_DataWydania]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_OrganWydajacy]  DEFAULT ('') FOR [KnA_OrganWydajacy]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_RolnikRyczaltowy]  DEFAULT ((0)) FOR [KnA_RolnikRyczaltowy]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_StanPostep]  DEFAULT ((0)) FOR [KnA_StanPostep]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_PlatnikVat]  DEFAULT ((0)) FOR [KnA_PlatnikVat]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_GPSSz]  DEFAULT ((0)) FOR [KnA_GPSSz]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_GPSDl]  DEFAULT ((0)) FOR [KnA_GPSDl]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_GPSDataPobrania]  DEFAULT ((0)) FOR [KnA_GPSDataPobrania]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_GPSGodzinaPobrania]  DEFAULT ((0)) FOR [KnA_GPSGodzinaPobrania]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_KnaPierwotny]  DEFAULT ((0)) FOR [KnA_KnaPierwotny]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_KnaArchiwizowanego]  DEFAULT ((0)) FOR [KnA_KnaArchiwizowanego]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Osoba]  DEFAULT ((0)) FOR [KnA_Osoba]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Opis]  DEFAULT ('') FOR [KnA_Opis]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_Anonim]  DEFAULT ((0)) FOR [KnA_Anonim]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_AdresBank]  DEFAULT ((0)) FOR [KnA_AdresBank]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_MetodaKasowa]  DEFAULT ((0)) FOR [KnA_MetodaKasowa]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_GUID]  DEFAULT (CONVERT([varchar](36),newid())) FOR [KnA_GUID]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_GUIDdane]  DEFAULT (CONVERT([varchar](36),newid())) FOR [KnA_GUIDdane]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_VatDataRejestracji]  DEFAULT ((0)) FOR [KnA_VatDataRejestracji]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_VatDataOdmowy]  DEFAULT ((0)) FOR [KnA_VatDataOdmowy]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_VatDataPrzywrocenia]  DEFAULT ((0)) FOR [KnA_VatDataPrzywrocenia]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_VatDataUsuniecia]  DEFAULT ((0)) FOR [KnA_VatDataUsuniecia]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_VatDataSprawdzenia]  DEFAULT ((0)) FOR [KnA_VatDataSprawdzenia]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_KrajSiedziby]  DEFAULT ('') FOR [KnA_KrajSiedziby]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_TypPOS]  DEFAULT ((0)) FOR [KnA_TypPOS]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_GUIDEmail]  DEFAULT (CONVERT([varchar](36),newid())) FOR [KnA_GUIDEmail]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_GUIDTelefon]  DEFAULT (CONVERT([varchar](36),newid())) FOR [KnA_GUIDTelefon]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_UlicaCdc]  DEFAULT ('') FOR [KnA_UlicaCDC]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_NrDomuCDC]  DEFAULT ('') FOR [KnA_NrDomuCDC]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_NrMieszkaniaCDC]  DEFAULT ('') FOR [KnA_NrMieszkaniaCDC]
GO
ALTER TABLE [CDN].[KntAdresy] ADD  CONSTRAINT [DF_KnA_CharsetANSI]  DEFAULT ((238)) FOR [KnA_CharsetANSI]
GO
ALTER TABLE [CDN].[KntGrupyDom] ADD  CONSTRAINT [DF_KGD_GIDTyp]  DEFAULT ((0)) FOR [KGD_GIDTyp]
GO
ALTER TABLE [CDN].[KntGrupyDom] ADD  CONSTRAINT [DF_KGD_GIDFirma]  DEFAULT ((0)) FOR [KGD_GIDFirma]
GO
ALTER TABLE [CDN].[KntGrupyDom] ADD  CONSTRAINT [DF_KGD_GIDNumer]  DEFAULT ((0)) FOR [KGD_GIDNumer]
GO
ALTER TABLE [CDN].[KntGrupyDom] ADD  CONSTRAINT [DF_KGD_GIDLp]  DEFAULT ((0)) FOR [KGD_GIDLp]
GO
ALTER TABLE [CDN].[KntGrupyDom] ADD  CONSTRAINT [DF_KGD_GrOTyp]  DEFAULT ((0)) FOR [KGD_GrOTyp]
GO
ALTER TABLE [CDN].[KntGrupyDom] ADD  CONSTRAINT [DF_KGD_GrOFirma]  DEFAULT ((0)) FOR [KGD_GrOFirma]
GO
ALTER TABLE [CDN].[KntGrupyDom] ADD  CONSTRAINT [DF_KGD_GrONumer]  DEFAULT ((0)) FOR [KGD_GrONumer]
GO
ALTER TABLE [CDN].[KntGrupyDom] ADD  CONSTRAINT [DF_KGD_GrOLp]  DEFAULT ((0)) FOR [KGD_GrOLp]
GO
ALTER TABLE [CDN].[KntGrupyDom] ADD  CONSTRAINT [DF_KGD_Kod]  DEFAULT ('') FOR [KGD_Kod]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_GIDTyp]  DEFAULT ((0)) FOR [Knt_GIDTyp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_GIDFirma]  DEFAULT ((0)) FOR [Knt_GIDFirma]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_GIDLp]  DEFAULT ((0)) FOR [Knt_GIDLp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KnATyp]  DEFAULT ((0)) FOR [Knt_KnATyp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KnAFirma]  DEFAULT ((0)) FOR [Knt_KnAFirma]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KnANumer]  DEFAULT ((0)) FOR [Knt_KnANumer]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KnALp]  DEFAULT ((0)) FOR [Knt_KnALp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Typ]  DEFAULT ((0)) FOR [Knt_Typ]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Akwizytor]  DEFAULT ((0)) FOR [Knt_Akwizytor]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Akronim]  DEFAULT ('') FOR [Knt_Akronim]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_AkronimFormat]  DEFAULT ('') FOR [Knt_AkronimFormat]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_FppKod]  DEFAULT ('') FOR [Knt_FppKod]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Nazwa1]  DEFAULT ('') FOR [Knt_Nazwa1]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Nazwa2]  DEFAULT ('') FOR [Knt_Nazwa2]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Nazwa3]  DEFAULT ('') FOR [Knt_Nazwa3]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KodP]  DEFAULT ('') FOR [Knt_KodP]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Miasto]  DEFAULT ('') FOR [Knt_Miasto]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Ulica]  DEFAULT ('') FOR [Knt_Ulica]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Adres]  DEFAULT ('') FOR [Knt_Adres]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_NipE]  DEFAULT ('') FOR [Knt_NipE]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Nip]  DEFAULT ('') FOR [Knt_Nip]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_NipPrefiks]  DEFAULT ('') FOR [Knt_NipPrefiks]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Regon]  DEFAULT ('') FOR [Knt_Regon]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Pesel]  DEFAULT ('') FOR [Knt_Pesel]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KontoDostawcy]  DEFAULT ('') FOR [Knt_KontoDostawcy]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KontoOdbiorcy]  DEFAULT ('') FOR [Knt_KontoOdbiorcy]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Kraj]  DEFAULT ('') FOR [Knt_Kraj]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Powiat]  DEFAULT ('') FOR [Knt_Powiat]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Gmina]  DEFAULT ('') FOR [Knt_Gmina]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Wojewodztwo]  DEFAULT ('') FOR [Knt_Wojewodztwo]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_RegionCRM]  DEFAULT ((0)) FOR [Knt_RegionCRM]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_GLN]  DEFAULT ('') FOR [Knt_GLN]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Telefon1]  DEFAULT ('') FOR [Knt_Telefon1]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Telefon2]  DEFAULT ('') FOR [Knt_Telefon2]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Fax]  DEFAULT ('') FOR [Knt_Fax]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Modem]  DEFAULT ('') FOR [Knt_Modem]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Telex]  DEFAULT ('') FOR [Knt_Telex]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_EMail]  DEFAULT ('') FOR [Knt_EMail]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_URL]  DEFAULT ('') FOR [Knt_URL]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_BnkTyp]  DEFAULT ((0)) FOR [Knt_BnkTyp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_BnkFirma]  DEFAULT ((0)) FOR [Knt_BnkFirma]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_BnkNumer]  DEFAULT ((0)) FOR [Knt_BnkNumer]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_BnkLp]  DEFAULT ((0)) FOR [Knt_BnkLp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_NrRachunku]  DEFAULT ('') FOR [Knt_NrRachunku]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Soundex]  DEFAULT ('') FOR [Knt_Soundex]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Rabat]  DEFAULT ((0)) FOR [Knt_Rabat]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_LimitWart]  DEFAULT ((0)) FOR [Knt_LimitWart]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_MaxLimitWart]  DEFAULT ((0)) FOR [Knt_MaxLimitWart]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_LimitPoTerminie]  DEFAULT ((0)) FOR [Knt_LimitPoTerminie]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_LimitOkres]  DEFAULT ((0)) FOR [Knt_LimitOkres]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Dewizowe]  DEFAULT ((0)) FOR [Knt_Dewizowe]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Symbol]  DEFAULT ('') FOR [Knt_Symbol]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_NrKursu]  DEFAULT ((0)) FOR [Knt_NrKursu]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Cena]  DEFAULT ((0)) FOR [Knt_Cena]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_FormaPl]  DEFAULT ((0)) FOR [Knt_FormaPl]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Marza]  DEFAULT ((0)) FOR [Knt_Marza]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_TypKarty]  DEFAULT ((0)) FOR [Knt_TypKarty]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_NumerKarty]  DEFAULT ('') FOR [Knt_NumerKarty]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_DataKarty]  DEFAULT ((0)) FOR [Knt_DataKarty]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Ean]  DEFAULT ('') FOR [Knt_Ean]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_ObcaKarta]  DEFAULT ((0)) FOR [Knt_ObcaKarta]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Osoba]  DEFAULT ((0)) FOR [Knt_Osoba]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_ExpoKraj]  DEFAULT ((0)) FOR [Knt_ExpoKraj]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_SeriaFa]  DEFAULT ('') FOR [Knt_SeriaFa]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PlatnikVat]  DEFAULT ((0)) FOR [Knt_PlatnikVat]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_TypDok]  DEFAULT ((0)) FOR [Knt_TypDok]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Status]  DEFAULT ((0)) FOR [Knt_Status]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_FAVATData]  DEFAULT ((0)) FOR [Knt_FAVATData]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_SposobDostawy]  DEFAULT ('') FOR [Knt_SposobDostawy]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_HasloChk]  DEFAULT ('') FOR [Knt_HasloChk]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_HasloKontrahent]  DEFAULT ('') FOR [Knt_HasloKontrahent]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Dzialalnosc]  DEFAULT ((0)) FOR [Knt_Dzialalnosc]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_ZTrTyp]  DEFAULT ((0)) FOR [Knt_ZTrTyp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_ZTrFirma]  DEFAULT ((0)) FOR [Knt_ZTrFirma]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_ZTrNumer]  DEFAULT ((0)) FOR [Knt_ZTrNumer]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_ZTrLp]  DEFAULT ((0)) FOR [Knt_ZTrLp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OpeTyp]  DEFAULT ((0)) FOR [Knt_OpeTyp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OpeFirma]  DEFAULT ((0)) FOR [Knt_OpeFirma]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OpeNumer]  DEFAULT ((0)) FOR [Knt_OpeNumer]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OpeLp]  DEFAULT ((0)) FOR [Knt_OpeLp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_AkwTyp]  DEFAULT ((0)) FOR [Knt_AkwTyp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_AkwFirma]  DEFAULT ((0)) FOR [Knt_AkwFirma]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_AkwNumer]  DEFAULT ((0)) FOR [Knt_AkwNumer]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_AkwLp]  DEFAULT ((0)) FOR [Knt_AkwLp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PrcTyp]  DEFAULT ((0)) FOR [Knt_PrcTyp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PrcFirma]  DEFAULT ((0)) FOR [Knt_PrcFirma]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PrcNumer]  DEFAULT ((0)) FOR [Knt_PrcNumer]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PrcLp]  DEFAULT ((0)) FOR [Knt_PrcLp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Atrybut1]  DEFAULT ('') FOR [Knt_Atrybut1]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Format1]  DEFAULT ((0)) FOR [Knt_Format1]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Wartosc1]  DEFAULT ('') FOR [Knt_Wartosc1]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Atrybut2]  DEFAULT ('') FOR [Knt_Atrybut2]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Format2]  DEFAULT ((0)) FOR [Knt_Format2]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Wartosc2]  DEFAULT ('') FOR [Knt_Wartosc2]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Atrybut3]  DEFAULT ('') FOR [Knt_Atrybut3]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Format3]  DEFAULT ((0)) FOR [Knt_Format3]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Wartosc3]  DEFAULT ('') FOR [Knt_Wartosc3]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_AkwProwizja]  DEFAULT ((0)) FOR [Knt_AkwProwizja]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Umowa]  DEFAULT ('') FOR [Knt_Umowa]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_DataW]  DEFAULT ((0)) FOR [Knt_DataW]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_LastModL]  DEFAULT ((0)) FOR [Knt_LastModL]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_LastModO]  DEFAULT ((0)) FOR [Knt_LastModO]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_LastModC]  DEFAULT ((0)) FOR [Knt_LastModC]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_FaVATOsw]  DEFAULT ('') FOR [Knt_FaVATOsw]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_CechaOpis]  DEFAULT ('') FOR [Knt_CechaOpis]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Aktywna]  DEFAULT ((0)) FOR [Knt_Aktywna]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Wsk]  DEFAULT ((0)) FOR [Knt_Wsk]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OutlookUrl]  DEFAULT ('') FOR [Knt_OutlookUrl]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Nieaktywny]  DEFAULT ((0)) FOR [Knt_Nieaktywny]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Zrodlo]  DEFAULT ((0)) FOR [Knt_Zrodlo]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Branza]  DEFAULT ((0)) FOR [Knt_Branza]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Rodzaj]  DEFAULT ((0)) FOR [Knt_Rodzaj]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_RolaPartnera]  DEFAULT ((0)) FOR [Knt_RolaPartnera]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Odleglosc]  DEFAULT ((0)) FOR [Knt_Odleglosc]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KarTyp]  DEFAULT ((0)) FOR [Knt_KarTyp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KarFirma]  DEFAULT ((0)) FOR [Knt_KarFirma]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KarNumer]  DEFAULT ((0)) FOR [Knt_KarNumer]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KarLp]  DEFAULT ((0)) FOR [Knt_KarLp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_NRB]  DEFAULT ((0)) FOR [Knt_NRB]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Archiwalny]  DEFAULT ((0)) FOR [Knt_Archiwalny]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_AdresNieAktualny]  DEFAULT ((0)) FOR [Knt_AdresNieAktualny]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_LastTransLockDate]  DEFAULT ((0)) FOR [Knt_LastTransLockDate]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OpeTypM]  DEFAULT ((0)) FOR [Knt_OpeTypM]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OpeFirmaM]  DEFAULT ((0)) FOR [Knt_OpeFirmaM]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OpeNumerM]  DEFAULT ((0)) FOR [Knt_OpeNumerM]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OpeLpM]  DEFAULT ((0)) FOR [Knt_OpeLpM]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_BlokadaTransakcji]  DEFAULT ((0)) FOR [Knt_BlokadaTransakcji]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Oddzialowy]  DEFAULT ((0)) FOR [Knt_Oddzialowy]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Spedytor]  DEFAULT ((0)) FOR [Knt_Spedytor]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_TerminPlKa]  DEFAULT ((0)) FOR [Knt_TerminPlKa]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_FormaPlKa]  DEFAULT ((0)) FOR [Knt_FormaPlKa]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_TerminPlZak]  DEFAULT ((0)) FOR [Knt_TerminPlZak]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_FormaPlZak]  DEFAULT ((0)) FOR [Knt_FormaPlZak]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_SpTerminPlSpr]  DEFAULT ((0)) FOR [Knt_SpTerminPlSpr]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_SpTerminPlRK]  DEFAULT ((0)) FOR [Knt_SpTerminPlRK]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_SpTerminPlZak]  DEFAULT ((0)) FOR [Knt_SpTerminPlZak]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_LimitTerminowy]  DEFAULT ((0)) FOR [Knt_LimitTerminowy]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_DataWygasniecia]  DEFAULT ((0)) FOR [Knt_DataWygasniecia]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PIN]  DEFAULT ('') FOR [Knt_PIN]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Priorytet]  DEFAULT ((0)) FOR [Knt_Priorytet]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_FrsID]  DEFAULT ((0)) FOR [Knt_FrsID]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Controlling]  DEFAULT ((0)) FOR [Knt_Controlling]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_RolnikRyczaltowy]  DEFAULT ((0)) FOR [Knt_RolnikRyczaltowy]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PriorytetRez]  DEFAULT ((0)) FOR [Knt_PriorytetRez]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Powiazany]  DEFAULT ((0)) FOR [Knt_Powiazany]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PlatnoscKaucji]  DEFAULT ((0)) FOR [Knt_PlatnoscKaucji]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_TerminRozliczeniaKaucji]  DEFAULT ((0)) FOR [Knt_TerminRozliczeniaKaucji]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KnPTyp]  DEFAULT ((0)) FOR [Knt_KnPTyp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KnPNumer]  DEFAULT ((0)) FOR [Knt_KnPNumer]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KnPParam]  DEFAULT ((0)) FOR [Knt_KnPParam]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_DataUtworzenia]  DEFAULT ((0)) FOR [Knt_DataUtworzenia]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_DokumentTozsamosci]  DEFAULT ('') FOR [Knt_DokumentTozsamosci]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_DataWydania]  DEFAULT ((0)) FOR [Knt_DataWydania]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OrganWydajacy]  DEFAULT ('') FOR [Knt_OrganWydajacy]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_MaxDniPoTerminie]  DEFAULT ((0)) FOR [Knt_MaxDniPoTerminie]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KalendarzDst]  DEFAULT ((0)) FOR [Knt_KalendarzDst]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KalendarzWys]  DEFAULT ((0)) FOR [Knt_KalendarzWys]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KnGTyp]  DEFAULT ((0)) FOR [Knt_KnGTyp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KnGNumer]  DEFAULT ((0)) FOR [Knt_KnGNumer]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Punkty]  DEFAULT ((0)) FOR [Knt_Punkty]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KnCTyp]  DEFAULT ((0)) FOR [Knt_KnCTyp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KnCNumer]  DEFAULT ((0)) FOR [Knt_KnCNumer]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_EFaVatAktywne]  DEFAULT ((0)) FOR [Knt_EFaVatAktywne]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_EFaVatOsw]  DEFAULT ('') FOR [Knt_EFaVatOsw]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_EFaVatDataDo]  DEFAULT ((0)) FOR [Knt_EFaVatDataDo]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_EFaVatEMail]  DEFAULT ('') FOR [Knt_EFaVatEMail]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PodatnikiemNabywca]  DEFAULT ((0)) FOR [Knt_PodatnikiemNabywca]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_MSTwrGrupaNumer]  DEFAULT ((0)) FOR [Knt_MSTwrGrupaNumer]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_StanPostep]  DEFAULT ((0)) FOR [Knt_StanPostep]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_ESklep]  DEFAULT ((0)) FOR [Knt_ESklep]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_BlokadaZam]  DEFAULT ((0)) FOR [Knt_BlokadaZam]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_BlokadaZamTS]  DEFAULT ((0)) FOR [Knt_BlokadaZamTS]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OpZTyp]  DEFAULT ((0)) FOR [Knt_OpZTyp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OpZFirma]  DEFAULT ((0)) FOR [Knt_OpZFirma]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OpZNumer]  DEFAULT ((0)) FOR [Knt_OpZNumer]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OpZLp]  DEFAULT ((0)) FOR [Knt_OpZLp]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_TypDokZS]  DEFAULT ((0)) FOR [Knt_TypDokZS]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_TypDokZZ]  DEFAULT ((0)) FOR [Knt_TypDokZZ]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PojedynczeDokDoZam]  DEFAULT ((0)) FOR [Knt_PojedynczeDokDoZam]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_MaxTerminPlSpr]  DEFAULT ((0)) FOR [Knt_MaxTerminPlSpr]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_MaxTerminPlZak]  DEFAULT ((0)) FOR [Knt_MaxTerminPlZak]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_DataOdLoj]  DEFAULT ((0)) FOR [Knt_DataOdLoj]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_DataDoLoj]  DEFAULT ((0)) FOR [Knt_DataDoLoj]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KartaLoj]  DEFAULT ('') FOR [Knt_KartaLoj]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PunktyOdebr]  DEFAULT ((0)) FOR [Knt_PunktyOdebr]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PunktyNalicz]  DEFAULT ((0)) FOR [Knt_PunktyNalicz]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PunktyKorekta]  DEFAULT ((0)) FOR [Knt_PunktyKorekta]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_PodzialPlat]  DEFAULT ((0)) FOR [Knt_PodzialPlat]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_VatWalSys]  DEFAULT ((0)) FOR [Knt_VatWalSys]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_SplitPayment]  DEFAULT ((0)) FOR [Knt_SplitPayment]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Anonim]  DEFAULT ((0)) FOR [Knt_Anonim]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_MetodaKasowa]  DEFAULT ((0)) FOR [Knt_MetodaKasowa]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_GUID]  DEFAULT (CONVERT([varchar](36),newid())) FOR [Knt_GUID]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_GUIDdane]  DEFAULT (CONVERT([varchar](36),newid())) FOR [Knt_GUIDdane]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_DataPromocji]  DEFAULT ((1)) FOR [Knt_DataPromocji]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_VatDataRejestracji]  DEFAULT ((0)) FOR [Knt_VatDataRejestracji]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_VatDataPrzywrocenia]  DEFAULT ((0)) FOR [Knt_VatDataPrzywrocenia]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_VatDataOdmowy]  DEFAULT ((0)) FOR [Knt_VatDataOdmowy]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_VatDataUsuniecia]  DEFAULT ((0)) FOR [Knt_VatDataUsuniecia]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KrajSiedziby]  DEFAULT ('') FOR [Knt_KrajSiedziby]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_ProcTrnJpk]  DEFAULT ('') FOR [Knt_ProcTrnJpk]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_Kurier]  DEFAULT ((0)) FOR [Knt_Kurier]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OplataSpozZakup]  DEFAULT ((0)) FOR [Knt_OplataSpozZakup]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_OplataSpozSprzedaz]  DEFAULT ((0)) FOR [Knt_OplataSpozSprzedaz]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_WSTO]  DEFAULT ((0)) FOR [Knt_WSTO]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KSeFWyslij]  DEFAULT ((0)) FOR [Knt_KSeFWyslij]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_AutoZatw]  DEFAULT ((0)) FOR [Knt_AutoZatw]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_KSeFZrodlowy]  DEFAULT ((0)) FOR [Knt_KSeFZrodlowy]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_GUIDKarta]  DEFAULT (CONVERT([varchar](36),newid())) FOR [Knt_GUIDKarta]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_CharsetANSI]  DEFAULT ((238)) FOR [Knt_CharsetANSI]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_BigApfinoVycWynik]  DEFAULT ((0)) FOR [Knt_BigApfinoVycWynik]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_BigApfinoVycWynikData]  DEFAULT ((0)) FOR [Knt_BigApfinoVycWynikData]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_BigApfinoVycOczekiwanie]  DEFAULT ((0)) FOR [Knt_BigApfinoVycOczekiwanie]
GO
ALTER TABLE [CDN].[KntKarty] ADD  CONSTRAINT [DF_Knt_AutoWindykacjaApfino]  DEFAULT ((0)) FOR [Knt_AutoWindykacjaApfino]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_KntTyp]  DEFAULT ((0)) FOR [KLK_KntTyp]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_KntNumer]  DEFAULT ((0)) FOR [KLK_KntNumer]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_MaxLimitWart]  DEFAULT ((0)) FOR [KLK_MaxLimitWart]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_LimitPoTerminie]  DEFAULT ((0)) FOR [KLK_LimitPoTerminie]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_DataOd]  DEFAULT ((0)) FOR [KLK_DataOd]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_DataDo]  DEFAULT ((0)) FOR [KLK_DataDo]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_Waluta]  DEFAULT ('') FOR [KLK_Waluta]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_NrKursu]  DEFAULT ((0)) FOR [KLK_NrKursu]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_KursM]  DEFAULT ((0)) FOR [KLK_KursM]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_KursL]  DEFAULT ((0)) FOR [KLK_KursL]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_PrzeliczajWg]  DEFAULT ('') FOR [KLK_PrzeliczajWg]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_CzasUtworzenia]  DEFAULT ((0)) FOR [KLK_CzasUtworzenia]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_OpeUtworzyl]  DEFAULT ((0)) FOR [KLK_OpeUtworzyl]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_CzasModyfikacji]  DEFAULT ((0)) FOR [KLK_CzasModyfikacji]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_OpeModyfikowal]  DEFAULT ((0)) FOR [KLK_OpeModyfikowal]
GO
ALTER TABLE [CDN].[KntLimityK] ADD  CONSTRAINT [DF_KLK_PrzeliczajWgTyp]  DEFAULT ((0)) FOR [KLK_PrzeliczajWgTyp]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_KntTyp]  DEFAULT ((0)) FOR [KtO_KntTyp]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_KntNumer]  DEFAULT ((0)) FOR [KtO_KntNumer]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_KntLp]  DEFAULT ((0)) FOR [KtO_KntLp]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_PrcNumer]  DEFAULT ((0)) FOR [KtO_PrcNumer]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_DataOd]  DEFAULT ((0)) FOR [KtO_DataOd]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_DataDo]  DEFAULT ((0)) FOR [KtO_DataDo]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_Glowny]  DEFAULT ((0)) FOR [KtO_Glowny]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_OpeTyp]  DEFAULT ((0)) FOR [KtO_OpeTyp]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_OpeFirma]  DEFAULT ((0)) FOR [KtO_OpeFirma]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_OpeNumer]  DEFAULT ((0)) FOR [KtO_OpeNumer]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_OpeLp]  DEFAULT ((0)) FOR [KtO_OpeLp]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_OpeTypM]  DEFAULT ((0)) FOR [KtO_OpeTypM]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_OpeFirmaM]  DEFAULT ((0)) FOR [KtO_OpeFirmaM]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_OpeNumerM]  DEFAULT ((0)) FOR [KtO_OpeNumerM]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_OpeLpM]  DEFAULT ((0)) FOR [KtO_OpeLpM]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_Uwagi]  DEFAULT ('') FOR [KtO_Uwagi]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_CzasPrzypisania]  DEFAULT ((0)) FOR [KtO_CzasPrzypisania]
GO
ALTER TABLE [CDN].[KntOpiekun] ADD  CONSTRAINT [DF_KtO_CzasModyfikacji]  DEFAULT ((0)) FOR [KtO_CzasModyfikacji]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_KntTyp]  DEFAULT ((0)) FOR [KnS_KntTyp]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_KntFirma]  DEFAULT ((0)) FOR [KnS_KntFirma]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_KntNumer]  DEFAULT ((0)) FOR [KnS_KntNumer]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_KntLp]  DEFAULT ((0)) FOR [KnS_KntLp]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_Upowazniona]  DEFAULT ((0)) FOR [KnS_Upowazniona]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_UpowaznionaZam]  DEFAULT ((0)) FOR [KnS_UpowaznionaZam]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_Dzial]  DEFAULT ('') FOR [KnS_Dzial]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_Stanowisko]  DEFAULT ('') FOR [KnS_Stanowisko]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_Tytul]  DEFAULT ('') FOR [KnS_Tytul]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_Nazwa]  DEFAULT ('') FOR [KnS_Nazwa]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_Telefon]  DEFAULT ('') FOR [KnS_Telefon]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_EMail]  DEFAULT ('') FOR [KnS_EMail]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_HasloChk]  DEFAULT ('') FOR [KnS_HasloChk]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_HasloOsoby]  DEFAULT ('') FOR [KnS_HasloOsoby]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_Notatki]  DEFAULT ('') FOR [KnS_Notatki]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_RolaDecyzyjna]  DEFAULT ((0)) FOR [KnS_RolaDecyzyjna]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_Fax]  DEFAULT ('') FOR [KnS_Fax]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_TelefonK]  DEFAULT ('') FOR [KnS_TelefonK]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_UpoDoK]  DEFAULT ((0)) FOR [KnS_UpoDoK]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_Archiwalny]  DEFAULT ((0)) FOR [KnS_Archiwalny]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_Pozycja]  DEFAULT ((0)) FOR [KnS_Pozycja]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_CzasModyfikacji]  DEFAULT ((0)) FOR [KnS_CzasModyfikacji]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_AdresId]  DEFAULT ((0)) FOR [KnS_AdresId]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_OdpWindykacja]  DEFAULT ((0)) FOR [KnS_OdpWindykacja]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_Anonim]  DEFAULT ((0)) FOR [KnS_Anonim]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_ESklep]  DEFAULT ((0)) FOR [KnS_ESklep]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_AdminESklep]  DEFAULT ((0)) FOR [KnS_AdminESklep]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_PreferowanyJezyk]  DEFAULT ((0)) FOR [KnS_PreferowanyJezyk]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_GUID]  DEFAULT (CONVERT([varchar](36),newid())) FOR [KnS_GUID]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_GUID2]  DEFAULT (CONVERT([varchar](36),newid())) FOR [KnS_GUID2]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_CzyEMailUpom]  DEFAULT ((0)) FOR [KnS_CzyEMailUpom]
GO
ALTER TABLE [CDN].[KntOsoby] ADD  CONSTRAINT [DF_KnS_CharsetANSI]  DEFAULT ((238)) FOR [KnS_CharsetANSI]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_PrmId]  DEFAULT ((0)) FOR [KPR_PrmId]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_KntTyp]  DEFAULT ((0)) FOR [KPR_KntTyp]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_KntFirma]  DEFAULT ((0)) FOR [KPR_KntFirma]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_KntNumer]  DEFAULT ((0)) FOR [KPR_KntNumer]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_KntLp]  DEFAULT ((0)) FOR [KPR_KntLp]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_KngTyp]  DEFAULT ((0)) FOR [KPR_KngTyp]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_KngFirma]  DEFAULT ((0)) FOR [KPR_KngFirma]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_KngNumer]  DEFAULT ((0)) FOR [KPR_KngNumer]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_KngLp]  DEFAULT ((0)) FOR [KPR_KngLp]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_Typ]  DEFAULT ((0)) FOR [KPR_Typ]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_Wartosc]  DEFAULT ((0)) FOR [KPR_Wartosc]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_OkresTransakcjiOd]  DEFAULT ((0)) FOR [KPR_OkresTransakcjiOd]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_OkresTransakcjiDo]  DEFAULT ((0)) FOR [KPR_OkresTransakcjiDo]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_Punkty]  DEFAULT ((0)) FOR [KPR_Punkty]
GO
ALTER TABLE [CDN].[KntPromocje] ADD  CONSTRAINT [DF_KPR_GUID]  DEFAULT (CONVERT([varchar](36),newid())) FOR [KPR_GUID]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_GIDTyp]  DEFAULT ((0)) FOR [MAG_GIDTyp]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_GIDFirma]  DEFAULT ((0)) FOR [MAG_GIDFirma]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_GIDLp]  DEFAULT ((0)) FOR [MAG_GIDLp]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Kod]  DEFAULT ('') FOR [MAG_Kod]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Nazwa]  DEFAULT ('') FOR [MAG_Nazwa]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_KodP]  DEFAULT ('') FOR [MAG_KodP]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Miasto]  DEFAULT ('') FOR [MAG_Miasto]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Ulica]  DEFAULT ('') FOR [MAG_Ulica]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Adres]  DEFAULT ('') FOR [MAG_Adres]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_PrcTyp]  DEFAULT ((0)) FOR [MAG_PrcTyp]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_PrcFirma]  DEFAULT ((0)) FOR [MAG_PrcFirma]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_PrcNumer]  DEFAULT ((0)) FOR [MAG_PrcNumer]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_PrcLp]  DEFAULT ((0)) FOR [MAG_PrcLp]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Pojemnosc]  DEFAULT ((0)) FOR [MAG_Pojemnosc]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Konto]  DEFAULT ('') FOR [MAG_Konto]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Opis]  DEFAULT ('') FOR [MAG_Opis]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Wewnetrzny]  DEFAULT ((0)) FOR [MAG_Wewnetrzny]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Pico]  DEFAULT ((0)) FOR [MAG_Pico]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Zarzadzanie]  DEFAULT ((0)) FOR [MAG_Zarzadzanie]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_KntTyp]  DEFAULT ((0)) FOR [MAG_KntTyp]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_KntFirma]  DEFAULT ((0)) FOR [MAG_KntFirma]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_KntNumer]  DEFAULT ((0)) FOR [MAG_KntNumer]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_KntLp]  DEFAULT ((0)) FOR [MAG_KntLp]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Zablokowany]  DEFAULT ((0)) FOR [MAG_Zablokowany]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_DataInw]  DEFAULT ((0)) FOR [MAG_DataInw]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_KontoInw]  DEFAULT ('') FOR [MAG_KontoInw]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_Kraj]  DEFAULT ('') FOR [MAG_Kraj]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_CzasModyfikacji]  DEFAULT ((0)) FOR [MAG_CzasModyfikacji]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_OpeMNumer]  DEFAULT ((0)) FOR [MAG_OpeMNumer]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_AnalizaA]  DEFAULT ((0)) FOR [MAG_AnalizaA]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_AnalizaB]  DEFAULT ((0)) FOR [MAG_AnalizaB]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_AnalizaX]  DEFAULT ((0)) FOR [MAG_AnalizaX]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_AnalizaY]  DEFAULT ((0)) FOR [MAG_AnalizaY]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_AnalizaABCXYZ]  DEFAULT ((0)) FOR [MAG_AnalizaABCXYZ]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_WMS]  DEFAULT ((0)) FOR [MAG_WMS]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_SposobPracyZWMS]  DEFAULT ((0)) FOR [MAG_SposobPracyZWMS]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_RealizujTylkoRezZas]  DEFAULT ((0)) FOR [MAG_RealizujTylkoRezZas]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_WMSNumer]  DEFAULT ((0)) FOR [MAG_WMSNumer]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_WMSRodzaj]  DEFAULT ((0)) FOR [MAG_WMSRodzaj]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_SposobGenDokMagWMS]  DEFAULT ((0)) FOR [MAG_SposobGenDokMagWMS]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_PcKId]  DEFAULT ((0)) FOR [MAG_PcKId]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_RezerwujZasoby]  DEFAULT ((0)) FOR [MAG_RezerwujZasoby]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_KontrolaIlosciWZWM]  DEFAULT ((0)) FOR [MAG_KontrolaIlosciWZWM]
GO
ALTER TABLE [CDN].[Magazyny] ADD  CONSTRAINT [DF_MAG_RealizujwPOS]  DEFAULT ((0)) FOR [MAG_RealizujwPOS]
GO
ALTER TABLE [CDN].[Nazwy] ADD  CONSTRAINT [DF_Naz_GIDTyp]  DEFAULT ((0)) FOR [Naz_GIDTyp]
GO
ALTER TABLE [CDN].[Nazwy] ADD  CONSTRAINT [DF_Naz_GIDFirma]  DEFAULT ((0)) FOR [Naz_GIDFirma]
GO
ALTER TABLE [CDN].[Nazwy] ADD  CONSTRAINT [DF_Naz_GIDNumer]  DEFAULT ((0)) FOR [Naz_GIDNumer]
GO
ALTER TABLE [CDN].[Nazwy] ADD  CONSTRAINT [DF_Naz_GIDLp]  DEFAULT ((0)) FOR [Naz_GIDLp]
GO
ALTER TABLE [CDN].[Nazwy] ADD  CONSTRAINT [DF_Naz_Nazwa]  DEFAULT ('') FOR [Naz_Nazwa]
GO
ALTER TABLE [CDN].[Nazwy] ADD  CONSTRAINT [DF_Naz_Nazwa1]  DEFAULT ('') FOR [Naz_Nazwa1]
GO
ALTER TABLE [CDN].[Nazwy] ADD  CONSTRAINT [DF_Naz_Opis]  DEFAULT ('') FOR [Naz_Opis]
GO
ALTER TABLE [CDN].[Nazwy] ADD  CONSTRAINT [DF_Naz_Archiwalny]  DEFAULT ((0)) FOR [Naz_Archiwalny]
GO
ALTER TABLE [CDN].[Nazwy] ADD  CONSTRAINT [DF_Naz_CzasModyfikacji]  DEFAULT ((0)) FOR [Naz_CzasModyfikacji]
GO
ALTER TABLE [CDN].[Nazwy] ADD  CONSTRAINT [DF_Naz_Predefiniowana]  DEFAULT ((0)) FOR [Naz_Predefiniowana]
GO
ALTER TABLE [CDN].[Nazwy] ADD  CONSTRAINT [DF_Naz_Nazwa2]  DEFAULT ('') FOR [Naz_Nazwa2]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_GIDTyp]  DEFAULT ((0)) FOR [Prc_GIDTyp]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_GIDFirma]  DEFAULT ((0)) FOR [Prc_GIDFirma]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_GIDLp]  DEFAULT ((0)) FOR [Prc_GIDLp]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_OpeTyp]  DEFAULT ((0)) FOR [Prc_OpeTyp]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_OpeFirma]  DEFAULT ((0)) FOR [Prc_OpeFirma]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_OpeNumer]  DEFAULT ((0)) FOR [Prc_OpeNumer]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_OpeLp]  DEFAULT ((0)) FOR [Prc_OpeLp]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_BnkTyp]  DEFAULT ((0)) FOR [Prc_BnkTyp]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_BnkFirma]  DEFAULT ((0)) FOR [Prc_BnkFirma]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_BnkNumer]  DEFAULT ((0)) FOR [Prc_BnkNumer]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_BnkLp]  DEFAULT ((0)) FOR [Prc_BnkLp]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_ZakTyp]  DEFAULT ((0)) FOR [Prc_ZakTyp]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_ZakFirma]  DEFAULT ((0)) FOR [Prc_ZakFirma]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_ZakNumer]  DEFAULT ((0)) FOR [Prc_ZakNumer]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_ZakLp]  DEFAULT ((0)) FOR [Prc_ZakLp]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Akronim]  DEFAULT ('') FOR [Prc_Akronim]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Imie1]  DEFAULT ('') FOR [Prc_Imie1]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Imie2]  DEFAULT ('') FOR [Prc_Imie2]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Nazwisko]  DEFAULT ('') FOR [Prc_Nazwisko]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_KodP]  DEFAULT ('') FOR [Prc_KodP]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Miasto]  DEFAULT ('') FOR [Prc_Miasto]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Poczta]  DEFAULT ('') FOR [Prc_Poczta]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Ulica]  DEFAULT ('') FOR [Prc_Ulica]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_NrDomu]  DEFAULT ('') FOR [Prc_NrDomu]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_NrLokalu]  DEFAULT ('') FOR [Prc_NrLokalu]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_NipE]  DEFAULT ('') FOR [Prc_NipE]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Nip]  DEFAULT ('') FOR [Prc_Nip]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Pesel]  DEFAULT ('') FOR [Prc_Pesel]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_EMail]  DEFAULT ('') FOR [Prc_EMail]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_EMail2]  DEFAULT ('') FOR [Prc_EMail2]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Telefon1]  DEFAULT ('') FOR [Prc_Telefon1]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_TelefonWew1]  DEFAULT ('') FOR [Prc_TelefonWew1]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Telefon2]  DEFAULT ('') FOR [Prc_Telefon2]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Telefon3]  DEFAULT ('') FOR [Prc_Telefon3]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Telefon4]  DEFAULT ('') FOR [Prc_Telefon4]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_URL]  DEFAULT ('') FOR [Prc_URL]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_URL2]  DEFAULT ('') FOR [Prc_URL2]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_NrRachunku]  DEFAULT ('') FOR [Prc_NrRachunku]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_NRB]  DEFAULT ((0)) FOR [Prc_NRB]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_KontoKs1]  DEFAULT ('') FOR [Prc_KontoKs1]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_KontoKs2]  DEFAULT ('') FOR [Prc_KontoKs2]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_KontoKs3]  DEFAULT ('') FOR [Prc_KontoKs3]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_KontoKs4]  DEFAULT ('') FOR [Prc_KontoKs4]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_KontoKs5]  DEFAULT ('') FOR [Prc_KontoKs5]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_FormaNr]  DEFAULT ((0)) FOR [Prc_FormaNr]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Ksiegowany]  DEFAULT ((0)) FOR [Prc_Ksiegowany]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Archiwalny]  DEFAULT ((0)) FOR [Prc_Archiwalny]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_ArchiwalnyData]  DEFAULT ((0)) FOR [Prc_ArchiwalnyData]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_WmrID]  DEFAULT ((0)) FOR [Prc_WmrID]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_TypWymiaru]  DEFAULT ((0)) FOR [Prc_TypWymiaru]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Wyrazenie]  DEFAULT ((0)) FOR [Prc_Wyrazenie]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Inbox]  DEFAULT ('') FOR [Prc_Inbox]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_FrSId]  DEFAULT ((0)) FOR [Prc_FrSId]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_OptimaId]  DEFAULT ((0)) FOR [Prc_OptimaId]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_NTSid]  DEFAULT ('') FOR [Prc_NTSid]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_NTKonto]  DEFAULT ('') FOR [Prc_NTKonto]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Serwisant]  DEFAULT ((0)) FOR [Prc_Serwisant]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_PKAId]  DEFAULT ((0)) FOR [Prc_PKAId]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Rodzaj]  DEFAULT ((0)) FOR [Prc_Rodzaj]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_WojStosunek]  DEFAULT ((0)) FOR [Prc_WojStosunek]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_WojWKU]  DEFAULT ('') FOR [Prc_WojWKU]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_WojNumer]  DEFAULT ('') FOR [Prc_WojNumer]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_WojPrzydzial]  DEFAULT ('') FOR [Prc_WojPrzydzial]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_WojStopien]  DEFAULT ('') FOR [Prc_WojStopien]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_WojSpec]  DEFAULT ('') FOR [Prc_WojSpec]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Karany]  DEFAULT ((0)) FOR [Prc_Karany]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_KaranyOpis]  DEFAULT ('') FOR [Prc_KaranyOpis]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_ZgodaNaPrzetwarzanie]  DEFAULT ((0)) FOR [Prc_ZgodaNaPrzetwarzanie]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_WypadekOsoba]  DEFAULT ('') FOR [Prc_WypadekOsoba]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_WypadekTelefon]  DEFAULT ('') FOR [Prc_WypadekTelefon]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_WypadekAdres]  DEFAULT ('') FOR [Prc_WypadekAdres]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Opis]  DEFAULT ('') FOR [Prc_Opis]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Omnie]  DEFAULT ('') FOR [Prc_Omnie]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_MiejscePracy]  DEFAULT ('') FOR [Prc_MiejscePracy]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_NrPokoju]  DEFAULT ('') FOR [Prc_NrPokoju]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_PoziomWyksztalcenia]  DEFAULT ((0)) FOR [Prc_PoziomWyksztalcenia]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_OpeWNumer]  DEFAULT ((0)) FOR [Prc_OpeWNumer]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_CzasWprowadzenia]  DEFAULT ((0)) FOR [Prc_CzasWprowadzenia]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_OpeMNumer]  DEFAULT ((0)) FOR [Prc_OpeMNumer]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_CzasModyfikacji]  DEFAULT ((0)) FOR [Prc_CzasModyfikacji]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_ZewnetrznySys]  DEFAULT ((0)) FOR [Prc_ZewnetrznySys]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_DomyslneCentrumKosztId]  DEFAULT ((0)) FOR [Prc_DomyslneCentrumKosztId]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_Kraj]  DEFAULT ('') FOR [Prc_Kraj]
GO
ALTER TABLE [CDN].[PrcKarty] ADD  CONSTRAINT [DF_Prc_ESklep]  DEFAULT ((0)) FOR [Prc_ESklep]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_Akronim]  DEFAULT ('') FOR [PRM_Akronim]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_DataOd]  DEFAULT ((0)) FOR [PRM_DataOd]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_DataDo]  DEFAULT ((0)) FOR [PRM_DataDo]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_Typ]  DEFAULT ((0)) FOR [PRM_Typ]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_Priorytet]  DEFAULT ((0)) FOR [PRM_Priorytet]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_Stan]  DEFAULT ((0)) FOR [PRM_Stan]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_Aktywna]  DEFAULT ((0)) FOR [PRM_Aktywna]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_SposobStosowania]  DEFAULT ((0)) FOR [PRM_SposobStosowania]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_PominPozostale]  DEFAULT ((0)) FOR [PRM_PominPozostale]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_Uwagi]  DEFAULT ('') FOR [PRM_Uwagi]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_Dokument]  DEFAULT ((0)) FOR [PRM_Dokument]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_LastMod]  DEFAULT ((0)) FOR [PRM_LastMod]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_PriorytetLp]  DEFAULT ((0)) FOR [PRM_PriorytetLp]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_Cykliczna]  DEFAULT ((0)) FOR [PRM_Cykliczna]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_BlokadaCeny]  DEFAULT ((0)) FOR [PRM_BlokadaCeny]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_OpeTypM]  DEFAULT ((0)) FOR [PRM_OpeTypM]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_OpeFirmaM]  DEFAULT ((0)) FOR [PRM_OpeFirmaM]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_OpeNumerM]  DEFAULT ((0)) FOR [PRM_OpeNumerM]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_OpeLpM]  DEFAULT ((0)) FOR [PRM_OpeLpM]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_Pakietowa]  DEFAULT ((0)) FOR [PRM_Pakietowa]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_RodzajPakietu]  DEFAULT ((0)) FOR [PRM_RodzajPakietu]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_NajwyzszyProg]  DEFAULT ((0)) FOR [PRM_NajwyzszyProg]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_OpeTypU]  DEFAULT ((0)) FOR [PRM_OpeTypU]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_OpeNumerU]  DEFAULT ((0)) FOR [PRM_OpeNumerU]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_OpeTypP]  DEFAULT ((0)) FOR [PRM_OpeTypP]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_OpeNumerP]  DEFAULT ((0)) FOR [PRM_OpeNumerP]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_OpeTypZ]  DEFAULT ((0)) FOR [PRM_OpeTypZ]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_OpeNumerZ]  DEFAULT ((0)) FOR [PRM_OpeNumerZ]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_DataUtworzenia]  DEFAULT ((0)) FOR [PRM_DataUtworzenia]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_DataPotwierdzenia]  DEFAULT ((0)) FOR [PRM_DataPotwierdzenia]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_DataZamkniecia]  DEFAULT ((0)) FOR [PRM_DataZamkniecia]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_Kolor]  DEFAULT ((0)) FOR [PRM_Kolor]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_KolorBG]  DEFAULT ((0)) FOR [PRM_KolorBG]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_CyklCzestotliwosc]  DEFAULT ((0)) FOR [PRM_CyklCzestotliwosc]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_CyklRodzaj]  DEFAULT ((0)) FOR [PRM_CyklRodzaj]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_CyklWystepowanie]  DEFAULT ((0)) FOR [PRM_CyklWystepowanie]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_CyklDniOd]  DEFAULT ((0)) FOR [PRM_CyklDniOd]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_CyklDniDo]  DEFAULT ((0)) FOR [PRM_CyklDniDo]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_ZamknietaLista]  DEFAULT ((0)) FOR [PRM_ZamknietaLista]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_LimitTyp]  DEFAULT ((0)) FOR [PRM_LimitTyp]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_LimitWartosc]  DEFAULT ((0)) FOR [PRM_LimitWartosc]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_GrupaTwrWazniejsza]  DEFAULT ((0)) FOR [PRM_GrupaTwrWazniejsza]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_ProgTyp]  DEFAULT ((0)) FOR [PRM_ProgTyp]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_ProgWartosc]  DEFAULT ((0)) FOR [PRM_ProgWartosc]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_OkresTransakcjiOd]  DEFAULT ((0)) FOR [PRM_OkresTransakcjiOd]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_OkresTransakcjiDo]  DEFAULT ((0)) FOR [PRM_OkresTransakcjiDo]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_WarunekProgSQL]  DEFAULT ('') FOR [PRM_WarunekProgSQL]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_MaxIloscPakietow]  DEFAULT ((0)) FOR [PRM_MaxIloscPakietow]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_LimitRodzaj]  DEFAULT ((0)) FOR [PRM_LimitRodzaj]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_WymagajJm]  DEFAULT ((0)) FOR [PRM_WymagajJm]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_JmZ]  DEFAULT ('') FOR [PRM_JmZ]
GO
ALTER TABLE [CDN].[PrmKarty] ADD  CONSTRAINT [DF_PRM_GUID]  DEFAULT (CONVERT([varchar](36),newid())) FOR [PRM_GUID]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_TwrTyp]  DEFAULT ((0)) FOR [TwC_TwrTyp]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_TwrFirma]  DEFAULT ((0)) FOR [TwC_TwrFirma]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_TwrNumer]  DEFAULT ((0)) FOR [TwC_TwrNumer]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_TwrLp]  DEFAULT ((0)) FOR [TwC_TwrLp]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_Waluta]  DEFAULT ('') FOR [TwC_Waluta]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_NrKursu]  DEFAULT ((0)) FOR [TwC_NrKursu]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_Marza]  DEFAULT ((0)) FOR [TwC_Marza]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_Zaok]  DEFAULT ((0.0001)) FOR [TwC_Zaok]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_Offset]  DEFAULT ((0)) FOR [TwC_Offset]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_RodzajPodstawy]  DEFAULT ((0)) FOR [TwC_RodzajPodstawy]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_Wartosc]  DEFAULT ((0)) FOR [TwC_Wartosc]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_Aktualizacja]  DEFAULT ((0)) FOR [TwC_Aktualizacja]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_Priorytet]  DEFAULT ((0)) FOR [TwC_Priorytet]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_CzasModyfikacji]  DEFAULT ((0)) FOR [TwC_CzasModyfikacji]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_KosztyDodatkowe]  DEFAULT ((0)) FOR [TwC_KosztyDodatkowe]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_DokTyp]  DEFAULT ((0)) FOR [TwC_DokTyp]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_DokFirma]  DEFAULT ((0)) FOR [TwC_DokFirma]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_DokNumer]  DEFAULT ((0)) FOR [TwC_DokNumer]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_DokLp]  DEFAULT ((0)) FOR [TwC_DokLp]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_TcnId]  DEFAULT ((0)) FOR [TwC_TcnId]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_DataOd]  DEFAULT ((0)) FOR [TwC_DataOd]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_KntTyp]  DEFAULT ((0)) FOR [TwC_KntTyp]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_KntFirma]  DEFAULT ((0)) FOR [TwC_KntFirma]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_KntNumer]  DEFAULT ((0)) FOR [TwC_KntNumer]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_KntLp]  DEFAULT ((0)) FOR [TwC_KntLp]
GO
ALTER TABLE [CDN].[TwrCeny] ADD  CONSTRAINT [DF_TwC_Aktywny]  DEFAULT ((0)) FOR [TwC_Aktywny]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_RodzajCeny]  DEFAULT ((0)) FOR [TCN_RodzajCeny]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_Nazwa]  DEFAULT ('') FOR [TCN_Nazwa]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_DataOd]  DEFAULT ((0)) FOR [TCN_DataOd]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_Stan]  DEFAULT ((0)) FOR [TCN_Stan]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_Aktywny]  DEFAULT ((0)) FOR [TCN_Aktywny]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_DataUtworzenia]  DEFAULT ((0)) FOR [TCN_DataUtworzenia]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_OpeWTyp]  DEFAULT ((0)) FOR [TCN_OpeWTyp]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_OpeWNumer]  DEFAULT ((0)) FOR [TCN_OpeWNumer]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_OpeMTyp]  DEFAULT ((0)) FOR [TCN_OpeMTyp]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_OpeMNumer]  DEFAULT ((0)) FOR [TCN_OpeMNumer]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_OpeZTyp]  DEFAULT ((0)) FOR [TCN_OpeZTyp]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_OpeZNumer]  DEFAULT ((0)) FOR [TCN_OpeZNumer]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_TCNId]  DEFAULT ((0)) FOR [TCN_TCNId]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_WalutaCenySprzedazy]  DEFAULT ('') FOR [TCN_WalutaCenySprzedazy]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_NrKursu]  DEFAULT ((0)) FOR [TCN_NrKursu]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_Marza]  DEFAULT ((0)) FOR [TCN_Marza]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_Zaok]  DEFAULT ((0)) FOR [TCN_Zaok]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_Offset]  DEFAULT ((0)) FOR [TCN_Offset]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_RodzajPodstawy]  DEFAULT ((0)) FOR [TCN_RodzajPodstawy]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_MarzaNarzutOpcja]  DEFAULT ((0)) FOR [TCN_MarzaNarzutOpcja]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_Aktualizacja]  DEFAULT ((0)) FOR [TCN_Aktualizacja]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_KntTyp]  DEFAULT ((0)) FOR [TCN_KntTyp]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_KntFirma]  DEFAULT ((0)) FOR [TCN_KntFirma]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_KntNumer]  DEFAULT ((0)) FOR [TCN_KntNumer]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_KntLp]  DEFAULT ((0)) FOR [TCN_KntLp]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_ZmianaProc]  DEFAULT ((0)) FOR [TCN_ZmianaProc]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_Opis]  DEFAULT ('') FOR [TCN_Opis]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_CzasModyfikacji]  DEFAULT ((0)) FOR [TCN_CzasModyfikacji]
GO
ALTER TABLE [CDN].[TwrCenyNag] ADD  CONSTRAINT [DF_TCN_Wsk]  DEFAULT ((0)) FOR [TCN_Wsk]
GO
ALTER TABLE [CDN].[TwrGrupyDom] ADD  CONSTRAINT [DF_TGD_GIDTyp]  DEFAULT ((0)) FOR [TGD_GIDTyp]
GO
ALTER TABLE [CDN].[TwrGrupyDom] ADD  CONSTRAINT [DF_TGD_GIDFirma]  DEFAULT ((0)) FOR [TGD_GIDFirma]
GO
ALTER TABLE [CDN].[TwrGrupyDom] ADD  CONSTRAINT [DF_TGD_GIDNumer]  DEFAULT ((0)) FOR [TGD_GIDNumer]
GO
ALTER TABLE [CDN].[TwrGrupyDom] ADD  CONSTRAINT [DF_TGD_GIDLp]  DEFAULT ((0)) FOR [TGD_GIDLp]
GO
ALTER TABLE [CDN].[TwrGrupyDom] ADD  CONSTRAINT [DF_TGD_GrOTyp]  DEFAULT ((0)) FOR [TGD_GrOTyp]
GO
ALTER TABLE [CDN].[TwrGrupyDom] ADD  CONSTRAINT [DF_TGD_GrOFirma]  DEFAULT ((0)) FOR [TGD_GrOFirma]
GO
ALTER TABLE [CDN].[TwrGrupyDom] ADD  CONSTRAINT [DF_TGD_GrONumer]  DEFAULT ((0)) FOR [TGD_GrONumer]
GO
ALTER TABLE [CDN].[TwrGrupyDom] ADD  CONSTRAINT [DF_TGD_GrOLp]  DEFAULT ((0)) FOR [TGD_GrOLp]
GO
ALTER TABLE [CDN].[TwrGrupyDom] ADD  CONSTRAINT [DF_TGD_Kod]  DEFAULT ('') FOR [TGD_Kod]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_GIDTyp]  DEFAULT ((0)) FOR [Twr_GIDTyp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_GIDFirma]  DEFAULT ((0)) FOR [Twr_GIDFirma]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_GIDLp]  DEFAULT ((0)) FOR [Twr_GIDLp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Typ]  DEFAULT ((0)) FOR [Twr_Typ]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Kod]  DEFAULT ('') FOR [Twr_Kod]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_KodFormat]  DEFAULT ('') FOR [Twr_KodFormat]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_FPPKod]  DEFAULT ('') FOR [Twr_FPPKod]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Nazwa]  DEFAULT ('') FOR [Twr_Nazwa]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Nazwa1]  DEFAULT ('') FOR [Twr_Nazwa1]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Certyfikat]  DEFAULT ('') FOR [Twr_Certyfikat]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Sww]  DEFAULT ('') FOR [Twr_Sww]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Ean]  DEFAULT ('') FOR [Twr_Ean]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Jm]  DEFAULT ('') FOR [Twr_Jm]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Waga]  DEFAULT ((0)) FOR [Twr_Waga]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_WJm]  DEFAULT ('') FOR [Twr_WJm]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_JmFormat]  DEFAULT ((0)) FOR [Twr_JmFormat]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_IloscZam]  DEFAULT ((0)) FOR [Twr_IloscZam]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_IloscMin]  DEFAULT ((0)) FOR [Twr_IloscMin]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_IloscMax]  DEFAULT ((0)) FOR [Twr_IloscMax]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Ubytek]  DEFAULT ((0)) FOR [Twr_Ubytek]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Prog]  DEFAULT ((0)) FOR [Twr_Prog]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Upust]  DEFAULT ((0)) FOR [Twr_Upust]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_UpustData]  DEFAULT ((0)) FOR [Twr_UpustData]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_UpustDataOd]  DEFAULT ((0)) FOR [Twr_UpustDataOd]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_UpustDataDo]  DEFAULT ((0)) FOR [Twr_UpustDataDo]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_UpustGodz]  DEFAULT ((0)) FOR [Twr_UpustGodz]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_UpustGodzOd]  DEFAULT ((0)) FOR [Twr_UpustGodzOd]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_UpustGodzDo]  DEFAULT ((0)) FOR [Twr_UpustGodzDo]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_AutoZam]  DEFAULT ((0)) FOR [Twr_AutoZam]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_IloscAZam]  DEFAULT ((0)) FOR [Twr_IloscAZam]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_CzasDst]  DEFAULT ((0)) FOR [Twr_CzasDst]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_CenaSpr]  DEFAULT ((0)) FOR [Twr_CenaSpr]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_JmDomyslna]  DEFAULT ((0)) FOR [Twr_JmDomyslna]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_DstDomyslny]  DEFAULT ((0)) FOR [Twr_DstDomyslny]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_RozliczMag]  DEFAULT ((0)) FOR [Twr_RozliczMag]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Zakup]  DEFAULT ((0)) FOR [Twr_Zakup]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Sprzedaz]  DEFAULT ((0)) FOR [Twr_Sprzedaz]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_GrupaPod]  DEFAULT ('') FOR [Twr_GrupaPod]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Akcyza]  DEFAULT ((0)) FOR [Twr_Akcyza]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OpeTyp]  DEFAULT ((0)) FOR [Twr_OpeTyp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OpeFirma]  DEFAULT ((0)) FOR [Twr_OpeFirma]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OpeNumer]  DEFAULT ((0)) FOR [Twr_OpeNumer]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OpeLp]  DEFAULT ((0)) FOR [Twr_OpeLp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PrcTyp]  DEFAULT ((0)) FOR [Twr_PrcTyp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PrcFirma]  DEFAULT ((0)) FOR [Twr_PrcFirma]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PrcNumer]  DEFAULT ((0)) FOR [Twr_PrcNumer]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PrcLp]  DEFAULT ((0)) FOR [Twr_PrcLp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_KontaktTyp]  DEFAULT ((0)) FOR [Twr_KontaktTyp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_KontaktZa]  DEFAULT ((0)) FOR [Twr_KontaktZa]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_KontaktJC]  DEFAULT ((1)) FOR [Twr_KontaktJC]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Okresowy]  DEFAULT ((0)) FOR [Twr_Okresowy]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Cel]  DEFAULT ('') FOR [Twr_Cel]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Atrybut1]  DEFAULT ('') FOR [Twr_Atrybut1]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Format1]  DEFAULT ((0)) FOR [Twr_Format1]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Wartosc1]  DEFAULT ('') FOR [Twr_Wartosc1]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Atrybut2]  DEFAULT ('') FOR [Twr_Atrybut2]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Format2]  DEFAULT ((0)) FOR [Twr_Format2]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Wartosc2]  DEFAULT ('') FOR [Twr_Wartosc2]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Atrybut3]  DEFAULT ('') FOR [Twr_Atrybut3]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Format3]  DEFAULT ((0)) FOR [Twr_Format3]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Wartosc3]  DEFAULT ('') FOR [Twr_Wartosc3]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Punkty]  DEFAULT ((0)) FOR [Twr_Punkty]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Koncesja]  DEFAULT ((0)) FOR [Twr_Koncesja]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Konto1]  DEFAULT ('') FOR [Twr_Konto1]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Konto2]  DEFAULT ('') FOR [Twr_Konto2]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Konto3]  DEFAULT ('') FOR [Twr_Konto3]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Polozenie]  DEFAULT ('') FOR [Twr_Polozenie]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Katalog]  DEFAULT ('') FOR [Twr_Katalog]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_WCenniku]  DEFAULT ((0)) FOR [Twr_WCenniku]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_EdycjaNazwy]  DEFAULT ((0)) FOR [Twr_EdycjaNazwy]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_BezRabatu]  DEFAULT ((0)) FOR [Twr_BezRabatu]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_KopiujOpis]  DEFAULT ((0)) FOR [Twr_KopiujOpis]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_URL]  DEFAULT ('') FOR [Twr_URL]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Warunek]  DEFAULT ('') FOR [Twr_Warunek]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_ObjetoscL]  DEFAULT ((0)) FOR [Twr_ObjetoscL]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_ObjetoscM]  DEFAULT ((0)) FOR [Twr_ObjetoscM]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_LastModL]  DEFAULT ((0)) FOR [Twr_LastModL]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_LastModO]  DEFAULT ((0)) FOR [Twr_LastModO]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_LastModC]  DEFAULT ((0)) FOR [Twr_LastModC]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_TerminZwrotu]  DEFAULT ((0)) FOR [Twr_TerminZwrotu]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_ZakupAutoryz]  DEFAULT ((0)) FOR [Twr_ZakupAutoryz]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_MagTyp]  DEFAULT ((0)) FOR [Twr_MagTyp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_MagFirma]  DEFAULT ((0)) FOR [Twr_MagFirma]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_MagNumer]  DEFAULT ((0)) FOR [Twr_MagNumer]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_MagLp]  DEFAULT ((0)) FOR [Twr_MagLp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_MarzaMin]  DEFAULT ((0)) FOR [Twr_MarzaMin]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_KosztUslugi]  DEFAULT ((0)) FOR [Twr_KosztUslugi]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_KosztUTyp]  DEFAULT ((0)) FOR [Twr_KosztUTyp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_CzasWykonania]  DEFAULT ((0)) FOR [Twr_CzasWykonania]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_CzasWykonaniaJedn]  DEFAULT ((0)) FOR [Twr_CzasWykonaniaJedn]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Clo]  DEFAULT ((0)) FOR [Twr_Clo]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PodatekImp]  DEFAULT ((0)) FOR [Twr_PodatekImp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_StanInfoLimit]  DEFAULT ((0)) FOR [Twr_StanInfoLimit]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_StanInfoMax]  DEFAULT ((0)) FOR [Twr_StanInfoMax]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_StanInfoProcent]  DEFAULT ((0)) FOR [Twr_StanInfoProcent]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Aktywna]  DEFAULT ((0)) FOR [Twr_Aktywna]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Wsk]  DEFAULT ((0)) FOR [Twr_Wsk]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_CCKTyp]  DEFAULT ((0)) FOR [Twr_CCKTyp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_CCKFirma]  DEFAULT ((0)) FOR [Twr_CCKFirma]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_CCKNumer]  DEFAULT ((0)) FOR [Twr_CCKNumer]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_CCKLp]  DEFAULT ((0)) FOR [Twr_CCKLp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PrdTyp]  DEFAULT ((0)) FOR [Twr_PrdTyp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PrdFirma]  DEFAULT ((0)) FOR [Twr_PrdFirma]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PrdNumer]  DEFAULT ((0)) FOR [Twr_PrdNumer]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PrdLp]  DEFAULT ((0)) FOR [Twr_PrdLp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OpeTypM]  DEFAULT ((0)) FOR [Twr_OpeTypM]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OpeFirmaM]  DEFAULT ((0)) FOR [Twr_OpeFirmaM]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OpeNumerM]  DEFAULT ((0)) FOR [Twr_OpeNumerM]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OpeLpM]  DEFAULT ((0)) FOR [Twr_OpeLpM]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PCN]  DEFAULT ('') FOR [Twr_PCN]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Notowania]  DEFAULT ((0)) FOR [Twr_Notowania]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_WagaBrutto]  DEFAULT ((0)) FOR [Twr_WagaBrutto]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_WJmBrutto]  DEFAULT ('') FOR [Twr_WJmBrutto]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_StawkaPod]  DEFAULT ((0)) FOR [Twr_StawkaPod]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_FlagaVat]  DEFAULT ((0)) FOR [Twr_FlagaVat]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Zrodlowa]  DEFAULT ((0)) FOR [Twr_Zrodlowa]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_GrupaPodSpr]  DEFAULT ('') FOR [Twr_GrupaPodSpr]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_StawkaPodSpr]  DEFAULT ((0)) FOR [Twr_StawkaPodSpr]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_FlagaVatSpr]  DEFAULT ((0)) FOR [Twr_FlagaVatSpr]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_ZrodlowaSpr]  DEFAULT ((0)) FOR [Twr_ZrodlowaSpr]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Licencja]  DEFAULT ((0)) FOR [Twr_Licencja]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Blokada]  DEFAULT ((0)) FOR [Twr_Blokada]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Archiwalny]  DEFAULT ((0)) FOR [Twr_Archiwalny]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_JMCalkowita]  DEFAULT ((0)) FOR [Twr_JMCalkowita]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Oddzialowy]  DEFAULT ((0)) FOR [Twr_Oddzialowy]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_JmDomyslnaZak]  DEFAULT ((0)) FOR [Twr_JmDomyslnaZak]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_KrajPoch]  DEFAULT ('') FOR [Twr_KrajPoch]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_WspFin]  DEFAULT ((0)) FOR [Twr_WspFin]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PobierzWgCech]  DEFAULT ((0)) FOR [Twr_PobierzWgCech]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Kaucja]  DEFAULT ((0)) FOR [Twr_Kaucja]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_SkNId]  DEFAULT ((0)) FOR [Twr_SkNId]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_RejWyposazenia]  DEFAULT ((0)) FOR [Twr_RejWyposazenia]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OkresGwarancji]  DEFAULT ((0)) FOR [Twr_OkresGwarancji]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_GrupaWyposazenia]  DEFAULT ((0)) FOR [Twr_GrupaWyposazenia]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_ProdTechnologia]  DEFAULT ((0)) FOR [Twr_ProdTechnologia]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_ProdAktualnaWersja]  DEFAULT ((0)) FOR [Twr_ProdAktualnaWersja]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_TwZOdNajwiekszego]  DEFAULT ((0)) FOR [Twr_TwZOdNajwiekszego]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_DataUtworzenia]  DEFAULT ((0)) FOR [Twr_DataUtworzenia]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_WymJm]  DEFAULT ('') FOR [Twr_WymJm]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PartiaDataW]  DEFAULT ((0)) FOR [Twr_PartiaDataW]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_TerminW]  DEFAULT ((0)) FOR [Twr_TerminW]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PartiaDostawa]  DEFAULT ((0)) FOR [Twr_PartiaDostawa]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_NrSeryjnyZCechy]  DEFAULT ((0)) FOR [Twr_NrSeryjnyZCechy]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_ESklep]  DEFAULT ((0)) FOR [Twr_ESklep]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_StawkaKGO]  DEFAULT ((0)) FOR [Twr_StawkaKGO]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_DostawaEAN]  DEFAULT ((0)) FOR [Twr_DostawaEAN]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_MarkaId]  DEFAULT ((0)) FOR [Twr_MarkaId]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_RejestrujUrzadzenie]  DEFAULT ((0)) FOR [Twr_RejestrujUrzadzenie]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_RodzajUrzadzenia]  DEFAULT ((0)) FOR [Twr_RodzajUrzadzenia]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OpisUrzadzenia]  DEFAULT ('') FOR [Twr_OpisUrzadzenia]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_KategoriaABCXYZ]  DEFAULT ('') FOR [Twr_KategoriaABCXYZ]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_RodzajId]  DEFAULT ((0)) FOR [Twr_RodzajId]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_MobSpr]  DEFAULT ((0)) FOR [Twr_MobSpr]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PLM]  DEFAULT ((0)) FOR [Twr_PLM]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_JMBlokujZmiane]  DEFAULT ((0)) FOR [Twr_JMBlokujZmiane]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_AnalizaABCXYZ]  DEFAULT ((0)) FOR [Twr_AnalizaABCXYZ]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Zlom]  DEFAULT ((0)) FOR [Twr_Zlom]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_JMiSklep]  DEFAULT ((0)) FOR [Twr_JMiSklep]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_JMPulpitKnt]  DEFAULT ((0)) FOR [Twr_JMPulpitKnt]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_JMMobSpr]  DEFAULT ((0)) FOR [Twr_JMMobSpr]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_PIADostepnoscFlaga]  DEFAULT ((0)) FOR [Twr_PIADostepnoscFlaga]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_ObowPodSprId]  DEFAULT ((0)) FOR [Twr_ObowPodSprId]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_ObowPodZakId]  DEFAULT ((0)) FOR [Twr_ObowPodZakId]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_RodzajKosztu]  DEFAULT ((0)) FOR [Twr_RodzajKosztu]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_JMDopelnianiaMobSpr]  DEFAULT ((0)) FOR [Twr_JMDopelnianiaMobSpr]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Techniczna1]  DEFAULT ('') FOR [Twr_Techniczna1]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Techniczna2]  DEFAULT ('') FOR [Twr_Techniczna2]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Techniczna3]  DEFAULT ('') FOR [Twr_Techniczna3]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Techniczna4]  DEFAULT ('') FOR [Twr_Techniczna4]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Obcy]  DEFAULT ((0)) FOR [Twr_Obcy]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_TechnicznaDec1]  DEFAULT ((0)) FOR [Twr_TechnicznaDec1]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_MrpId]  DEFAULT ((0)) FOR [Twr_MrpId]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_MrpEoq]  DEFAULT ((0)) FOR [Twr_MrpEoq]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_MrpZaok]  DEFAULT ((0)) FOR [Twr_MrpZaok]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_AutonumeracjaKod]  DEFAULT ('') FOR [Twr_AutonumeracjaKod]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_AutonumeracjaLiczba]  DEFAULT ((0)) FOR [Twr_AutonumeracjaLiczba]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_WysylaniePartiiMobSpr]  DEFAULT ((0)) FOR [Twr_WysylaniePartiiMobSpr]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_DodEleZez]  DEFAULT ((0)) FOR [Twr_DodEleZez]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_KodOdpadu]  DEFAULT ('') FOR [Twr_KodOdpadu]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_MPP]  DEFAULT ((0)) FOR [Twr_MPP]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_GrupaJpk]  DEFAULT ('') FOR [Twr_GrupaJpk]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OplataSpozFlaga]  DEFAULT ((0)) FOR [Twr_OplataSpozFlaga]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_StawkaCukierStala]  DEFAULT ((0)) FOR [Twr_StawkaCukierStala]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_StawkaCukierZmienna]  DEFAULT ((0)) FOR [Twr_StawkaCukierZmienna]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_StawkaKofeina]  DEFAULT ((0)) FOR [Twr_StawkaKofeina]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_ZawartoscCukru]  DEFAULT ((0)) FOR [Twr_ZawartoscCukru]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OplataSpozPrzeliczL]  DEFAULT ((1)) FOR [Twr_OplataSpozPrzeliczL]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OplataSpozPrzeliczM]  DEFAULT ((1)) FOR [Twr_OplataSpozPrzeliczM]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OplataSpozDostawyTyp]  DEFAULT ((0)) FOR [Twr_OplataSpozDostawyTyp]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OplataSpozDostawyFlaga]  DEFAULT ((0)) FOR [Twr_OplataSpozDostawyFlaga]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OplataSpozNrPartii]  DEFAULT ((0)) FOR [Twr_OplataSpozNrPartii]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_OplataSpozNrPartiiAtrybut]  DEFAULT ((0)) FOR [Twr_OplataSpozNrPartiiAtrybut]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_JLogWMS]  DEFAULT ((0)) FOR [Twr_JLogWMS]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_Bon]  DEFAULT ((0)) FOR [Twr_Bon]
GO
ALTER TABLE [CDN].[TwrKarty] ADD  CONSTRAINT [DF_Twr_ZPIAId]  DEFAULT ((0)) FOR [Twr_ZPIAId]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_PrmId]  DEFAULT ((0)) FOR [TPR_PrmId]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_TwrTyp]  DEFAULT ((0)) FOR [TPR_TwrTyp]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_TwrFirma]  DEFAULT ((0)) FOR [TPR_TwrFirma]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_TwrNumer]  DEFAULT ((0)) FOR [TPR_TwrNumer]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_TwrLp]  DEFAULT ((0)) FOR [TPR_TwrLp]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_TwgTyp]  DEFAULT ((0)) FOR [TPR_TwgTyp]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_TwgFirma]  DEFAULT ((0)) FOR [TPR_TwgFirma]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_TwgNumer]  DEFAULT ((0)) FOR [TPR_TwgNumer]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_TwgLp]  DEFAULT ((0)) FOR [TPR_TwgLp]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_Typ]  DEFAULT ((0)) FOR [TPR_Typ]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_Wartosc]  DEFAULT ((0)) FOR [TPR_Wartosc]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_Prog]  DEFAULT ((0)) FOR [TPR_Prog]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_Waluta]  DEFAULT ('') FOR [TPR_Waluta]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_FlagaNB]  DEFAULT ('') FOR [TPR_FlagaNB]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_Notatki]  DEFAULT ('') FOR [TPR_Notatki]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_ZstID]  DEFAULT ((0)) FOR [TPR_ZstID]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_LP]  DEFAULT ((0)) FOR [TPR_LP]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_RodzajCeny]  DEFAULT ((0)) FOR [TPR_RodzajCeny]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_Wymagany]  DEFAULT ((0)) FOR [TPR_Wymagany]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_LimitTyp]  DEFAULT ((0)) FOR [TPR_LimitTyp]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_LimitWartosc]  DEFAULT ((0)) FOR [TPR_LimitWartosc]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_ProgTyp]  DEFAULT ((0)) FOR [TPR_ProgTyp]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_ProgWartosc]  DEFAULT ((0)) FOR [TPR_ProgWartosc]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_LimitRodzaj]  DEFAULT ((0)) FOR [TPR_LimitRodzaj]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_GUID]  DEFAULT (CONVERT([varchar](36),newid())) FOR [TPR_GUID]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_Aktywny]  DEFAULT ((1)) FOR [TPR_Aktywny]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_LastMod]  DEFAULT ((0)) FOR [TPR_LastMod]
GO
ALTER TABLE [CDN].[TwrPromocje] ADD  CONSTRAINT [DF_TPR_OpeMod]  DEFAULT ('') FOR [TPR_OpeMod]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_GIDTyp]  DEFAULT ((0)) FOR [ZaE_GIDTyp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_GIDFirma]  DEFAULT ((0)) FOR [ZaE_GIDFirma]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_GIDNumer]  DEFAULT ((0)) FOR [ZaE_GIDNumer]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_GIDLp]  DEFAULT ((0)) FOR [ZaE_GIDLp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_TwrTyp]  DEFAULT ((0)) FOR [ZaE_TwrTyp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_TwrFirma]  DEFAULT ((0)) FOR [ZaE_TwrFirma]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_TwrNumer]  DEFAULT ((0)) FOR [ZaE_TwrNumer]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_TwrLp]  DEFAULT ((0)) FOR [ZaE_TwrLp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_TwrNazwa]  DEFAULT ('') FOR [ZaE_TwrNazwa]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_TwrKod]  DEFAULT ('') FOR [ZaE_TwrKod]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_KntTyp]  DEFAULT ((0)) FOR [ZaE_KntTyp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_KntFirma]  DEFAULT ((0)) FOR [ZaE_KntFirma]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_KntNumer]  DEFAULT ((0)) FOR [ZaE_KntNumer]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_KntLp]  DEFAULT ((0)) FOR [ZaE_KntLp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_AkwTyp]  DEFAULT ((0)) FOR [ZaE_AkwTyp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_AkwFirma]  DEFAULT ((0)) FOR [ZaE_AkwFirma]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_AkwNumer]  DEFAULT ((0)) FOR [ZaE_AkwNumer]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_AkwLp]  DEFAULT ((0)) FOR [ZaE_AkwLp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_CChTyp]  DEFAULT ((0)) FOR [ZaE_CChTyp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_CChFirma]  DEFAULT ((0)) FOR [ZaE_CChFirma]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_CChNumer]  DEFAULT ((0)) FOR [ZaE_CChNumer]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_CChLp]  DEFAULT ((0)) FOR [ZaE_CChLp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_MagTyp]  DEFAULT ((0)) FOR [ZaE_MagTyp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_MagFirma]  DEFAULT ((0)) FOR [ZaE_MagFirma]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_MagNumer]  DEFAULT ((0)) FOR [ZaE_MagNumer]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_MagLp]  DEFAULT ((0)) FOR [ZaE_MagLp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_TStamp]  DEFAULT ((0)) FOR [ZaE_TStamp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Ilosc]  DEFAULT ((0)) FOR [ZaE_Ilosc]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_JmZ]  DEFAULT ('') FOR [ZaE_JmZ]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_TypJm]  DEFAULT ((0)) FOR [ZaE_TypJm]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_JmFormat]  DEFAULT ((0)) FOR [ZaE_JmFormat]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_JmFormatZ]  DEFAULT ((0)) FOR [ZaE_JmFormatZ]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_PrzeliczM]  DEFAULT ((0)) FOR [ZaE_PrzeliczM]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_PrzeliczL]  DEFAULT ((0)) FOR [ZaE_PrzeliczL]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_GrupaPod]  DEFAULT ('') FOR [ZaE_GrupaPod]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_StawkaPod]  DEFAULT ((0)) FOR [ZaE_StawkaPod]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_FlagaVAT]  DEFAULT ((0)) FOR [ZaE_FlagaVAT]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Zrodlowa]  DEFAULT ((0)) FOR [ZaE_Zrodlowa]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Waluta]  DEFAULT ('') FOR [ZaE_Waluta]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_NrKursu]  DEFAULT ((0)) FOR [ZaE_NrKursu]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Rabat]  DEFAULT ((0)) FOR [ZaE_Rabat]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Cecha]  DEFAULT ('') FOR [ZaE_Cecha]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_CenaKatalogowa]  DEFAULT ((0)) FOR [ZaE_CenaKatalogowa]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_CenaOferowana]  DEFAULT ((0)) FOR [ZaE_CenaOferowana]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_CenaUzgodniona]  DEFAULT ((0)) FOR [ZaE_CenaUzgodniona]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_RodzajCenyBazowej]  DEFAULT ((0)) FOR [ZaE_RodzajCenyBazowej]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_ProgTyp]  DEFAULT ((0)) FOR [ZaE_ProgTyp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Prog]  DEFAULT ((0)) FOR [ZaE_Prog]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_UpustTyp]  DEFAULT ((0)) FOR [ZaE_UpustTyp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Upust]  DEFAULT ((0)) FOR [ZaE_Upust]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_UpustKntTyp]  DEFAULT ((0)) FOR [ZaE_UpustKntTyp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_UpustKnt]  DEFAULT ((0)) FOR [ZaE_UpustKnt]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_ReETyp]  DEFAULT ((0)) FOR [ZaE_ReETyp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_ReEFirma]  DEFAULT ((0)) FOR [ZaE_ReEFirma]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_ReENumer]  DEFAULT ((0)) FOR [ZaE_ReENumer]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_ReELp]  DEFAULT ((0)) FOR [ZaE_ReELp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_ReEProdLp]  DEFAULT ((0)) FOR [ZaE_ReEProdLp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_DataWaznosciRez]  DEFAULT ((0)) FOR [ZaE_DataWaznosciRez]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_WartoscPoRabacie]  DEFAULT ((0)) FOR [ZaE_WartoscPoRabacie]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_DataPotwDst]  DEFAULT ((0)) FOR [ZaE_DataPotwDst]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_DataAktywacjiRez]  DEFAULT ((0)) FOR [ZaE_DataAktywacjiRez]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_DataOdZam]  DEFAULT ((0)) FOR [ZaE_DataOdZam]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_PrecyzjaCeny]  DEFAULT ((0)) FOR [ZaE_PrecyzjaCeny]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Rownanie]  DEFAULT ((0)) FOR [ZaE_Rownanie]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_FlagaNB]  DEFAULT ('') FOR [ZaE_FlagaNB]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Licencja]  DEFAULT ((0)) FOR [ZaE_Licencja]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Pozycja]  DEFAULT ((0)) FOR [ZaE_Pozycja]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_RabatPromocyjny]  DEFAULT ((0)) FOR [ZaE_RabatPromocyjny]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_RabatKorekta]  DEFAULT ((0)) FOR [ZaE_RabatKorekta]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Promocje]  DEFAULT ((0)) FOR [ZaE_Promocje]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_ZstTyp]  DEFAULT ((0)) FOR [ZaE_ZstTyp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_ZstFirma]  DEFAULT ((0)) FOR [ZaE_ZstFirma]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_ZstNumer]  DEFAULT ((0)) FOR [ZaE_ZstNumer]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_ZstLp]  DEFAULT ((0)) FOR [ZaE_ZstLp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_PrecyzjaCenyPocz]  DEFAULT ((0)) FOR [ZaE_PrecyzjaCenyPocz]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_CenaSpr]  DEFAULT ((0)) FOR [ZaE_CenaSpr]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_RodzajDatyRealizacji]  DEFAULT ((0)) FOR [ZaE_RodzajDatyRealizacji]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_KGOJednostkowe]  DEFAULT ((0)) FOR [ZaE_KGOJednostkowe]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_OddElemId]  DEFAULT ((0)) FOR [ZaE_OddElemId]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_IloscMin]  DEFAULT ((0)) FOR [ZaE_IloscMin]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_IloscMax]  DEFAULT ((0)) FOR [ZaE_IloscMax]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_PakietId]  DEFAULT ((0)) FOR [ZaE_PakietId]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Gratis]  DEFAULT ((0)) FOR [ZaE_Gratis]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_PromocjaProgID]  DEFAULT ((0)) FOR [ZaE_PromocjaProgID]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Zlom]  DEFAULT ((0)) FOR [ZaE_Zlom]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_FormatkaCyr]  DEFAULT ((0)) FOR [ZaE_FormatkaCyr]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_KPNId]  DEFAULT ((0)) FOR [ZaE_KPNId]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_TypCenyNabycia]  DEFAULT ((0)) FOR [ZaE_TypCenyNabycia]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_PakietWymaganaPoz]  DEFAULT ((0)) FOR [ZaE_PakietWymaganaPoz]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_PakietTwgNumer]  DEFAULT ((0)) FOR [ZaE_PakietTwgNumer]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_PakietTwgTyp]  DEFAULT ((0)) FOR [ZaE_PakietTwgTyp]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_RabatOpeGen]  DEFAULT ((0)) FOR [ZaE_RabatOpeGen]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_WymuszonePRMID]  DEFAULT ((0)) FOR [ZaE_WymuszonePRMID]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Punkty]  DEFAULT ((0)) FOR [ZaE_Punkty]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_Nagroda]  DEFAULT ((0)) FOR [ZaE_Nagroda]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_ReNNumer]  DEFAULT ((0)) FOR [ZaE_ReNNumer]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_OplataSpozFlaga]  DEFAULT ((0)) FOR [ZaE_OplataSpozFlaga]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_StawkaCukierStala]  DEFAULT ((0)) FOR [ZaE_StawkaCukierStala]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_StawkaCukierZmienna]  DEFAULT ((0)) FOR [ZaE_StawkaCukierZmienna]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_StawkaKofeina]  DEFAULT ((0)) FOR [ZaE_StawkaKofeina]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_JmDzielWZWM]  DEFAULT ((0)) FOR [ZaE_JmDzielWZWM]
GO
ALTER TABLE [CDN].[ZamElem] ADD  CONSTRAINT [DF_ZaE_GUID]  DEFAULT (CONVERT([varchar](36),newid())) FOR [ZaE_GUID]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_GIDTyp]  DEFAULT ((0)) FOR [ZaN_GIDTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_GIDFirma]  DEFAULT ((0)) FOR [ZaN_GIDFirma]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_GIDLp]  DEFAULT ((0)) FOR [ZaN_GIDLp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ZrdTyp]  DEFAULT ((0)) FOR [ZaN_ZrdTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ZrdFirma]  DEFAULT ((0)) FOR [ZaN_ZrdFirma]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ZrdNumer]  DEFAULT ((0)) FOR [ZaN_ZrdNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ZrdLp]  DEFAULT ((0)) FOR [ZaN_ZrdLp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KorTyp]  DEFAULT ((0)) FOR [ZaN_KorTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KorFirma]  DEFAULT ((0)) FOR [ZaN_KorFirma]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KorNumer]  DEFAULT ((0)) FOR [ZaN_KorNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KorLp]  DEFAULT ((0)) FOR [ZaN_KorLp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KntTyp]  DEFAULT ((0)) FOR [ZaN_KntTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KntFirma]  DEFAULT ((0)) FOR [ZaN_KntFirma]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KntNumer]  DEFAULT ((0)) FOR [ZaN_KntNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KntLp]  DEFAULT ((0)) FOR [ZaN_KntLp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnATyp]  DEFAULT ((0)) FOR [ZaN_KnATyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnAFirma]  DEFAULT ((0)) FOR [ZaN_KnAFirma]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnANumer]  DEFAULT ((0)) FOR [ZaN_KnANumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnALp]  DEFAULT ((0)) FOR [ZaN_KnALp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_AkwTyp]  DEFAULT ((0)) FOR [ZaN_AkwTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_AkwFirma]  DEFAULT ((0)) FOR [ZaN_AkwFirma]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_AkwNumer]  DEFAULT ((0)) FOR [ZaN_AkwNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_AkwLp]  DEFAULT ((0)) FOR [ZaN_AkwLp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_AdWTyp]  DEFAULT ((0)) FOR [ZaN_AdWTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_AdwFirma]  DEFAULT ((0)) FOR [ZaN_AdwFirma]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_AdWNumer]  DEFAULT ((0)) FOR [ZaN_AdWNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_AdWLp]  DEFAULT ((0)) FOR [ZaN_AdWLp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_MagTyp]  DEFAULT ((0)) FOR [ZaN_MagTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_MagFirma]  DEFAULT ((0)) FOR [ZaN_MagFirma]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_MagNumer]  DEFAULT ((0)) FOR [ZaN_MagNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_MagLp]  DEFAULT ((0)) FOR [ZaN_MagLp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_FormaNr]  DEFAULT ((0)) FOR [ZaN_FormaNr]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_FormaNazwa]  DEFAULT ('') FOR [ZaN_FormaNazwa]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_FormaRabat]  DEFAULT ((0)) FOR [ZaN_FormaRabat]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_TerminPlatnosci]  DEFAULT ((0)) FOR [ZaN_TerminPlatnosci]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ZamTyp]  DEFAULT ((0)) FOR [ZaN_ZamTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ZamRok]  DEFAULT ((0)) FOR [ZaN_ZamRok]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ZamMiesiac]  DEFAULT ((0)) FOR [ZaN_ZamMiesiac]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ZamSeria]  DEFAULT ('') FOR [ZaN_ZamSeria]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ZamNumer]  DEFAULT ((0)) FOR [ZaN_ZamNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ZamLp]  DEFAULT ((0)) FOR [ZaN_ZamLp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PomTyp]  DEFAULT ((0)) FOR [ZaN_PomTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PomRok]  DEFAULT ((0)) FOR [ZaN_PomRok]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PomMiesiac]  DEFAULT ((0)) FOR [ZaN_PomMiesiac]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PomSeria]  DEFAULT ('') FOR [ZaN_PomSeria]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PomNumer]  DEFAULT ((0)) FOR [ZaN_PomNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PomLp]  DEFAULT ((0)) FOR [ZaN_PomLp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DokumentObcy]  DEFAULT ('') FOR [ZaN_DokumentObcy]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DokumentObcyCharset]  DEFAULT ((0)) FOR [ZaN_DokumentObcyCharset]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DokumentObcyP]  DEFAULT ('') FOR [ZaN_DokumentObcyP]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DokumentObcyPCharset]  DEFAULT ((0)) FOR [ZaN_DokumentObcyPCharset]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ExpoNorm]  DEFAULT ((0)) FOR [ZaN_ExpoNorm]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_Waluta]  DEFAULT ('') FOR [ZaN_Waluta]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_NrKursu]  DEFAULT ((0)) FOR [ZaN_NrKursu]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KursM]  DEFAULT ((0)) FOR [ZaN_KursM]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KursL]  DEFAULT ((0)) FOR [ZaN_KursL]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_TypKursu]  DEFAULT ((0)) FOR [ZaN_TypKursu]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_WspolnaWaluta]  DEFAULT ((0)) FOR [ZaN_WspolnaWaluta]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeTypW]  DEFAULT ((0)) FOR [ZaN_OpeTypW]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeFirmaW]  DEFAULT ((0)) FOR [ZaN_OpeFirmaW]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeNumerW]  DEFAULT ((0)) FOR [ZaN_OpeNumerW]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeLpW]  DEFAULT ((0)) FOR [ZaN_OpeLpW]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeTypM]  DEFAULT ((0)) FOR [ZaN_OpeTypM]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeFirmaM]  DEFAULT ((0)) FOR [ZaN_OpeFirmaM]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeNumerM]  DEFAULT ((0)) FOR [ZaN_OpeNumerM]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeLpM]  DEFAULT ((0)) FOR [ZaN_OpeLpM]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeTypZ]  DEFAULT ((0)) FOR [ZaN_OpeTypZ]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeFirmaZ]  DEFAULT ((0)) FOR [ZaN_OpeFirmaZ]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeNumerZ]  DEFAULT ((0)) FOR [ZaN_OpeNumerZ]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeLpZ]  DEFAULT ((0)) FOR [ZaN_OpeLpZ]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeTypP]  DEFAULT ((0)) FOR [ZaN_OpeTypP]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeFirmaP]  DEFAULT ((0)) FOR [ZaN_OpeFirmaP]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeNumerP]  DEFAULT ((0)) FOR [ZaN_OpeNumerP]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeLpP]  DEFAULT ((0)) FOR [ZaN_OpeLpP]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ID]  DEFAULT ((0)) FOR [ZaN_ID]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_Rabat]  DEFAULT ((0)) FOR [ZaN_Rabat]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_TypRabatu]  DEFAULT ((0)) FOR [ZaN_TypRabatu]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_SpDostawy]  DEFAULT ('') FOR [ZaN_SpDostawy]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_CechaOpis]  DEFAULT ('') FOR [ZaN_CechaOpis]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DataZapytania]  DEFAULT ((0)) FOR [ZaN_DataZapytania]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_RealWCalosci]  DEFAULT ((0)) FOR [ZaN_RealWCalosci]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DataWystawienia]  DEFAULT ((0)) FOR [ZaN_DataWystawienia]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DataRealizacji]  DEFAULT ((0)) FOR [ZaN_DataRealizacji]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DataWaznosci]  DEFAULT ((0)) FOR [ZaN_DataWaznosci]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DataPotwierdz]  DEFAULT ((0)) FOR [ZaN_DataPotwierdz]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DataAkceptacji]  DEFAULT ((0)) FOR [ZaN_DataAkceptacji]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DataOdZam]  DEFAULT ((0)) FOR [ZaN_DataOdZam]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_Stan]  DEFAULT ((0)) FOR [ZaN_Stan]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_Aktywny]  DEFAULT ((0)) FOR [ZaN_Aktywny]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DokZwiazane]  DEFAULT ((0)) FOR [ZaN_DokZwiazane]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_LKopii]  DEFAULT ((0)) FOR [ZaN_LKopii]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_Wsk]  DEFAULT ((0)) FOR [ZaN_Wsk]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSTyp]  DEFAULT ((0)) FOR [ZaN_KnSTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSFirma]  DEFAULT ((0)) FOR [ZaN_KnSFirma]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSNumer]  DEFAULT ((0)) FOR [ZaN_KnSNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSLp]  DEFAULT ((0)) FOR [ZaN_KnSLp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSTypP]  DEFAULT ((0)) FOR [ZaN_KnSTypP]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSFirmaP]  DEFAULT ((0)) FOR [ZaN_KnSFirmaP]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSNumerP]  DEFAULT ((0)) FOR [ZaN_KnSNumerP]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSLpP]  DEFAULT ((0)) FOR [ZaN_KnSLpP]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_Rodzaj]  DEFAULT ((0)) FOR [ZaN_Rodzaj]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PcKID]  DEFAULT ((0)) FOR [ZaN_PcKID]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnDTyp]  DEFAULT ((0)) FOR [ZaN_KnDTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnDFirma]  DEFAULT ((0)) FOR [ZaN_KnDFirma]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnDNumer]  DEFAULT ((0)) FOR [ZaN_KnDNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnDLp]  DEFAULT ((0)) FOR [ZaN_KnDLp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_FiaskoID]  DEFAULT ((0)) FOR [ZaN_FiaskoID]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_RokMiesiac]  DEFAULT ((0)) FOR [ZaN_RokMiesiac]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PotwOferty]  DEFAULT ((0)) FOR [ZaN_PotwOferty]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DataPotwOferty]  DEFAULT ((0)) FOR [ZaN_DataPotwOferty]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeTypPotwOfe]  DEFAULT ((0)) FOR [ZaN_OpeTypPotwOfe]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeFirmaPotwOfe]  DEFAULT ((0)) FOR [ZaN_OpeFirmaPotwOfe]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeNumerPotwOfe]  DEFAULT ((0)) FOR [ZaN_OpeNumerPotwOfe]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeLpPotwOfe]  DEFAULT ((0)) FOR [ZaN_OpeLpPotwOfe]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DataAktywacjiRez]  DEFAULT ((0)) FOR [ZaN_DataAktywacjiRez]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_Url]  DEFAULT ('') FOR [ZaN_Url]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_RabatW]  DEFAULT ((0)) FOR [ZaN_RabatW]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_FrSID]  DEFAULT ((0)) FOR [ZaN_FrSID]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_FlagaNB]  DEFAULT ('') FOR [ZaN_FlagaNB]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeTypMod]  DEFAULT ((0)) FOR [ZaN_OpeTypMod]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeFirmaMod]  DEFAULT ((0)) FOR [ZaN_OpeFirmaMod]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeNumerMod]  DEFAULT ((0)) FOR [ZaN_OpeNumerMod]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeLpMod]  DEFAULT ((0)) FOR [ZaN_OpeLpMod]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OddDokId]  DEFAULT ((0)) FOR [ZaN_OddDokId]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_LastMod]  DEFAULT ((0)) FOR [ZaN_LastMod]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpiTyp]  DEFAULT ((0)) FOR [ZaN_OpiTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpiFirma]  DEFAULT ((0)) FOR [ZaN_OpiFirma]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpiNumer]  DEFAULT ((0)) FOR [ZaN_OpiNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpiLP]  DEFAULT ((0)) FOR [ZaN_OpiLP]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_IncotermsSymbol]  DEFAULT ('') FOR [ZaN_IncotermsSymbol]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_IncotermsMiejsce]  DEFAULT ('') FOR [ZaN_IncotermsMiejsce]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KrajPrzezWys]  DEFAULT ('') FOR [ZaN_KrajPrzezWys]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KodRodzajuTransportu]  DEFAULT ('') FOR [ZaN_KodRodzajuTransportu]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KodRodzajuTransakcji]  DEFAULT ('') FOR [ZaN_KodRodzajuTransakcji]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_Wyslano]  DEFAULT ((0)) FOR [ZaN_Wyslano]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_CenaSpr]  DEFAULT ((0)) FOR [ZaN_CenaSpr]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_GodzinaWystawienia]  DEFAULT ((0)) FOR [ZaN_GodzinaWystawienia]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_GodzinaPotwierdzenia]  DEFAULT ((0)) FOR [ZaN_GodzinaPotwierdzenia]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_Promocje]  DEFAULT ((0)) FOR [ZaN_Promocje]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_RezerwujZasoby]  DEFAULT ((0)) FOR [ZaN_RezerwujZasoby]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PriorytetRez]  DEFAULT ((0)) FOR [ZaN_PriorytetRez]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_RabatPromocyjnyGlobalny]  DEFAULT ((0)) FOR [ZaN_RabatPromocyjnyGlobalny]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnPTyp]  DEFAULT ((0)) FOR [ZaN_KnPTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnPNumer]  DEFAULT ((0)) FOR [ZaN_KnPNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_AdPNumer]  DEFAULT ((0)) FOR [ZaN_AdPNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_MaGDTyp]  DEFAULT ((0)) FOR [ZaN_MaGDTyp]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_MagDNumer]  DEFAULT ((0)) FOR [ZaN_MagDNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KarNumer]  DEFAULT ((0)) FOR [ZaN_KarNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PrjId]  DEFAULT ((0)) FOR [ZaN_PrjId]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSTypOdb]  DEFAULT ((0)) FOR [ZaN_KnSTypOdb]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSFirmaOdb]  DEFAULT ((0)) FOR [ZaN_KnSFirmaOdb]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSNumerOdb]  DEFAULT ((0)) FOR [ZaN_KnSNumerOdb]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSLpOdb]  DEFAULT ((0)) FOR [ZaN_KnSLpOdb]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSTypPlt]  DEFAULT ((0)) FOR [ZaN_KnSTypPlt]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSFirmaPlt]  DEFAULT ((0)) FOR [ZaN_KnSFirmaPlt]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSNumerPlt]  DEFAULT ((0)) FOR [ZaN_KnSNumerPlt]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KnSLpPlt]  DEFAULT ((0)) FOR [ZaN_KnSLpPlt]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_RodzajDatyRealizacji]  DEFAULT ((0)) FOR [ZaN_RodzajDatyRealizacji]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_FrMNumer]  DEFAULT ((0)) FOR [ZaN_FrMNumer]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PromocjePar]  DEFAULT ((0)) FOR [ZaN_PromocjePar]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_RezerwacjeNaNiepotwierdzonym]  DEFAULT ((0)) FOR [ZaN_RezerwacjeNaNiepotwierdzonym]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_StanZapytania]  DEFAULT ((0)) FOR [ZaN_StanZapytania]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OpeNumerPotwZapyt]  DEFAULT ((0)) FOR [ZaN_OpeNumerPotwZapyt]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_GenerujWieleZam]  DEFAULT ((0)) FOR [ZaN_GenerujWieleZam]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_FormatkaCyr]  DEFAULT ((0)) FOR [ZaN_FormatkaCyr]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_WtrID]  DEFAULT ((0)) FOR [ZaN_WtrID]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_WtrProgID]  DEFAULT ((0)) FOR [ZaN_WtrProgID]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DomyslnyDokRealizacja]  DEFAULT ((0)) FOR [ZaN_DomyslnyDokRealizacja]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_DataPromocjiRodzaj]  DEFAULT ((1)) FOR [ZaN_DataPromocjiRodzaj]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_RezZasTylkoAktywne]  DEFAULT ((0)) FOR [ZaN_RezZasTylkoAktywne]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PrzyczynaZW]  DEFAULT ('') FOR [ZaN_PrzyczynaZW]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PodstawaZW]  DEFAULT ((0)) FOR [ZaN_PodstawaZW]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_LimitKredytowy]  DEFAULT ((0)) FOR [ZaN_LimitKredytowy]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_LimitKredytowyKwota]  DEFAULT ((0)) FOR [ZaN_LimitKredytowyKwota]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_LimitKredytowyWaznyDo]  DEFAULT ((0)) FOR [ZaN_LimitKredytowyWaznyDo]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_LimitKredytowyWaluta]  DEFAULT ('') FOR [ZaN_LimitKredytowyWaluta]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_KontrolujIlosciPrzyGenZam]  DEFAULT ((0)) FOR [ZaN_KontrolujIlosciPrzyGenZam]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OplataSpozFlaga]  DEFAULT ((0)) FOR [ZaN_OplataSpozFlaga]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_GUID]  DEFAULT (CONVERT([varchar](36),newid())) FOR [ZaN_GUID]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OperatorPOS]  DEFAULT ((0)) FOR [ZaN_OperatorPOS]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_OstatniaModyfikacjaPOS]  DEFAULT ((0)) FOR [ZaN_OstatniaModyfikacjaPOS]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_ZrodloPochodzeniaESklep]  DEFAULT ((0)) FOR [ZaN_ZrodloPochodzeniaESklep]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_StatusPlatnosciPOS]  DEFAULT ((0)) FOR [ZaN_StatusPlatnosciPOS]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_StatusRealizacji]  DEFAULT ((0)) FOR [ZaN_StatusRealizacji]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_EAN]  DEFAULT ('') FOR [ZaN_EAN]
GO
ALTER TABLE [CDN].[ZamNag] ADD  CONSTRAINT [DF_ZaN_PsAID]  DEFAULT ((0)) FOR [ZaN_PsAID]
GO
CREATE TABLE [CDN].[TwrZasoby](
	[TwZ_DstTyp] [smallint] NULL,
	[TwZ_DstFirma] [int] NULL,
	[TwZ_DstNumer] [int] NOT NULL,
	[TwZ_DstLp] [smallint] NULL,
	[TwZ_TwrTyp] [smallint] NULL,
	[TwZ_TwrFirma] [int] NULL,
	[TwZ_TwrNumer] [int] NULL,
	[TwZ_TwrLp] [smallint] NULL,
	[TwZ_MagTyp] [smallint] NULL,
	[TwZ_MagFirma] [int] NULL,
	[TwZ_MagNumer] [int] NOT NULL,
	[TwZ_MagLp] [smallint] NULL,
	[TwZ_DataP] [int] NULL,
	[TwZ_KsiegowaNetto] [decimal](15, 2) NULL,
	[TwZ_RzeczywistaNetto] [decimal](15, 2) NULL,
	[TwZ_Ean] [varchar](40) NULL,
	[TwZ_Polozenie] [varchar](64) NULL,
	[TwZ_DataW] [int] NULL,
	[TwZ_KosztKsiegowy] [decimal](15, 2) NULL,
	[TwZ_KosztRzeczywisty] [decimal](15, 2) NULL,
	[TwZ_IlSpr] [decimal](15, 4) NULL,
	[TwZ_IlMag] [decimal](15, 4) NULL,
	[TwZ_Ilosc] [decimal](15, 4) NULL,
	[TwZ_IloscWMS] [decimal](15, 4) NULL,
 CONSTRAINT [TwZ_Primary] PRIMARY KEY CLUSTERED 
(
	[TwZ_DstNumer] ASC,
	[TwZ_MagNumer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_DstTyp]  DEFAULT ((0)) FOR [TwZ_DstTyp]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_DstFirma]  DEFAULT ((0)) FOR [TwZ_DstFirma]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_DstNumer]  DEFAULT ((0)) FOR [TwZ_DstNumer]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_DstLp]  DEFAULT ((0)) FOR [TwZ_DstLp]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_TwrTyp]  DEFAULT ((0)) FOR [TwZ_TwrTyp]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_TwrFirma]  DEFAULT ((0)) FOR [TwZ_TwrFirma]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_TwrNumer]  DEFAULT ((0)) FOR [TwZ_TwrNumer]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_TwrLp]  DEFAULT ((0)) FOR [TwZ_TwrLp]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_MagTyp]  DEFAULT ((0)) FOR [TwZ_MagTyp]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_MagFirma]  DEFAULT ((0)) FOR [TwZ_MagFirma]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_MagNumer]  DEFAULT ((0)) FOR [TwZ_MagNumer]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_MagLp]  DEFAULT ((0)) FOR [TwZ_MagLp]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_DataP]  DEFAULT ((0)) FOR [TwZ_DataP]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_KsiegowaNetto]  DEFAULT ((0)) FOR [TwZ_KsiegowaNetto]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_RzeczywistaNetto]  DEFAULT ((0)) FOR [TwZ_RzeczywistaNetto]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_Ean]  DEFAULT ('') FOR [TwZ_Ean]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_Polozenie]  DEFAULT ('') FOR [TwZ_Polozenie]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_DataW]  DEFAULT ((0)) FOR [TwZ_DataW]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_KosztKsiegowy]  DEFAULT ((0)) FOR [TwZ_KosztKsiegowy]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_KosztRzeczywisty]  DEFAULT ((0)) FOR [TwZ_KosztRzeczywisty]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_IlSpr]  DEFAULT ((0)) FOR [TwZ_IlSpr]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_IlMag]  DEFAULT ((0)) FOR [TwZ_IlMag]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_Ilosc]  DEFAULT ((0)) FOR [TwZ_Ilosc]
GO
ALTER TABLE [CDN].[TwrZasoby] ADD  CONSTRAINT [DF_TwZ_IloscWMS]  DEFAULT ((0)) FOR [TwZ_IloscWMS]
GO