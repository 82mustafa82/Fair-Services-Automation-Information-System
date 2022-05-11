Create Proc [SP_Urun_Tur_Listele]
AS
BEGIN
Select * From [Urun.Tur]
END

exec [SP_Urun_Tur_Listele]

GO
Create Proc [SP_Urun_Tur_Ekle]
(
@Tur nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.Tur] WHERE Tur=@Tur)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.Tur] Values(@Tur,@Aciklama)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Tur_Ekle] 'asd','asd'

GO
Create Proc [SP_Urun_Tur_Sil]
(
@TurID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Tur] WHERE  TurID=@TurID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.Tur] Where TurID=@TurID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Tur_Sil] 3

GO
Create Proc [SP_Urun_Tur_Guncelle]
(
@TurID int,
@Tur nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Tur] WHERE  TurID=@TurID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.Tur] Set Tur=@Tur,Aciklama=@Aciklama Where TurID=@TurID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Tur_Guncelle] 2, 'asd','asd'