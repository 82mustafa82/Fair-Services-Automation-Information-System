Create Proc [SP_Satis_SanalSepet_Listele]
AS
BEGIN
Select * From [Satis.SanalSepet]
END

exec [SP_Satis_SanalSepet_Listele]

GO
Create Proc [SP_Satis_SanalSepet_Ekle]
(
@SanaFaturaNo int,
@BarkodNo int
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Satis.SanalSepet] WHERE  SanaFaturaNo=@SanaFaturaNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Satis.SanalSepet] Values(@SanaFaturaNo,@BarkodNo)
set @Sonuc=1
return @Sonuc
END

exec [SP_Satis_SanalSepet_Ekle] '12', '12'

GO
Create Proc [SP_Satis_SanalSepet_Sil]
(
@SanaFaturaNo int,
@BarkodNo int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Satis.SanalSepet] WHERE SanaFaturaNo=@SanaFaturaNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Satis.SanalSepet] Where SanaFaturaNo=@SanaFaturaNo
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Satis_SanalSepet_Guncelle]
(
@SanaFaturaNo int,
@BarkodNo int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Satis.SanalSepet] WHERE  SanaFaturaNo=@SanaFaturaNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Satis.SanalSepet] Set BarkodNo=@BarkodNo Where SanaFaturaNo=@SanaFaturaNo
set @Sonuc=1
return @Sonuc
END