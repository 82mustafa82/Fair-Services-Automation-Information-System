Create Proc [SP_Urun_Renk_Listele]
AS
BEGIN
Select * From [Urun.Renk]
END

exec [SP_Urun_Renk_Listele]

GO
Create Proc [SP_Urun_Renk_Ekle]
(
@Renk nvarchar(50),
@Aciklama  nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.Renk] WHERE Renk=@Renk)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.Renk] Values(@Renk,@Aciklama)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Renk_Ekle] 'asd', 'asdasdasd'

GO
Create Proc [SP_Urun_Renk_Sil]
(
@RenkID int,
@Renk nvarchar(50),
@Aciklama  nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Renk] WHERE  RenkID=@RenkID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.Renk] Where RenkID=@RenkID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Renk_Sil] 14, 'asd', 'asdasdasd'

GO
Create Proc [SP_Urun_Renk_Guncelle]
(
@RenkID int,
@Renk nvarchar(50),
@Aciklama  nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Renk] WHERE  RenkID=@RenkID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.Renk] Set Renk=@Renk,Aciklama=@Aciklama Where RenkID=@RenkID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Renk_Guncelle] 12, 'Gahverengi', 'asd'