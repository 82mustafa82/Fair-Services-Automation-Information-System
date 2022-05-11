GO
alter Proc [SP_IK_ZimmetliEsyalar_Ekle]
(
@TcKimlikNo nvarchar(20),
@ZimmetAdi nvarchar(10),
@ZimmetAciklamasi nvarchar(50)
)
AS
IF EXISTS(SELECT * FROM [IK.Calisanlar] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
INSERT INTO [IK.ZimmetliEsyalar](TcKimlikNo,ZimmetAdi,ZimmetAciklamasi) Values(@TcKimlikNo,@ZimmetAdi,@ZimmetAciklamasi)
END
ELSE
BEGIN
print('Sistemde Bu TC Kimlik Numarasý Mevcut Deðildir.')
END

exec [SP_IK_ZimmetliEsyalar_Ekle] '36575478628', 'asd', 'asd'


GO
alter Proc [SP_IK_ZimmetliEsyalar_Sil]
(
@TcKimlikNo nvarchar(20),
@ZimmetID int
)
AS
IF NOT EXISTS(SELECT * FROM [IK.Calisanlar] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
PRINT 'Sistemde Bu TC Kimlik Numarasý Mevcut Deðildir.'
END
ELSE
BEGIN
DELETE FROM [IK.ZimmetliEsyalar] WHERE ZimmetID=@ZimmetID
END

exec [SP_IK_ZimmetliEsyalar_Sil] '7'

GO
Create Proc [SP_IK_ZimmetliEsyalar_Guncelle]
(
@TcKimlikNo nvarchar(20),
@ZimmetAdi nvarchar(10),
@ZimmetAciklamasi nvarchar(50)
)
AS
IF NOT EXISTS(SELECT * FROM [IK.ZimmetliEsyalar] WHERE  TcKimlikNo=@TcKimlikNo)
BEGIN
PRINT 'Sistemde Bu TC Kimlik Numarasý Mevcut Deðildir.'
END
ELSE
BEGIN
UPDATE [IK.ZimmetliEsyalar] SET TcKimlikNo=@TcKimlikNo,ZimmetAdi=@ZimmetAdi,ZimmetAciklamasi=@ZimmetAciklamasi Where TcKimlikNo=@TcKimlikNo
END

exec [SP_IK_ZimmetliEsyalar_Guncelle] '36575478628', 'asd', 'asd'

GO
Create Proc [SP_IK_ZimmetliEsyalar_Listeleme]
AS
Select * From [IK.ZimmetliEsyalar]

exec [SP_IK_ZimmetliEsyalar_Listeleme]