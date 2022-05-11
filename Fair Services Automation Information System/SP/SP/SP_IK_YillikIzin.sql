Create Proc [SP_IK_YillikIzin_Listele]
AS
BEGIN
Select * From [IK.YillikIzin]
END

go
Create Proc [SP_IK_YillikIzin_Ekle]
(
@CalistigiSene nvarchar(50),
@YillikIz�nGunu nvarchar(50),
@Aciklama nvarchar(50)
)
AS
BEGIN
INSERT INTO [IK.YillikIzin](CalistigiSene,YillikIzinGunu,Aciklama) VALUES (@CalistigiSene,@YillikIz�nGunu,@Aciklama)
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
@YillikIz�nGunu nvarchar(50),
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
Update [IK.YillikIzin] Set   CalistigiSene=@CalistigiSene, YillikIzinGunu=@YillikIz�nGunu, Aciklama=@Aciklama Where YillikIzinID=@YillikIzinID
set @Sonuc=1
return @Sonuc
END
