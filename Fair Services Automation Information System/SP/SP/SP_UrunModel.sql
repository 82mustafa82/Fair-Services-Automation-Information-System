Create Proc [SP_Urun_Model_Listele]
AS
BEGIN
Select * From [Urun.Model]
END

GO
Create Proc [SP_Urun_Model_Ekle]
(
@ModelNo int,
@ModelAciklama nvarchar(50),
@SezonID int,
@UrunKategoriID int
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.Model] WHERE ModelNo=@ModelNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.Model] Values(@ModelAciklama,@SezonID,@UrunKategoriID)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Model_Ekle]  1, 'asd', 1,1

GO
Create Proc [SP_Urun_Model_Sil]
(
@ModelNo int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Model] WHERE  ModelNo=@ModelNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.Model] Where ModelNo=@ModelNo
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Model_Sil] '1'

GO
Create Proc [SP_Urun_Model_Guncelle]
(
@ModelNo int,
@ModelAciklama nvarchar(50),
@SezonID int,
@UrunKategoriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Model] WHERE  ModelNo=@ModelNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.Model] Set ModelAciklama=@ModelAciklama,SezonID=@SezonID,UrunKategoriID=@UrunKategoriID Where ModelNo=@ModelNo
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Model_Guncelle] 1, 'asd', 1,1