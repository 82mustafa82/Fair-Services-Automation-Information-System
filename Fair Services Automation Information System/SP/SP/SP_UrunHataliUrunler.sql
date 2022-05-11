Create Proc [SP_Urun_HataliUrunler_Listele]
AS
BEGIN
Select * From [Urun.HataliUrunler]
END

exec [SP_Urun_HataliUrunler_Listele]

GO
Create Proc [SP_Urun_HataliUrunler_Ekle]
(
@BarkodNo int,
@HataTanimi nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.HataliUrunler] WHERE  BarkodNo=@BarkodNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.HataliUrunler] Values(@BarkodNo,@HataTanimi)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_HataliUrunler_Ekle] 1,'asd'

GO
Create Proc [SP_Urun_HataliUrunler_Sil]
(
@BarkodNo int,
@SubeID int,
@HataTanimi nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.HataliUrunler] WHERE  BarkodNo=@BarkodNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.HataliUrunler] Where BarkodNo=@BarkodNo
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_HataliUrunler_Sil] 1,1,'asd'

GO
Create Proc [SP_Urun_HataliUrunler_Guncelle]
(
@BarkodNo int,
@HataTanimi nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.HataliUrunler] WHERE  BarkodNo=@BarkodNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.HataliUrunler] Set HataTanimi=@HataTanimi Where BarkodNo=@BarkodNo
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_HataliUrunler_Guncelle] 4, 'asd'