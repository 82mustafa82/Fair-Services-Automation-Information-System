Create Proc [SP_SatinAlma_TedarikciTelefonlari_Listele]
AS
BEGIN
Select SAT.TedarikciID, SAT.FirmaAdi,SAT.SorumluKisi,SAT.Unvani,SAT.FirmaAdres,SADT.Telefon From [SatinAlma.TedarikciTelefonlari] SADT
inner join [SatinAlma.Tedarikciler] SAT on SADT.TedarikciID=SAT.TedarikciID
END

exec [SP_SatinAlma_TedarikciTelefonlari_Listele]


go
Create Proc [SP_SatinAlma_TedarikciTelefonlari_Ekle]
(
@TedarikciID int,
@Telefon nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [SatinAlma.Tedarikciler] WHERE  TedarikciID=@TedarikciID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
INSERT INTO [SatinAlma.TedarikciTelefonlari] Values(@TedarikciID,@Telefon)
set @Sonuc=1
return @Sonuc
END

exec [SP_SatinAlma_TedarikciTelefonlari_Ekle] '1', '5343542144'



go
Create Proc [SP_SatinAlma_TedarikciTelefonlari_Guncelle]
(
@TedarikciID int,
@Telefon nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [SatinAlma.Tedarikciler] WHERE  TedarikciID=@TedarikciID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [SatinAlma.TedarikciTelefonlari] SET TedarikciID=@TedarikciID,Telefon=@Telefon
set @Sonuc=1
return @Sonuc
END

exec [SP_SatinAlma_TedarikciTelefonlari_Guncelle] '1', '5340666313'