alter Proc [SP_SatinAlma_DemirbasTedarikciler_Listele]
AS
BEGIN
Select SAT.TedarikciID, SAT.SorumluKisi, SAT.Unvani,SAT.FirmaAdi, SADT.AlimTarihi, SADT.AlinanUrun, SADT.AlimTarihi,SADT.Adet  From
[SatinAlma.DemirbasTedarikcileri] SADT
inner join [SatinAlma.Tedarikciler] SAT on SADT.TedarikciID=SAT.TedarikciID
END

exec [SP_SatinAlma_DemirbasTedarikciler_Listele]


go
alter Proc [SP_SatinAlma_DemirbasTedarikciler_Ekle]
(
@TedarikciID int,
@AlinanUrun nvarchar(50),
@Adet int,
@Fiyat money,
@AlimTarihi date,
@Acikalama nvarchar(50)
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
INSERT INTO [SatinAlma.DemirbasTedarikcileri] VALUES(@TedarikciID,@AlinanUrun,@Adet,@Fiyat,@AlimTarihi,@Acikalama)
set @Sonuc=1
return @Sonuc
END

exec [SP_SatinAlma_DemirbasTedarikciler_Ekle] '1', 'asd', '12','12', '2012-12-12', 'asdasdasd'

