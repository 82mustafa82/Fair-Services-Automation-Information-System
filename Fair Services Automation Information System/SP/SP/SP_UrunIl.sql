Create Proc [SP_Urun_Il_Listele]
AS
BEGIN
Select * From [Urun.Il]
END

exec [SP_Urun_Il_Listele]

GO
Create Proc [SP_Urun_Il_Ekle]
(
@IlAdi nvarchar(50)
)
AS
Declare @Sonuc int
IF EXISTS(SELECT * FROM [Urun.Il] WHERE  IlAdi=@IlAdi)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
Insert Into [Urun.Il] Values(@IlAdi)
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Il_Ekle] 'asd'

GO
Create Proc [SP_Urun_Il_Sil]
(
@IlID int,
@IlAdi nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Il] WHERE  IlID=@IlID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
DELETE FROM [Urun.Il] Where IlID=@IlID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Il_Sil] 82, 'asd'

GO
Create Proc [SP_Urun_Il_Guncelle]
(
@IlID int,
@IlAdi nvarchar(50)
)
AS
Declare @Sonuc int
IF NOT EXISTS(SELECT * FROM [Urun.Il] WHERE  IlID=@IlID)
BEGIN
set @Sonuc=0
return @Sonuc
END
ELSE
BEGIN 
UPDATE [Urun.Il] Set IlAdi=@IlAdi Where IlID=@IlID
set @Sonuc=1
return @Sonuc
END

exec [SP_Urun_Il_Guncelle] 34, 'ISTANBUL'