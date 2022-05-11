Create Proc [SP_Urun_Birim_Listele]
AS
BEGIN
Select * From [Urun.Birim]
END

exec [SP_Urun_Birim_Listele]

GO
Create Proc [SP_Urun_Birim_Ekle]
(
@Birim nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.Birim] WHERE  Birim=@Birim)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.Birim] Values(@Birim,@Aciklama)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Birim_Ekle] 'asd', 'asd'

GO
Create Proc [SP_Urun_Birim_Sil]
(
@BirimID int,
@Birim nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Birim] WHERE  BirimID=@BirimID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.Birim] Where BirimID=@BirimID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Birim_Sil] '6', 'asd', 'asd'

GO
Create Proc [SP_Urun_Birim_Guncelle]
(
@BirimID int,
@Birim nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Birim] WHERE  BirimID=@BirimID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.Birim] Set Birim=@Birim,Aciklama=@Aciklama Where BirimID=@BirimID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Birim_Guncelle] '2', 'qwe', 'qwe'