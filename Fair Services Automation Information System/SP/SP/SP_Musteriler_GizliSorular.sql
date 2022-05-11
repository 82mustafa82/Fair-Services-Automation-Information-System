create Proc [SP_Musteriler_GizliSorular_Listele]
AS
BEGIN
Select * From [Musteriler.GizliSorular]
END

exec [SP_Musteriler_GizliSorular_Listele]

GO
Create Proc [SP_Musteriler_GizliSorular_Ekle]
(
@Soru nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Musteriler.GizliSorular] WHERE  Soru=@Soru)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Musteriler.GizliSorular] Values(@Soru,@Aciklama)
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_GizliSorular_Ekle] 'asdasdasd', 'asdasdasd'

GO
Create Proc [SP_Musteriler_GizliSorular_Sil]
(
@GizliSoruID int,
@Soru nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.GizliSorular] WHERE  GizliSoruID=@GizliSoruID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Musteriler.GizliSorular] Where GizliSoruID=@GizliSoruID
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_GizliSorular_Sil] '6', 'asdasdasd', 'asdasdasd'


GO
Create Proc [SP_Musteriler_GizliSorular_Guncelle]
(
@GizliSoruID int,
@Soru nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.GizliSorular] WHERE  GizliSoruID=@GizliSoruID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Musteriler.GizliSorular] Set Soru=@Soru,Aciklama=@Aciklama Where GizliSoruID=@GizliSoruID
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_GizliSorular_Guncelle] '1', 'asdasdasd', 'asdasdasd'