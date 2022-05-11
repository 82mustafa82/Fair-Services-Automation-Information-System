Create Proc [SP_Musteriler_SanalMusteriKrediKartlari_Listele]
AS
BEGIN
Select SMK.KrediKartiID, Mk.KartTipi, MK.KartNumarasi,MK.GecerlilikAyi,MK.GecerlilikYili,MKB.KullaniciAdi,MKB.KullaniciSifresi, MKB.SanalMusteriID From [Musteriler.SanalMusteriKrediKartlari] SMK
inner join [Musteriler.KrediKartlari] MK on SMK.KrediKartiID=MK.KrediKartiID
inner join [Musteriler.KullaniciBilgileri] MKB on SMK.SanalMusteriID=MKB.SanalMusteriID
END

exec [SP_Musteriler_SanalMusteriKrediKartlari_Listele]

Go 
Create Proc [SP_Musteriler_SanalMusteriKrediKartlari_Ekle]
(
@KrediKartiID int,
@SanalMusteriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.SanalMusteriKrediKartlari] WHERE  KrediKartiID=@KrediKartiID AND SanalMusteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
INSERT INTO [Musteriler.SanalMusteriKrediKartlari] Values(@KrediKartiID,@SanalMusteriID)
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_SanalMusteriKrediKartlari_Ekle] '2'

Go
Create Proc [SP_Musteriler_SanalMusteriKrediKartlari_Sil]
(
@KrediKartiID int,
@SanalMusteriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.SanalMusteriKrediKartlari] WHERE  KrediKartiID=@KrediKartiID AND SanalMusteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [Musteriler.SanalMusteriKrediKartlari] Where KrediKartiID=@KrediKartiID AND SanalMusteriID=@SanalMusteriID
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_SanalMusteriKrediKartlari_Sil] 

