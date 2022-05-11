Create Proc [SP_Urun_UrunSubeStokGecmis_Listele]
AS
BEGIN
Select * From [Urun.UrunSubeStokGecmis]
END

exec [SP_Urun_UrunSubeStokGecmis_Listele]

GO
Create Proc [SP_Urun_UrunSubeStokGecmis_Ekle]
(
@BarkodNo int,
@SubeID int,
@UrunDepoCikisTarihi date
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.UrunSubeStokGecmis] WHERE  BarkodNo=@BarkodNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.UrunSubeStokGecmis] Values(@BarkodNo,@SubeID,@UrunDepoCikisTarihi)
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Urun_UrunSubeStokGecmis_Sil]
(
@BarkodNo int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.UrunSubeStokGecmis] WHERE  BarkodNo=@BarkodNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.UrunSubeStokGecmis] Where BarkodNo=@BarkodNo
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Urun_UrunSubeStokGecmis_Guncelle]
(
@BarkodNo int,
@SubeID int,
@UrunDepoCikisTarihi date
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.UrunSubeStokGecmis] WHERE  BarkodNo=@BarkodNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.UrunSubeStokGecmis] Set SubeID=@SubeID,UrunDepoCikisTarihi=@UrunDepoCikisTarihi Where  BarkodNo=@BarkodNo
set @Sonuc=1
return @Sonuc
END