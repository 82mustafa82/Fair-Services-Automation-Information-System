Create Proc [SP_Urun_SubeDepo_Listele]
AS
BEGIN
Select * From [Urun.SubeDepo]
END

GO
Create Proc [SP_Urun_SubeDepo_Ekle]
(
@ModelNo int,
@BarkodNo int,
@SubeID nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.SubeDepo] WHERE SubeID=@SubeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.SubeDepo] Values(@ModelNo,@BarkodNo,@SubeID,@Aciklama)
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Urun_SubeDepo_Sil]
(
@SubeID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.SubeDepo] WHERE  SubeID=@SubeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.SubeDepo] Where  SubeID=@SubeID
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Urun_SubeDepo_Guncelle]
(
@ModelNo int,
@BarkodNo int,
@SubeID nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.SubeDepo] WHERE  SubeID=@SubeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.SubeDepo] Set ModelNo=@ModelNo,BarkodNo=@BarkodNo,Aciklama=@Aciklama Where SubeID=@SubeID
set @Sonuc=1
return @Sonuc
END