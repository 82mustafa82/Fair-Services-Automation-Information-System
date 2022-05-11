Create Proc [SP_SatinAlma_HammaddeAlimi_Listele]
AS
BEGIN
Select SAT.TedarikciID, SAT.FirmaAdi,SAT.SorumluKisi,SAT.Unvani,SAT.FirmaAdres,SADT.Telefon From [SatinAlma.TedarikciTelefonlari] SADT
inner join [SatinAlma.Tedarikciler] SAT on SADT.TedarikciID=SAT.TedarikciID
END

exec [SP_SatinAlma_HammaddeAlimi_Listele]

go
Create Proc [SP_SatinAlma_HammaddeAlimi_Ekle]
(
@HammaddeID int,
@Fiyat money,
@Miktar int,
@AlimTarihi date,
@TedarikciID int,
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [SatinAlma.Tedarikciler] WHERE  TedarikciID=@TedarikciID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM [Urun.HammaddeStok] WHERE HammaddeID=@HammaddeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
INSERT INTO [SatinAlma.HammaddeAlimi] Values(@HammaddeID,@Fiyat,@Miktar,@AlimTarihi,@TedarikciID,@Aciklama)
set @Sonuc=1
return @Sonuc
END

exec [SP_SatinAlma_HammaddeAlimi_Ekle] '1', '12', '12', '2012-12-12','1', 'asdasdasd'

go
Create Proc [SP_SatinAlma_HammaddeAlimi_Guncelle]
(
@HammaddeFaturaNo int,
@HammaddeID int,
@Fiyat money,
@Miktar int,
@AlimTarihi date,
@TedarikciID int,
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [SatinAlma.Tedarikciler] WHERE  TedarikciID=@TedarikciID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM [Urun.HammaddeStok] WHERE HammaddeID=@HammaddeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM [SatinAlma.HammaddeAlimi] WHERE HammaddeFaturaNo=@HammaddeFaturaNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [SatinAlma.HammaddeAlimi] SET HammaddeID=@HammaddeID,Fiyat=@Fiyat,Miktar=@Miktar,AlimTarihi=@AlimTarihi,TedarikciID=@TedarikciID,Aciklama=@Aciklama
set @Sonuc=1
return @Sonuc
END

exec [SP_SatinAlma_HammaddeAlimi_Guncelle] '1', '12', '12', '2012-12-12','1', 'asdasdasd'


go
Create Proc [SP_SatinAlma_HammaddeAlimi_Sil]
(
@HammaddeFaturaNo int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [SatinAlma.HammaddeAlimi] WHERE HammaddeFaturaNo=@HammaddeFaturaNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [SatinAlma.HammaddeAlimi] Where HammaddeFaturaNo=@HammaddeFaturaNo
set @Sonuc=1
return @Sonuc
END

exec [SP_SatinAlma_HammaddeAlimi_Sil] '1'
