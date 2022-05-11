Create Proc [SP_Urun_Sube_Listele]
AS
BEGIN
Select * From [Urun.Sube]
END

exec [SP_Urun_Sube_Listele]

GO
Create Proc [SP_Urun_Sube_Ekle]
(
@IlID int,
@IlceID int,
@SubeAdi nvarchar(50),
@Telefon nvarchar(50),
@Adres nvarchar(250),
@Email nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.Sube] WHERE SubeAdi=@SubeAdi)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.Sube] Values(@IlID,@IlceID,@SubeAdi,@Telefon,@Adres,@Email,@Aciklama)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Sube_Ekle] 1,1,'asd','asd','asd','asd','asd'

GO
Create Proc [SP_Urun_Sube_Sil]
(
@SubeID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Sube] WHERE  SubeID=@SubeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.Sube] Where  SubeID=@SubeID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Sube_Sil] 12

GO
Create Proc [SP_Urun_Sube_Guncelle]
(
@SubeID int, 
@IlID int,
@IlceID int,
@SubeAdi nvarchar(50),
@Telefon nvarchar(50),
@Adres nvarchar(250),
@Email nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Sube] WHERE  SubeID=@SubeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.Sube] Set IlID=@IlID,IlceID=@IlceID,SubeAdi=@SubeAdi,Telefon=@Telefon,Adres=@Adres,Email=@Email,Aciklama=@Aciklama Where SubeID=@SubeID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Sube_Guncelle] 1,1,1,'asd','asd','asd','asd','asd'