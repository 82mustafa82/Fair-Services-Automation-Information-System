Create Proc [SP_Urun_HammaddeStok_Listele]
AS
BEGIN
Select * From [Urun.HammaddeStok]
END

exec [SP_Urun_HammaddeStok_Listele]

GO
Create Proc [SP_Urun_HammaddeStok_Ekle]
(
@TurID int,
@AltTurID int,
@Miktar int,
@BirimID int,
@RenkID int,
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.HammaddeStok] WHERE  TurID=@TurID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.HammaddeStok] Values(@TurID,@AltTurID,@Miktar,@BirimID,@RenkID,@Aciklama)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_HammaddeStok_Ekle] '1', '9', '1', '3' , '1' , 'asdasdasd'

GO
Create Proc [SP_Urun_HammaddeStok_Sil]
(
@HammaddeID int,
@TurID int,
@AltTurID int,
@Miktar int,
@BirimID int,
@RenkID int,
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.HammaddeStok] WHERE  HammaddeID=@HammaddeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.HammaddeStok] Where HammaddeID=@HammaddeID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_HammaddeStok_Sil] 1,1,14,350,3,12,'Kaþmir Kumaþ Kahve'

GO
Create Proc [SP_Urun_HammaddeStok_Guncelle]
(
@HammaddeID int,
@TurID int,
@AltTurID int,
@Miktar int,
@BirimID int,
@RenkID int,
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.HammaddeStok] WHERE  HammaddeID=@HammaddeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.HammaddeStok] Set TurID=@TurID,AltTurID=@AltTurID,Miktar=@Miktar,BirimID=@BirimID,RenkID=@RenkID,Aciklama=@Aciklama Where BirimID=@BirimID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_HammaddeStok_Guncelle] 1,1,9,12,3,1,'asd'