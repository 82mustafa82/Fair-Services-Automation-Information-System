Create Proc [SP_Satis_ReelSatis_Listele]
AS
BEGIN
Select SRS.ReelFaturaNo,SRS.RToplamTutar,SRS.RToplamTutar, US.SubeAdi,US.Telefon, MRN.RMAd,MRN.RMSoyad,MRN.RMAdres From [Satis.ReelSatis] SRS
inner join [dbo].[Urun.Sube] US on SRS.SubeID=US.SubeID
inner join [dbo].[Musteriler.ReelMusteriler] MRN on SRS.ReelMusteriID=MRN.ReelMusteriID

END

exec [SP_Satis_ReelSatis_Listele]


go
Create Proc [SP_Satis_ReelSatis_Ekle]
(
@RToplamTutar money,
@RSatisTarih date,
@SubeID int,
@TcKimlikNo nvarchar(20),
@ReelMusteriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[Musteriler.ReelMusteriler]  WHERE  ReelMusteriID=@ReelMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM [dbo].[Urun.Sube]  WHERE  SubeID=@SubeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM  [dbo].[IK.Calisanlar] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
insert into [dbo].[Satis.ReelSatis] values(@RToplamTutar,@RSatisTarih,@SubeID,@TcKimlikNo,@ReelMusteriID)
set @Sonuc=1
return @Sonuc
END

exec [SP_Satis_ReelSatis_Ekle] '12', '2013-01-01', '1', '85498564818', '1'


Create Proc [SP_Satis_ReelSatis_Guncelle]
(
@ReelFaturaNo int,
@RToplamTutar money,
@RSatisTarih date,
@SubeID int,
@TcKimlikNo nvarchar(20),
@ReelMusteriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.ReelMusteriler]  WHERE  ReelMusteriID=@ReelMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM [Urun.Sube]  WHERE  SubeID=@SubeID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM  [dbo].[IK.Calisanlar] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE IF NOT EXISTS(SELECT * FROM [dbo].[Satis.ReelSatis]  WHERE  ReelFaturaNo=@ReelFaturaNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Update [dbo].[Satis.ReelSatis] set RToplamTutar=@RToplamTutar, RSatisTarih=@RSatisTarih, SubeID=@SubeID,TcKimlikNo=@TcKimlikNo,ReelMusteriID=@ReelMusteriID
set @Sonuc=1
return @Sonuc
END

exec [SP_Satis_ReelSatis_Guncelle]'3', '11', '2013-01-01', '1', '85498564818', '1'


Create Proc [SP_Satis_ReelSatis_Sil]
(
@ReelFaturaNo int
)
AS
Declare @Sonuc int

 IF NOT EXISTS(SELECT * FROM [dbo].[Satis.ReelSatis]  WHERE  ReelFaturaNo=@ReelFaturaNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
Delete from [dbo].[Satis.ReelSatis] where ReelFaturaNo=@ReelFaturaNo
set @Sonuc=1
return @Sonuc
END

exec [SP_Satis_ReelSatis_Sil] 3
