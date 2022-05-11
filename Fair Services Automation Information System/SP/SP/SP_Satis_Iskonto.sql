Create Proc [SP_Satis_Iskonto_Listele]
AS
BEGIN
Select * From [dbo].[Satis.Iskonto]
END

exec [SP_Satis_Iskonto_Listele]

go
Create Proc [SP_Satis_Iskonto_Ekle]
(
@IskontoOrani float
)
AS
BEGIN
Insert Into [dbo].[Satis.Iskonto] Values(@IskontoOrani)
END


exec [SP_Satis_Iskonto_Ekle] '12'


go
CREATE Proc [SP_Satis_Iskonto_Sil]
(
@IskontoID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [dbo].[Satis.Iskonto] WHERE  IskontoID=@IskontoID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [dbo].[Satis.Iskonto] where  IskontoID=@IskontoID
set @Sonuc=1
return @Sonuc
END

exec [SP_Satis_Iskonto_Sil] '5'

go
CREATE Proc [SP_Satis_Iskonto_Guncelle]
(
@IskontoID int,
@IskontoOrani Float
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Satis.Iskonto] WHERE  IskontoID=@IskontoID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [dbo].[Satis.Iskonto] Set IskontoOrani=@IskontoOrani where IskontoID=@IskontoID
set @Sonuc=1
return @Sonuc
END

exec [SP_Satis_Iskonto_Guncelle] '4', '12'