Create Proc [SP_IK_ZamTarihler_Listele]
AS
BEGIN
Select * From [IK.CalisanZamTarihleri]
END

GO
Create Proc [SP_IK_ZamTarihleri_Ekle]
(
@TcKimlikNo nvarchar(20),
@ZamTarihi date,
@ZamOrani nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [IK.CalisanZamTarihleri] WHERE  ZamTarihi=@ZamTarihi)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [IK.CalisanZamTarihleri] Values(@TcKimlikNo,@ZamTarihi,@ZamOrani)
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_IK_ZamTarihleri_Sil]
(
@TcKimlikNo nvarchar(20),
@ZamTarihi date,
@ZamOrani nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [IK.CalisanZamTarihleri] WHERE ZamTarihi=@ZamTarihi)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [IK.CalisanZamTarihleri] Where  ZamTarihi=@ZamTarihi
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_IK_ZamTarihleri_Guncelle]
(
@TcKimlikNo nvarchar(20),
@ZamTarihi date,
@ZamOrani nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [IK.CalisanZamTarihleri] WHERE  ZamTarihi=@ZamTarihi)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [IK.CalisanZamTarihleri] Set TcKimlikNo=@TcKimlikNo,ZamOrani=@ZamOrani Where ZamTarihi=@ZamTarihi
set @Sonuc=1
return @Sonuc
END