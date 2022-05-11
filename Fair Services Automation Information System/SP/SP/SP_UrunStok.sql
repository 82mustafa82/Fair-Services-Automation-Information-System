Create Proc [SP_Urun_UrunStok_Listele]
AS
BEGIN
Select * From [Urun.UrunStok]
END

exec [SP_Urun_UrunStok_Listele]

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

exec [SP_Urun_UrunStok_Ekle] 1,1

GO
Create Proc [SP_Urun_UrunStok_Sil]
(
@BarkodNo int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.UrunStok] WHERE  BarkodNo=@BarkodNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.UrunStok] Where BarkodNo=@BarkodNo
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_UrunStok_Sil] 1

GO
Create Proc [SP_Urun_UrunStok_Guncelle]
(
@BarkodNo int,
@ModelNo int,
@BedenID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.UrunStok] WHERE  BarkodNo=@BarkodNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.UrunStok] Set ModelNo=@ModelNo,BedenID=@BedenID Where BarkodNo=@BarkodNo
set @Sonuc=1
return @Sonuc
END