Create Proc [SP_Musteriler_KullaniciBilgileri_Listele]
AS
BEGIN
Select * From [Musteriler.KullaniciBilgileri]
END

exec [SP_Musteriler_KullaniciBilgileri_Listele]

Go
Create Proc [SP_Musteriler_KullaniciBilgileri_Listele_ID]
(
@SanalMusteriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.KullaniciBilgileri] WHERE  SanalMusteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Select * From [Musteriler.KullaniciBilgileri]
Where SanalMusteriID=@SanalMusteriID
set @Sonuc=1
return @Sonuc
END
GO


alter Proc [SP_Musteriler_KullaniciBilgileri_Ekle]
(
@SanalMusteriID int,
@KullaniciAdi nvarchar(50),
@KullaniciSifresi nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[Musteriler.KullaniciBilgileri] WHERE  SanalMusteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Insert Into [dbo].[Musteriler.KullaniciBilgileri] Values(@SanalMusteriID,@KullaniciAdi,@KullaniciSifresi)
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_KullaniciBilgileri_Ekle] '2', 'asd', 'asd'


GO
alter Proc [SP_Musteriler_KullaniciBilgileri_Guncelle]
(
@SanalMusteriID int,
@KullaniciAdi nvarchar(50),
@KullaniciSifresi nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.KullaniciBilgileri] WHERE  SanalMusteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Update [Musteriler.KullaniciBilgileri] Set   KullaniciAdi=@KullaniciAdi,KullaniciSifresi=@KullaniciSifresi Where SanalMusteriID=@SanalMusteriID
set @Sonuc=1
return @Sonuc
END


GO
Create Proc [SP_Musteriler_KullaniciBilgileri_Sil]
(
@SanalMusteriID int,
@KullaniciAdi nvarchar(50),
@KullaniciSifresi nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.KullaniciBilgileri] WHERE  SanalMusteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [Musteriler.KullaniciBilgileri] where  SanalMusteriID=@SanalMusteriID 
set @Sonuc=1
return @Sonuc
END


