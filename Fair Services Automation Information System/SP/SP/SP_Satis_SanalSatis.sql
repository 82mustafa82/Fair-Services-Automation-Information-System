Create Proc [SP_Satis_SanalSatis_Listele]
AS
BEGIN
Select SRS.ReelFaturaNo,SRS.RToplamTutar,SRS.RToplamTutar, US.SubeAdi,US.Telefon, MRN.SMAd,MRN.SMSoyad,MRN.Adres From [Satis.ReelSatis] SRS
inner join [dbo].[Urun.Sube] US on SRS.SubeID=US.SubeID
inner join [dbo].[Musteriler.SanalMusteriler] MRN on SRS.ReelMusteriID=MRN.SanalMusteriID

END

exec [SP_Satis_SanalSatis_Listele]


go
Create Proc [SP_Satis_SanalSatis_Ekle]
(
@SToplamTutar money,
@SSatisTarih date,
@SubeID int,
@SanalMusteriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.SanalMusteriler]  WHERE  SanalMusteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM [Urun.Sube]  WHERE  SubeID=@SubeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
insert into [dbo].[Satis.SanalSatis] values(@SToplamTutar,@SSatisTarih,@SubeID,@SanalMusteriID)
set @Sonuc=1
return @Sonuc
END

exec [SP_Satis_SanalSatis_Ekle] '12', '2012-12-12', '1', '2'


Create Proc [SP_Satis_SanalSatis_Guncelle]
(
@SanalFaturaNo int,
@SToplamTutar money,
@SSatisTarih date,
@SubeID int,
@SanalMusteriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.SanalMusteriler]  WHERE  SanalMusteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM [Urun.Sube]  WHERE  SubeID=@SubeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM [dbo].[Satis.SanalSatis]  WHERE  SanalMusteriID=@SanalMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Update [dbo].[Satis.SanalSatis] set SToplamTutar=@SToplamTutar, SSatisTarihi=@SSatisTarih, SubeID=@SubeID,SanalMusteriID=@SanalMusteriID
set @Sonuc=1
return @Sonuc
END

exec [SP_Satis_SanalSatis_Guncelle] '1','12', '2012-12-12', '1', '2'


Create Proc [SP_Satis_SanalSatis_Sil]
(
@SanalFaturaNo int
)
AS
Declare @Sonuc int

 IF NOT EXISTS(SELECT * FROM [dbo].[Satis.SanalSatis]  WHERE  SanalFaturaNo=@SanalFaturaNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Delete from [dbo].[Satis.SanalSatis] where SanalFaturaNo=@SanalFaturaNo
set @Sonuc=1
return @Sonuc
END

exec [SP_Satis_SanalSatis_Sil] '1'