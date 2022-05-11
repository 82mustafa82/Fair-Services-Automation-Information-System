Create Proc [SP_SatinAlma_Tedarikciler_Listele]
AS
BEGIN
Select * From [SatinAlma.Tedarikciler]
END

exec [SP_SatinAlma_Tedarikciler_Listele]

go
Create Proc [SP_SatinAlma_Tedarikciler_Guncelle]
(
@TedarikciID int,
@FirmaAdi nvarchar(50),
@SorumluKisi nvarchar(50),
@Unvani nvarchar(50),
@FirmaAdresi nvarchar(250),
@Email nvarchar(50),
@Aciklama nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [SatinAlma.Tedarikciler] WHERE  TedarikciID=@TedarikciID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [SatinAlma.Tedarikciler] SET FirmaAdi=@FirmaAdi,SorumluKisi=@SorumluKisi,Unvani=@Unvani,FirmaAdres=@FirmaAdresi,Email=@Email,Aciklama=@Aciklama
set @Sonuc=1
return @Sonuc
END

exec [SP_SatinAlma_Tedarikciler_Guncelle] '12', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd'

go
Create Proc [SP_SatinAlma_Tedarikciler_Sil]
(
@TedarikciID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [SatinAlma.Tedarikciler] WHERE  TedarikciID=@TedarikciID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [SatinAlma.Tedarikciler] where  TedarikciID=@TedarikciID 
set @Sonuc=1
return @Sonuc
END

exec [SP_SatinAlma_Tedarikciler_Sil] '2'

go
Create Proc [SP_SatinAlma_Tedarikciler_Ekle]
(
@FirmaAdi nvarchar(50),
@SorumluKisi nvarchar(50),
@Unvani nvarchar(50),
@FirmaAdresi nvarchar(250),
@Email nvarchar(50),
@Aciklama nvarchar(50)
)
AS
BEGIN
Insert Into [SatinAlma.Tedarikciler](FirmaAdi,SorumluKisi,Unvani,FirmaAdres,Email,Aciklama) Values (@FirmaAdi,@SorumluKisi,@Unvani,@FirmaAdresi,@Email,@Aciklama)
END

exec  [SP_SatinAlma_Tedarikciler_Ekle] 'qwe', 'qwe', 'qwe', 'qwe', 'qwe', 'qwe'

