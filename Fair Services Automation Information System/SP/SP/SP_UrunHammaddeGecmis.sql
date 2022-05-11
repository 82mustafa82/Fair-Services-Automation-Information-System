Create Proc [SP_Urun_HammaddeStokGecmis_Listele]
AS
BEGIN
Select * From [Urun.HammaddeStokGecmis]
END

exec [SP_Urun_HammaddeStokGecmis_Listele]

GO
Create Proc [SP_Urun_HammaddeStokGecmis_Ekle]
(
@HammaddeID int,
@DepoCikisTarihi date
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.HammaddeStokGecmis] WHERE  HammaddeID=HammaddeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.HammaddeStokGecmis] Values(@HammaddeID,@DepoCikisTarihi)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_HammaddeStokGecmis_Ekle] '1', '2012-12-12'

GO
Create Proc [SP_Urun_HammaddeStokGecmis_Sil]
(
@HammaddeID int,
@DepoCikisTarihi date
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.HammaddeStokGecmis] WHERE  HammaddeID=@HammaddeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.HammaddeStokGecmis] Where HammaddeID=@HammaddeID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_HammaddeStokGecmis_Sil] 1, '2000-05-13'

GO
Create Proc [SP_Urun_HammaddeStokGecmis_Guncelle]
(
@HammaddeID int,
@DepoCikisTarihi date
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.HammaddeStokGecmis] WHERE  HammaddeID=@HammaddeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.HammaddeStokGecmis] Set DepoCikisTarihi=@DepoCikisTarihi Where HammaddeID=@HammaddeID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_HammaddeStokGecmis_Guncelle] '2', '2012-12-12'