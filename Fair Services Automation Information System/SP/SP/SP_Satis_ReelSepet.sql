Create Proc [SP_Satis_ReelSepet_Listele]
AS
BEGIN
Select * From [Satis.ReelSepet]
END

exec [SP_Satis_ReelSepet_Listele]

GO
Create Proc [SP_Satis_ReelSepet_Ekle]
(
@ReelFaturaNo int,
@BarkodNo int
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [dbo].[Satis.ReelSepet] WHERE  ReelFaturaNo=@ReelFaturaNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [dbo].[Satis.ReelSepet] Values(@ReelFaturaNo,@BarkodNo)
set @Sonuc=1
return @Sonuc
END

exec [SP_Satis_ReelSepet_Ekle] '1', '1'

GO
alter Proc [SP_Satis_ReelSepet_Sil]
(
@ReelFaturaNo int,
@BarkodNo int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Satis.ReelSepet] WHERE  ReelFaturaNo=@ReelFaturaNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Satis.ReelSepet] Where ReelFaturaNo=@ReelFaturaNo
set @Sonuc=1
return @Sonuc
END

GO
Create Proc [SP_Satis_ReelSepet_Guncelle]
(
@ReelFaturaNo int,
@BarkodNo int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Satis.ReelSepet] WHERE  ReelFaturaNo=@ReelFaturaNo)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Satis.ReelSepet] Set BarkodNo=@BarkodNo Where ReelFaturaNo=@ReelFaturaNo
set @Sonuc=1
return @Sonuc
END