Create Proc [SP_IK_YillikIzin_Listele]
AS
BEGIN
Select * From [IK.YillikIzin]
END

go
Create Proc [SP_IK_YillikIzin_Ekle]
(
@CalistigiSene nvarchar(50),
@YillikIzýnGunu nvarchar(50),
@Aciklama nvarchar(50)
)
AS
BEGIN
INSERT INTO [IK.YillikIzin](CalistigiSene,YillikIzinGunu,Aciklama) VALUES (@CalistigiSene,@YillikIzýnGunu,@Aciklama)
END

go
Create Proc [SP_IK_YillikIzin_Sil]
(
@YillikIzinID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [IK.YillikIzin] WHERE  YillikIzinID=@YillikIzinID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [IK.YillikIzin] where  YillikIzinID=@YillikIzinID
set @Sonuc=1
return @Sonuc
END


GO
Create Proc [SP_IK_YillikIzin_Guncelle]
(
@YillikIzinID int,
@CalistigiSene nvarchar(50),
@YillikIzýnGunu nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [IK.YillikIzin] WHERE  YillikIzinID=@YillikIzinID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Update [IK.YillikIzin] Set   CalistigiSene=@CalistigiSene, YillikIzinGunu=@YillikIzýnGunu, Aciklama=@Aciklama Where YillikIzinID=@YillikIzinID
set @Sonuc=1
return @Sonuc
END
