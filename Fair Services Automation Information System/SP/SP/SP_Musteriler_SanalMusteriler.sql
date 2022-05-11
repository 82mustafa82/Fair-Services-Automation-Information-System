Create Proc [SP_Musteriler_SanalMusteriler_Listele]
AS
BEGIN
Select SM.SanalMusteriID, SM.SMAd, SM.SMSoyad, SM.Email , SM.Adres, IL.IlAdi, IC.IlceAdi, SM.DogumTarihi, MG.Soru, SM.Cevap From [Musteriler.SanalMusteriler] SM
INNER JOIN [Urun.Il] IL on SM.IlID=IL.IlID 
INNER JOIN [Urun.Ilce] IC on SM.IlceID=IC.IlceID
INNER JOIN [Musteriler.GizliSorular] MG on SM.GizliSoruID=MG.GizliSoruID
END

exec [SP_Musteriler_SanalMusteriler_Listele]

Go
alter Proc [SP_Musteriler_SanalMusteriler_Ekle]
(
@SMAd nvarchar(50),
@SMSoyad nvarchar(50),
@Email nvarchar(50),
@Adres nvarchar(250),
@IID int,
@IlceID int,
@DogumTarihi date,
@GizliSoruID nvarchar(50),
@Cevap nvarchar(50)
)
AS
BEGIN
INSERT INTO [Musteriler.SanalMusteriler](SMAd,SMSoyad,Email,Adres,IlID,IlceID,DogumTarihi,GizliSoruID,Cevap) Values(@SMAd,@SMSoyad,@Email,@Adres,@IID,@IlceID,@DogumTarihi,@GizliSoruID,@Cevap)
END

exec [SP_Musteriler_SanalMusteriler_Ekle] 'asd', 'asd', 'asd', 'asd', '12', '1', '2012-12-12', '1', 'asd'

GO
Create Proc [SP_Musteriler_SanalMusteriler_Guncelle]
(
@SanalMusteriID int,
@SMAd nvarchar(50),
@SMSoyad nvarchar(50),
@Email nvarchar(50),
@Adres nvarchar(250),
@IID int,
@IlceID int,
@DogumTarihi date,
@GizliSoruID int,
@Cevap nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[Musteriler.SanalMusteriler] WHERE  SanalMusteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [Musteriler.SanalMusteriler] SET SMAd=@SMAd,SMSoyad=@SMSoyad,Email=@Email,Adres=@Adres,IlID=@IID,IlceID=@IlceID,DogumTarihi=@DogumTarihi,GizliSoruID=@GizliSoruID,Cevap=@Cevap
where SanalMusteriID=@SanalMusteriID
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_SanalMusteriler_Guncelle] '3', 'qwe', 'qwe', 'qwe', 'qwe', '23', '2', '2011-11-11', '2', 'asd'


Go
Alter Proc [[SP_Musteriler_SanalMusteriler_Guncelle]]
(
@SanalMusteriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.SanalMusteriler] WHERE  SanalMusteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [Musteriler.SanalMusteriler]  
where SanalMusteriID=@SanalMusteriID
DELETE FROM [Musteriler.SanalMusteriTelefonlari] Where SanalMüsteriID=@SanalMusteriID
set @Sonuc=1
return @Sonuc
END