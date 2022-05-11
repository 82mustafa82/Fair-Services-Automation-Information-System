Create Proc [SP_Urun_UrunResim_Listele]
AS
BEGIN
Select * From [Urun.UrunResim]
END

GO
Create Proc [SP_Urun_UrunResim_Ekle]
(
@ModelNo int,
@DosyaAdi nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.UrunResim] WHERE  DosyaAdi=@DosyaAdi)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.UrunResim] Values(@ModelNo,@DosyaAdi,@Aciklama)
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Urun_UrunResim_Sil]
(
@ModelNo int
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
DELETE FROM [Urun.UrunResim] Where ModelNo=@ModelNo
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Urun_UrunResim_Guncelle]
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