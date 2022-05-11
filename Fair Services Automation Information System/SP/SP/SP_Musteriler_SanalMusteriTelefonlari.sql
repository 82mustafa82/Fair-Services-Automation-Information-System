alter Proc [SP_Musteriler_SanalMusteriTelefonlari_Listele]
AS
BEGIN
Select * From [Musteriler.SanalMusteriTelefonlari]
END

exec [SP_Musteriler_SanalMusteriTelefonlari_Listele]

Go
Alter Proc [SP_Musteriler_SanalMusteriTelefonlari_Listele_ID]
(
@SanalMusteriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.SanalMusteriTelefonlari] WHERE  SanalMüsteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Select * From [Musteriler.SanalMusteriTelefonlari]
Where SanalMüsteriID=@SanalMusteriID
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_SanalMusteriTelefonlari_Listele_ID]

GO
alter Proc [SP_Musteriler_SanalMusteriTelefonlari_Ekle]
(
@SanalMusteriID int,
@Telefon nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.SanalMusteriTelefonlari] WHERE  SanalMüsteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Insert Into [Musteriler.SanalMusteriTelefonlari] Values(@SanalMusteriID,@Telefon)
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_SanalMusteriTelefonlari_Ekle] '2', '5363565646'

GO
alter Proc [SP_Musteriler_SanalMusteriTelefonlari_Guncelle]
(
@SanalMusteriID int,
@Telefon nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.SanalMusteriTelefonlari] WHERE  SanalMüsteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Update [Musteriler.SanalMusteriTelefonlari] Set   Telefon=@Telefon Where SanalMüsteriID=@SanalMusteriID
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Musteriler_SanalMusteriTelefonlari_Sil]
(
@SanalMusteriID int,
@Telefon nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.SanalMusteriTelefonlari] WHERE  SanalMüsteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [Musteriler.SanalMusteriTelefonlari] where  SanalMüsteriID=@SanalMusteriID AND Telefon=@Telefon
set @Sonuc=1
return @Sonuc
END


