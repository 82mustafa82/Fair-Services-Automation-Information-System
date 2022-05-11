Create Proc [SP_IK_Calisanlar_Ekle]
(
@TcKimlikNo nvarchar(20),
@Ad nvarchar(50),
@Soyad nvarchar(50),
@VardiyaID int,
@Unvan nvarchar(50),
@DogumTarihi date,
@MedeniHal nvarchar(10),
@IseAlimTarihi date,
@YillikIzinID int,
@Adres nvarchar(max),
@DepartmanID int,
@SubeID int,
@Telefon nvarchar(50),
@Email nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [dbo].[IK.Calisanlar] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
INSERT INTO [IK.Calisanlar](TcKimlikNo,Ad,Soyad,VardiyaID,Unvan,DogumTarihi,MedeniHal,IseAlimTarihi,YillikIzinID,Adres,DepartmanID,SubeID) Values(@TcKimlikNo,@Ad,@Soyad,@VardiyaID,@Unvan,@DogumTarihi,@MedeniHal,@IseAlimTarihi,@YillikIzinID,@Adres,@DepartmanID,@SubeID)
INSERT INTO [IK.CalisanTelefonlari](TcKimlikNo,Telefon) Values(@TcKimlikNo,@Telefon)
INSERT INTO [IK.CalisanEmailleri](TcKimlikNo,Email) Values(@TcKimlikNo,@Email)
set @Sonuc=1
return @Sonuc
END

Exec [IK_Calisanlar_Proc_Ekle] 123,'gamze','özköylü',1,'yok','2010-12-31','Bekar','2010-12-31',1,'yok',1,1,'787878','gamze'

Go
Create Proc [SP_IK_Calisanlar_Sil]
(
@TcKimlikNo nvarchar(20)
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
DELETE FROM [IK.Calisanlar]  
where TcKimlikNo=@TcKimlikNo
DELETE FROM  [IK.CalisanTelefonlari] Where TcKimlikNo=@TcKimlikNo
DELETE FROM [IK.CalisanEmailleri] Where TcKimlikNo=@TcKimlikNo
set @Sonuc=1
return @Sonuc
END



go
Create Proc [SP_IK_Calisanlar_Guncelle]
(
@TcKimlikNo nvarchar(20),
@Ad nvarchar(50),
@Soyad nvarchar(50),
@VardiyaID int,
@Unvan nvarchar(50),
@DogumTarihi date,
@MedeniHal nvarchar(10),
@IseAlimTarihi date,
@YillikIzinID int,
@Adres nvarchar(max),
@DepartmanID int,
@SubeID int,
@Telefon nvarchar(50),
@Email nvarchar(50)
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
UPDATE [IK.Calisanlar] SET TcKimlikNo=@TcKimlikNo,Ad=@Ad,Soyad=@Soyad,VardiyaID=@VardiyaID,Unvan=@Unvan,DogumTarihi=@DogumTarihi,MedeniHal=@MedeniHal,IseAlimTarihi=@IseAlimTarihi,YillikIzinID=@YillikIzinID,Adres=@Adres,DepartmanID=@DepartmanID,SubeID=@SubeID 
where TcKimlikNo=@TcKimlikNo
UPDATE [IK.CalisanTelefonlari] SET TcKimlikNo=@TcKimlikNo,Telefon=@Telefon Where TcKimlikNo=@TcKimlikNo
UPDATE [IK.CalisanEmailleri] SET TcKimlikNo=@TcKimlikNo,Email=@Email Where TcKimlikNo=@TcKimlikNo
set @Sonuc=1
return @Sonuc
END


Go
Create Proc [SP_IK_Calisanlar_Listele]

AS

BEGIN
Select C.TcKimlikNo,C.Ad,C.Soyad, V.VardiyaTuru, C.Unvan , C.DogumTarihi, C.MedeniHal ,C.IseAlimTarihi, YI.YillikIzinGunu, C.Adres, D.DepartmanAdi, S.SubeAdi  From [IK.Calisanlar] C
INNER JOIN [IK.CalisanTelefonlari] CT on C.TcKimlikNo=CT.TcKimlikNo 
INNER JOIN [IK.CalisanEmailleri] E on C.TcKimlikNo=E.TcKimlikNo

INNER JOIN [IK.Vardiya] V on C.VardiyaID=V.VardiyaID
INNER JOIN [IK.YillikIzin] YI on C.YillikIzinID=YI.YillikIzinID
INNER JOIN [IK.Departmanlar] D on C.DepartmanID=D.DepartmanID
INNER JOIN [Urun.Sube] S on C.SubeID=S.SubeID
END
