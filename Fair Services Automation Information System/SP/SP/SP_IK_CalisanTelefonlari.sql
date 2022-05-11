Create Proc [SP_IK_CalisanTelefonlari_Ekle]
(
@TcKimlikNo nvarchar(20),
@Telefon nvarchar(50)

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
INSERT INTO [IK.CalisanTelefonlari](TcKimlikNo,Telefon) Values(@TcKimlikNo,@Telefon)
set @Sonuc=1
return @Sonuc
END

exec [SP_IK_CalisanTelefonlari_Ekle] '14596486246', '5343542144'

go
Create Proc [SP_IK_CalisanTelefonlari_Sil]
(
@TcKimlikNo nvarchar(20),
@Telefon nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[IK.CalisanTelefonlari] WHERE  TcKimlikNo=@TcKimlikNo AND Telefon=@Telefon )
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN

DELETE FROM  [IK.CalisanTelefonlari] Where TcKimlikNo=@TcKimlikNo AND Telefon=@Telefon

set @Sonuc=1
return @Sonuc
END

exec [SP_IK_CalisanTelefonlari_Sil] '14596486246', '05333254874'

go
Create Proc [SP_IK_CalisanTelefonlari_Guncelle]
(
@TcKimlikNo nvarchar(20),

@Telefon nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [IK.Calisanlar] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [IK.CalisanTelefonlari] SET TcKimlikNo=@TcKimlikNo,Telefon=@Telefon Where TcKimlikNo=@TcKimlikNo

set @Sonuc=1
return @Sonuc
END

exec [SP_IK_CalisanTelefonlari_Guncelle] '15325678202', '5342988884'

Go
Create Proc [SP_IK_CalisanTelefonlari_Listele]

AS

BEGIN
Select * FRom [dbo].[IK.CalisanTelefonlari]
END

exec [SP_IK_CalisanTelefonlari_Listele]


Go
Create Proc [SP_IK_CalisanTelefonlari_Listele_TcKimlikNo]
(
@TcKimlikNo nvarchar(20)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[IK.CalisanTelefonlari] WHERE  TcKimlikNo=@TcKimlikNo )
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Select * FRom [dbo].[IK.CalisanTelefonlari] where TcKimlikNo=@TcKimlikNo
set @Sonuc=1
return @Sonuc
END