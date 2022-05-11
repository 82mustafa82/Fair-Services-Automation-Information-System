Create Proc [SP_IK_IzinTarihleri_Listele]
AS
BEGIN
Select C.TcKimlikNo, C.Ad, C.Soyad, CT.Telefon,E.Email,V.Isbasi,V.Paydos,D.DepartmanAdi,S.SubeAdi,IT.IzinBaslangicTarihi,IT.IzinBitisTarihi From [IK.IzinTarihleri] IT
inner join [IK.Calisanlar] C on IT.TcKimlikNo=C.TcKimlikNo
INNER JOIN [IK.CalisanTelefonlari] CT on C.TcKimlikNo=CT.TcKimlikNo 
INNER JOIN [IK.CalisanEmailleri] E on C.TcKimlikNo=E.TcKimlikNo

INNER JOIN [IK.Vardiya] V on C.VardiyaID=V.VardiyaID
INNER JOIN [IK.Departmanlar] D on C.DepartmanID=D.DepartmanID
INNER JOIN [Urun.Sube] S on C.SubeID=S.SubeID
 
END

go

exec [SP_IK_IzinTarihleri_Listele]

Create Proc [SP_IK_IzinTarihleri_Guncelle]
(
@TcKimlikNo nvarchar(20),
@IzinBaslangicTarihi date,
@IzinBitisTarihi date,
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [IK.IzinTarihleri] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [IK.IzinTarihleri] SET IzinBaslangicTarihi=@IzinBaslangicTarihi, IzinBitisTarihi=@IzinBitisTarihi, Aciklama=@Aciklama 
where TcKimlikNo=@TcKimlikNo
set @Sonuc=1
return @Sonuc
END

exec [SP_IK_IzinTarihleri_Guncelle] '36575478628', '2012-12-12', '2013-12-12', 'asdasdasd'

go
Create Proc [SP_IK_IzinTarihleri_Sil]
(
@TcKimlikNo nvarchar(20)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [IK.IzinTarihleri] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [IK.IzinTarihleri]  
where TcKimlikNo=@TcKimlikNo
set @Sonuc=1
return @Sonuc
END

exec [SP_IK_IzinTarihleri_Sil] '36575478628'

go
Create Proc [SP_IK_IzinTarihleri_Ekle]
(
@TcKimlik nvarchar(20),
@IzinBaslangicTarihi date,
@IzinBitisTarihi date,
@Aciklama nvarchar(50)
)
AS

BEGIN
INSERT INTO [IK.IzinTarihleri] (TcKimlikNo,IzinBaslangicTarihi,IzinBitisTarihi,Aciklama) Values(@TcKimlik,@IzinBaslangicTarihi,@IzinBitisTarihi,@Aciklama)
END

exec [SP_IK_IzinTarihleri_Ekle] '36575478628', '2012-12-12', '2013-12-12', 'asdasdasd'
