Create Proc [SP_IK_CalisanEmail_Ekle]
(
@TcKimlikNo nvarchar(20),
@Email nvarchar(50)

)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[IK.Calisanlar] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
INSERT INTO [dbo].[IK.CalisanEmailleri] Values(@TcKimlikNo,@Email)
set @Sonuc=1
return @Sonuc
END

exec [SP_IK_CalisanEmail_Ekle] '14596486246','2mustafa2@gmail.com'


go
Create Proc [SP_IK_CalisanEmail_Sil]
(
@TcKimlikNo nvarchar(20),
@Email nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[IK.CalisanEmailleri] WHERE  TcKimlikNo=@TcKimlikNo AND Email=@Email )
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN

DELETE FROM [dbo].[IK.CalisanEmailleri]  Where TcKimlikNo=@TcKimlikNo AND Email=@Email

set @Sonuc=1
return @Sonuc
END

exec [SP_IK_CalisanEmail_Sil] '36575478628','banu.gurbuz@textile.com'


go
Create Proc [SP_IK_CalisanEmail_Guncelle]
(
@TcKimlikNo nvarchar(20),
@Email nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[IK.CalisanEmailleri] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [dbo].[IK.CalisanEmailleri] SET TcKimlikNo=@TcKimlikNo,Email=@Email Where TcKimlikNo=@TcKimlikNo

set @Sonuc=1
return @Sonuc
END

exec [SP_IK_CalisanEmail_Guncelle] '14596486246','banu.gurbuz@textile.com'


Go
Create Proc [SP_IK_CalisanEmail_Listele]

AS

BEGIN
Select * FRom [dbo].[IK.CalisanEmailleri]
END

exec [SP_IK_CalisanEmail_Listele]


Go
Create Proc [SP_IK_CalisanEmail_Listele_TcKimlikNo]
(
@TcKimlikNo nvarchar(20)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[IK.CalisanEmailleri] WHERE  TcKimlikNo=@TcKimlikNo )
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Select * FRom [dbo].[IK.CalisanEmailleri] where TcKimlikNo=@TcKimlikNo
set @Sonuc=1
return @Sonuc
END
