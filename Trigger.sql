CREATE TRIGGER islemek
ON islemler
AFTER INSERT
AS
BEGIN
    
    UPDATE Hesaplar
    SET Bakiye = Bakiye - inserted.Tutar
    FROM Hesaplar
    INNER JOIN inserted
    ON Hesaplar.HesapNo = inserted.HesapNo
    WHERE inserted.islemTuru = 'Havale';
	UPDATE Hesaplar
    SET Bakiye = Bakiye + inserted.Tutar
    FROM Hesaplar
    INNER JOIN inserted
    ON Hesaplar.HesapNo = inserted.HavaleHesapNo
    WHERE inserted.islemTuru = 'Havale';
END;