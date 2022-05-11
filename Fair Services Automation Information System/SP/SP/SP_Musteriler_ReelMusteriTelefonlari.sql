Create Proc [SP_Musteriler_ReelMusteriTelefonlari_Listele]
AS
BEGIN
Select * From [Musteriler.ReelMusteriTelefonlari]
END

exec [SP_Musteriler_ReelMusteriTelefonlari_Listele]

Go
Create Proc [SP_Musteriler_ReelMusteriTelefonlari_Listele_ID]
(
@ReelMusteriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.ReelMusteriTelefonlari] WHERE  ReelMusteriID=@ReelMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Select * From [Musteriler.ReelMusteriTelefonlari]
Where ReelMusteriID=@ReelMusteriID
set @Sonuc=1
return @Sonuc
END
GO

exec [SP_Musteriler_ReelMusteriTelefonlari_Listele_ID]

Create Proc [SP_Musteriler_ReelMusteriTelefonlari_Ekle]
(
@ReelMusteriID int,
@Telefon nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.ReelMusteriTelefonlari] WHERE  ReelMusteriID=@ReelMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Insert Into [Musteriler.ReelMusteriTelefonlari] Values(@ReelMusteriID,@Telefon)
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_ReelMusteriTelefonlari_Ekle] '5344123166'


GO
Create Proc [SP_Musteriler_ReelMusteriTelefonlari_Guncelle]
(
@ReelMusteriID int,
@Telefon nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.ReelMusteriTelefonlari] WHERE  ReelMusteriID=@ReelMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Update [Musteriler.ReelMusteriTelefonlari] Set   Telefon=@Telefon where ReelMusteriID=@ReelMusteriID
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_ReelMusteriTelefonlari_Guncelle] '4', '5345605046'

GO
Create Proc [SP_Musteriler_ReelMusteriTelefonlari_Sil]
(
@ReelMusteriID int,
@Telefon nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.ReelMusteriTelefonlari] WHERE  ReelMusteriID=@ReelMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [Musteriler.ReelMusteriTelefonlari] where  ReelMusteriID=@ReelMusteriID AND Telefon=@Telefon
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_ReelMusteriTelefonlari_Sil] '4', '5345605046'


