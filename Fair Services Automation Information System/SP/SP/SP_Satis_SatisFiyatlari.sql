Create Proc [SP_Satis_SatisFiyatlari_Listele]
AS
BEGIN
Select * From [dbo].[Satis.SatisFiyatlari]
END

exec [SP_Satis_SatisFiyatlari_Listele]

go
Create Proc [SP_Satis_SatisFiyatlari_Ekle]
(
@UrunID int,
@StandartFiyat money,
@Aciklama nvarchar(50),
@IskontoID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[Urun.UrunStok]  WHERE  [UrunID]=@UrunID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM [dbo].[Satis.Iskonto]  WHERE  IskontoID=@IskontoID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
insert into [dbo].[Satis.SatisFiyatlari] values(@UrunID,@StandartFiyat,@Aciklama,@IskontoID)
set @Sonuc=1
return @Sonuc
END

exec [SP_Satis_SatisFiyatlari_Ekle] '1', '12', 'asd', '1'

go
Create Proc [SP_Satis_SatisFiyatlari_Guncelle]
(
@UrunID int,
@StandartFiyat money,
@Aciklama nvarchar(50),
@IskontoID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[Urun.UrunStok]  WHERE  [UrunID]=@UrunID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM [dbo].[Satis.Iskonto]  WHERE  IskontoID=@IskontoID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [dbo].[Satis.SatisFiyatlari] Set UrunID=@UrunID,StandartFiyat=@StandartFiyat,Aciklama=@Aciklama,IskontoID=@IskontoID where [UrunID]=@UrunID And IskontoID=@IskontoID
set @Sonuc=1
return @Sonuc
END

exec [SP_Satis_SatisFiyatlari_Guncelle] '1', '15', 'asd', '1'


go
Create Proc [SP_Satis_SatisFiyatlari_Sil]
(
@UrunID int,
@StandartFiyat money,
@Aciklama nvarchar(50),
@IskontoID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[Urun.UrunStok]  WHERE  [UrunID]=@UrunID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM [dbo].[Satis.Iskonto]  WHERE  IskontoID=@IskontoID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [dbo].[Satis.SatisFiyatlari]  where [UrunID]=@UrunID And IskontoID=@IskontoID
set @Sonuc=1
return @Sonuc
END

exec  [SP_Satis_SatisFiyatlari_Sil]  '1', '15', 'asd', '1'
