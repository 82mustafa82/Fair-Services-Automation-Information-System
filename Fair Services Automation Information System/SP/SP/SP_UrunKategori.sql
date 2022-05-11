Create Proc [SP_Urun_UrunKategori_Listele]
AS
BEGIN
Select * From [Urun.UrunKategori]
END

GO
Create Proc [SP_Urun_UrunKategori_Ekle]
(
@UrunKategoriAdi nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.UrunKategori] WHERE  UrunKategoriAdi=@UrunKategoriAdi)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.UrunKategori] Values(@UrunKategoriAdi)
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Urun_UrunKategori_Sil]
(
@UrunKategoriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.UrunKategori] WHERE  UrunKategoriID=@UrunKategoriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.UrunKategori] Where  UrunKategoriID=@UrunKategoriID
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Urun_UrunKategori_Guncelle]
(
@UrunKategoriID int,
@UrunKategoriAdi nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.UrunKategori] WHERE  UrunKategoriID=@UrunKategoriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.UrunKategori] Set UrunKategoriAdi=@UrunKategoriAdi Where UrunKategoriID=@UrunKategoriID
set @Sonuc=1
return @Sonuc
END