Create Proc [SP_Urun_UrunStokRenk_Listele]
AS
BEGIN
Select * From [Urun.UrunStokRenk]
END

exec [SP_Urun_UrunStokRenk_Listele]

GO
Create Proc [SP_Urun_UrunStokRenk_Ekle]
(
@RenkID int,
@BarkonID int
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.UrunStokRenk] WHERE  RenkID=@RenkID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.UrunStokRenk] Values(@RenkID,@BarkonID)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_UrunStokRenk_Ekle] 1,1

GO
Create Proc [SP_Urun_UrunStokRenk_Sil]
(
@RenkID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.UrunStokRenk] WHERE  RenkID=@RenkID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.UrunStokRenk] Where RenkID=@RenkID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_UrunStokRenk_Sil] 1

GO
Create Proc [SP_Urun_UrunStokRenk_Guncelle]
(
@RenkID int,
@BarkodNo int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.UrunStokRenk] WHERE  RenkID=@RenkID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.UrunStokRenk] Set BarkodNo=@BarkodNo Where RenkID=@RenkID
set @Sonuc=1
return @Sonuc
END

exec  [SP_Urun_UrunStokRenk_Guncelle] 1,1