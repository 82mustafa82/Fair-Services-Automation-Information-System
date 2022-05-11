Alter Proc [SP_Musteriler_ReelMusteriler_Ekle]
(
@ReelMusteriID int,
@RMad nvarchar(50),
@RMSoyad nvarchar(50),
@RMAdres nvarchar(250)
)
AS
Declare @sonuc int
if not exists(select * from [dbo].[Musteriler.ReelMusteriler] where ReelMusteriID=@ReelMusteriID)
BEGIN
set @sonuc =0
return @sonuc
end
else
begin
INSERT INTO [dbo].[Musteriler.ReelMusteriler] (RMAd,RMSoyad,RMAdres) Values(@RMad,@RMSoyad,@RMAdres)
set @sonuc = 1
return @sonuc
END
Go

exec [SP_Musteriler_ReelMusteriler_Ekle] 'asd', 'asd', 'asd'

alter Proc [SP_Musteriler_ReelMusteriler_Listele]
AS
BEGIN
Select * From [Musteriler.ReelMusteriler]
END

go

exec [SP_Musteriler_ReelMusteriler_Listele]

alter Proc [SP_Musteriler_ReelMusteriler_Sil]
(
@ReelMusteriID int
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.ReelMusteriler] WHERE  ReelMusteriID=@ReelMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
DELETE FROM [Musteriler.ReelMusteriler]  
where ReelMusteriID=@ReelMusteriID
DELETE FROM [Musteriler.ReelMusteriTelefonlari]  Where ReelMusteriID=@ReelMusteriID
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_ReelMusteriler_Sil] '1'

go
alter Proc [SP_Musteriler_ReelMusteriler_Guncelle]
(
@ReelMusteriID int,
@RMad nvarchar(50),
@RMSoyad nvarchar(50),
@RMAdres nvarchar(250)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Musteriler.ReelMusteriler] WHERE  ReelMusteriID=@ReelMusteriID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN
UPDATE [Musteriler.ReelMusteriler] SET RMAd=@RMad,RMSoyad=@RMSoyad,RMAdres=@RMAdres
where ReelMusteriID=@ReelMusteriID
set @Sonuc=1
return @Sonuc
END

exec [SP_Musteriler_ReelMusteriler_Guncelle] '1', 'asd', 'asd', 'asdasdasd'
