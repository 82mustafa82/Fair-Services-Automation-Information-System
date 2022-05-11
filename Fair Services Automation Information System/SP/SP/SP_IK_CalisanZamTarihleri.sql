Create Proc [SP_IK_CalisanZamTarihleri_Listele]
AS
BEGIN
Select C.TcKimlikNo, C.Ad, C.Soyad, CT.Telefon,E.Email,V.Isbasi,V.Paydos,D.DepartmanAdi,S.SubeAdi,ZT.ZamOrani,ZT.ZamTarihi From [IK.CalisanZamTarihleri] ZT
inner join [IK.Calisanlar] C on ZT.TcKimlikNo=C.TcKimlikNo
INNER JOIN [IK.CalisanTelefonlari] CT on C.TcKimlikNo=CT.TcKimlikNo 
INNER JOIN [IK.CalisanEmailleri] E on C.TcKimlikNo=E.TcKimlikNo

INNER JOIN [IK.Vardiya] V on C.VardiyaID=V.VardiyaID
INNER JOIN [IK.Departmanlar] D on C.DepartmanID=D.DepartmanID
INNER JOIN [Urun.Sube] S on C.SubeID=S.SubeID
END

exec  [SP_IK_CalisanZamTarihleri_Listele]


go
Create Proc [SP_IK_CalisanZamTarihleri_Guncelle]
(
@TcKimlikNo nvarchar(20),
@ZamTarihi date,
@ZamOrani nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [IK.CalisanZamTarihleri] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [IK.CalisanZamTarihleri] SET ZamTarihi=@ZamTarihi, ZamOrani=@ZamOrani
where TcKimlikNo=@TcKimlikNo
set @Sonuc=1
return @Sonuc
END

exec [SP_IK_CalisanZamTarihleri_Guncelle] '85498564818', '2012-12-12', '25'


go
Create Proc [SP_IK_CalisanZamTarihleri_Sil]
(
@TcKimlikNo nvarchar(20),
@ZamTarihi date,
@ZamOrani nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [IK.CalisanZamTarihleri] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DElete From [IK.CalisanZamTarihleri] 
where TcKimlikNo=@TcKimlikNo
set @Sonuc=1
return @Sonuc
END

exec [SP_IK_CalisanZamTarihleri_Sil] '85498564818', '2012-12-12', '25'


go
Create Proc [SP_IK_CalisanZamTarihleri_Ekle]
(
@TcKimlik nvarchar(20),
@ZamTarihi date,
@ZamOrani nvarchar(50)
)
AS

BEGIN
INSERT INTO [IK.CalisanZamTarihleri] (TcKimlikNo,ZamOrani,ZamTarihi) Values(@TcKimlik,@ZamOrani,@ZamTarihi)
END

exec [SP_IK_CalisanZamTarihleri_Ekle] '15828425824', '2012-12-12','25'