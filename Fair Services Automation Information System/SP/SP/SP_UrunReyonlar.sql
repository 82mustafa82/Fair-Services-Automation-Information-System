Create Proc [SP_Urun_Reyonlar_Listele]
AS
BEGIN
Select * From [Urun.Reyonlar]
END

exec [SP_Urun_Reyonlar_Listele]

GO
Create Proc [SP_Urun_Reyonlar_Ekle]
(
@Reyon nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.Reyonlar] WHERE  Reyon=@Reyon)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.Reyonlar] Values(@Reyon,@Aciklama)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Reyonlar_Ekle] 'asd','asdasdasd'

GO
Create Proc [SP_Urun_Reyonlar_Sil]
(
@ReyonID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Reyonlar] WHERE ReyonID=@ReyonID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.Reyonlar] Where  ReyonID=@ReyonID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Reyonlar_Sil] 7

GO
Create Proc [SP_Urun_Reyonlar_Guncelle]
(
@ReyonID int,
@Reyon nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Reyonlar] WHERE  ReyonID=@ReyonID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.Reyonlar] Set Reyon=@Reyon,Aciklama=@Aciklama Where ReyonID=@ReyonID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Reyonlar_Guncelle] 1, 'asd','asdasdasd'