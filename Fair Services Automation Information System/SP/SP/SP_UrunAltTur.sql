Create Proc [SP_Urun_UrunStok_Listele]
AS
BEGIN
Select * From [Urun.UrunStok]
END

Alter Proc [SP_Urun_AltTur_Listele]
AS
BEGIN
Select * From [Urun.AltTur]
END

exec [SP_Urun_AltTur_Listele]

GO
Create Proc [SP_Urun_UrunStok_Ekle]
(
@ModelNo int,
@BedenID int
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.UrunStok] WHERE  ModelNo=@ModelNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.UrunStok] Values(@ModelNo,@BedenID)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_UrunStok_Ekle] '1', '1'

GO
Create Proc [SP_Urun_UrunStok_Sil]
(
@BarkodNo int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.UrunStok] WHERE  BarkodNo=BarkodNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.UrunStok] Where BarkodNo=BarkodNo
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Urun_Urun_Guncelle]
(
@ModelNo int,
@DosyaAdi nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.UrunResim] WHERE  ModelNo=@ModelNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.UrunResim] Set DosyaAdi=@DosyaAdi,Aciklama=@Aciklama Where ModelNo=@ModelNo
set @Sonuc=1
return @Sonuc
END