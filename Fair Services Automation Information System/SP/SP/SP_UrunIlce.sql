Create Proc [SP_Urun_Ilce_Listele]
AS
BEGIN
Select * From [Urun.Ilce]
END

exec [SP_Urun_Ilce_Listele]

GO
Create Proc [SP_Urun_Ilce_Ekle]
(
@IlceAdi nvarchar(50),
@IlID int
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.Ilce] WHERE  IlceAdi=@IlceAdi)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.Ilce] Values(@IlceAdi,@IlID)
set @Sonuc=1
return @Sonuc
END

exec  [SP_Urun_Ilce_Ekle] 'asd', 34

GO
Create Proc [SP_Urun_Ilce_Sil]
(
@IlceID int,
@IlceAdi nvarchar(50),
@IlID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Ilce] WHERE  IlceID=@IlceID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.Ilce] Where IlceID=@IlceID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Ilce_Sil] 1962, 'asd', 34

GO
Create Proc [SP_Urun_Ilce_Guncelle]
(
@IlceID int,
@IlID int,
@IlceAdi nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Ilce] WHERE  IlceID=@IlceID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.Ilce] Set IlceAdi=@IlceAdi,IlID=@IlID Where IlceID=@IlceID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Ilce_Guncelle] 4, 1, 'IMAMOGLOU'