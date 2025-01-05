
CREATE PROCEDURE AddCustomer
    @islemID int,
    @HesapNo varchar(16),
	@islemTuru nchar(15),
	@Tutar money,
	@Aciklama varchar(250),
	@Tarih datetime,
	@HavaleHesapNo varchar(16)
AS
BEGIN
    INSERT INTO islemler (islemID,HesapNo,islemTuru,Tutar,Aciklama,Tarih,HavaleHesapNo)
    VALUES (@islemID,@HesapNo,@islemTuru,@Tutar,@Aciklama,@Tarih,@HavaleHesapNo);
END;