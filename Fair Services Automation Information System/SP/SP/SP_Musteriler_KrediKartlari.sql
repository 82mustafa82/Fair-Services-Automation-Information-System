Create Proc [SP_Musteriler_KrediKartlari_Listele]
AS
BEGIN
Select * From [Musteriler.KrediKartlari]
END

exec [SP_Musteriler_KrediKartlari_Listele]

go
Create Proc [SP_Musteriler_KrediKartlari_Ekle]
(
@KartTipi nvarchar(50),
@KartNumarasi int,
@GecerlilikAyi int,
@GecerlilikYili int
)
AS
BEGIN
Insert Into [Musteriler.KrediKartlari](KartTipi,KartNumarasi,GecerlilikAyi,GecerlilikYili) Values (@KartTipi,@KartNumarasi,@GecerlilikAyi,@GecerlilikYili)
END

exec [SP_Musteriler_KrediKartlari_Ekle] 'asd', '123456', '12', '2012'

go
Create Proc [SP_Musteriler_KrediKartlari_Sil]
(
@KrediKartiID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.KrediKartlari] WHERE  KrediKartiID=@KrediKartiID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [Musteriler.KrediKartlari] where  KrediKartiID=@KrediKartiID 
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_KrediKartlari_Sil] 1

go
Create Proc [SP_Musteriler_KrediKartlari_Guncelle]
(
@KrediKartiID int,
@KartTipi nvarchar(50),
@KartNumarasi int,
@GecerlilikAyi int,
@GecerlilikYili int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.KrediKartlari] WHERE  KrediKartiID=@KrediKartiID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Update [Musteriler.KrediKartlari] Set   KartTipi=@KartTipi,KartNumarasi=@KartNumarasi,GecerlilikAyi=@GecerlilikAyi,GecerlilikYili=@GecerlilikYili Where KrediKartiID=@KrediKartiID
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_KrediKartlari_Guncelle] '2', 'qwe', '654321', '123', '2006'
