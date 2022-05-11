Create Proc [SP_IK_Vardiya_Listele]
AS
BEGIN
Select * From [IK.Vardiya]
END

exec [SP_IK_Vardiya_Listele]

GO
Create Proc [SP_IK_Vardiya_Ekle]
(
@VardiyaTuru nvarchar(50),
@IsBasi nvarchar(10),
@Paydos nvarchar(10)
)
AS
Declare @Sonuc bit
IF EXISTS(SELECT * FROM [IK.Vardiya] WHERE  VardiyaTuru=@VardiyaTuru)
BEGIN
Set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
INSERT INTO [IK.Vardiya](VardiyaTuru,Isbasi,Paydos) Values(@VardiyaTuru,@IsBasi,@Paydos)
Set @Sonuc=1
return @Sonuc
END

exec [SP_IK_Vardiya_Ekle] 'asd', 'asd', 'asd'

GO
Create Proc [SP_IK_Vardiya_Guncelle]
(
@VardiyaID int,
@VardiyaTuru nvarchar(50),
@IsBasi nvarchar(10),
@Paydos nvarchar(10)
)
AS
Declare @Sonuc bit
IF NOT EXISTS(SELECT * FROM [IK.Vardiya] WHERE  VardiyaID=VardiyaID)
BEGIN
Set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [IK.Vardiya] SET VardiyaTuru=@VardiyaTuru, Isbasi=@IsBasi, Paydos=@Paydos where VardiyaID=@VardiyaID
Set @Sonuc=1
return @Sonuc
END

exec [SP_IK_Vardiya_Guncelle] '2', 'asd', 'asd', 'asd'

GO
Create Proc [SP_IK_Vardiya_Sil]
(
@VardiyaID int
)
AS
Declare @Sonuc bit
IF not EXISTS(SELECT * FROM [IK.Vardiya] WHERE  VardiyaID=@VardiyaID)
BEGIN
Set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [IK.Vardiya] Where VardiyaID=@VardiyaID
Set @Sonuc=1
return @Sonuc
END

exec [SP_IK_Vardiya_Sil] '3'
