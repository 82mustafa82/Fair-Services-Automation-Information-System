Create Proc [SP_Urun_Beden_Listele]
AS
BEGIN
Select * From [Urun.Beden]
END

exec [SP_Urun_Beden_Listele]

GO
Create Proc [SP_Urun_Beden_Ekle]
(
@Beden nvarchar(50),
@NumerikMi bit,
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.Beden] WHERE  Beden=@Beden)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.Beden] Values(@Beden, @NumerikMi,@Aciklama)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Beden_Ekle] 'asd', 1, 'asd'

GO
Create Proc [SP_Urun_Beden_Sil]
(
@BedenID int,
@Beden nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Beden] WHERE  BedenID=@BedenID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.Beden] Where BedenID=@BedenID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Beden_Sil] '22', 'asd'

GO
Create Proc [SP_Urun_Beden_Guncelle]
(
@BedenID int,
@Beden nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Beden] WHERE  BedenID=@BedenID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.Beden] Set Beden=@Beden Where BedenID=@BedenID
set @Sonuc=1
return @Sonuc
END
exec [SP_Urun_Beden_Ekle] 'asd', 1, 'qwe'