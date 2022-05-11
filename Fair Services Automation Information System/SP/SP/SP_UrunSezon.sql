Create Proc [SP_Urun_Sezon_Listele]
AS
BEGIN
Select * From [Urun.Sezon]
END

exec [SP_Urun_Sezon_Listele]

GO
Create Proc [SP_Urun_Sezon_Ekle]
(
@SezonAdi nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.Sezon] WHERE SezonAdi=@SezonAdi)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.Sezon] Values(@SezonAdi)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Sezon_Ekle] 'asd'

GO
Create Proc [SP_Urun_Sezon_Sil]
(
@SezonID int,
@SezonAdi nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Sezon] WHERE  SezonID=@SezonID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.Sezon] Where SezonID=@SezonID
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Urun_Sezon_Guncelle]
(
@SezonID int,
@SezonAdi nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Sezon] WHERE  SezonID=@SezonID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.Sezon] Set @SezonAdi=@SezonAdi Where SezonID=@SezonID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Sezon_Guncelle] 5, 'qwe'