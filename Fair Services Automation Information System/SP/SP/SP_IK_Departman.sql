Go
alter Proc [SP_IK_Departman_Sil]
(
@DepartmanID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT DepartmanID FROM [dbo].[IK.Departmanlar] WHERE  DepartmanID=@DepartmanID)
BEGIN
Set @Sonuc=0
return @Sonuc

END
BEGIN
DELETE FROM [dbo].[IK.Departmanlar] Where DepartmanID=@DepartmanID
Set @Sonuc=1
return @Sonuc
END

GO

exec [SP_IK_Departman_Sil] '1'

alter Proc [SP_IK_Departman_Ekle]
(
@DepartmanAdi nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc bit
IF EXISTS(SELECT * FROM [IK.Departmanlar] WHERE  DepartmanAdi=@DepartmanAdi)
BEGIN
Set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
INSERT INTO [IK.Departmanlar](DepartmanAdi,Aciklama) Values(@DepartmanAdi,@Aciklama)
Set @Sonuc=1
return @Sonuc
END

exec [SP_IK_Departman_Ekle] 'asdasdasd', 'asdasdasd'

Go
Create Proc [SP_IK_Departman_Guncelle]
(
@DepartmanID int,
@DepartmanAdi nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc bit
IF EXISTS(SELECT * FROM [IK.Departmanlar] WHERE  DepartmanID!=@DepartmanID)
BEGIN
Set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [IK.Departmanlar] SET DepartmanAdi=@DepartmanAdi,Aciklama=@Aciklama 
Where DepartmanID=@DepartmanID
Set @Sonuc=0
return @Sonuc
END
Go

exec [SP_IK_Departman_Guncelle] '1', 'asdasdasd', 'asdasdasd'

Create Proc [SP_IK_Departmanlar_Listele]
AS
BEGIN
Select * From [IK.Departmanlar]
END

exec [SP_IK_Departmanlar_Listele]