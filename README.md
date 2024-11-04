Banka Otomasyonu Veritabanı

-220260069 İsmail Turan

-230260161 Yusuf Durgunsu

-230260155 Talha Zincirkıran




Bankacılık Otomasyonu Projesi Tanıtımı


Bankacılık otomasyonunun amacı, bankacılık işlemlerini daha hızlı, güvenilir ve verimli hale getirmektir. 
Bu sistem, hem müşterilere hem de banka çalışanlarına kapsamlı hizmetler sunarak manuel süreçleri azaltır, 
hataları minimuma indirir ve müşteri memnuniyetini artırır.


Projenin Temel Özellikleri



-Müşteri Hesap Yönetimi: Müşterilerin banka hesaplarını görüntüleyebilme, bakiye kontrolü yapabilme ve hesap hareketlerini inceleyebilme imkanı.

-Para Transferleri: Müşteriler, farklı bankalar ya da hesaplar arasında kolayca para transferi yapabilir. Havale, EFT gibi işlemler de desteklenir.

-Kredi İşlemleri: Müşteriler, ihtiyaç kredisi, konut kredisi gibi çeşitli kredi başvurularını dijital ortamda yapabilir. Onaylanan krediler için geri ödeme planı oluşturulur.

-Kart İşlemleri: Kart başvurusu, kart harcama takibi ve ekstre işlemleri gibi hizmetler sunulur.

-Fatura ve Otomatik Ödeme Talimatları: Fatura ödeme, otomatik ödeme talimatı verme gibi işlemler sayesinde müşterilerin düzenli ödemeleri kolaylaştırılır.

-Destek Talepleri ve Müşteri Hizmetleri: Müşteriler, bankacılık hizmetleriyle ilgili sorunlarını ve sorularını destek talepleri oluşturarak iletebilir.



Veri tabanı Tabloları ve İlişkiler


-Kullanıcı Tablosu : Müşterilerle ilgili bilgiler tutulur.

-Şube Bilgileri Tablosu : Banka şubeleri bilgileri tutulur.

-Destek Tablosu : Müşterilerin destek talepleri bu tabloda tutulur. Kullanıcı Tablosundaki MüşteriId foreign key dir.

-Ödeme Tablosu : Müşterilerin yaptıkları fatura ödemeleri burada tutulur. Kullanıcı Tablosundaki MüşteriId foreign key dir.

-Giriş Tablosu : Kullanıcıların yaptıkları giriş bilgileri(tarih, ip adresi, başarı durumu) burada tutulur. Kullanıcı Tablosundaki MüşteriId foreign key dir.

-Hesaplar Tablosu : Müşterilerin sahip oldukları hesaplar(vadeli, vadesiz, kredi) burada tutulur. Kullanıcı tablosundan MusteriId, Şube Bilgileri tablosundan ŞubeID foreign key dir.

-İşlemler Tablosu : Müşteriler yaptıkları para işlemleri(para yatırma, para çekme,transfer) burada tutulur.Hesaplar tablosundan HesapID foreign key dir.

-Kartlar Tablosu : Müşterinin sahip olduğu kartlarla ilgili bilgiler tutulur. Kullanıcı Tablosundaki MüşteriId foreign key dir.

-Kredi Ekstre Tablosu : Kartın ekstre bilgileri bulunur. Kartlar tablosundaki KartId foreign key dir.

-Kredi başvuru Tablosu : Müşterinin yaptığı kredi bilgileri ile ilgili kredi başvuruları burada tutulur. Kullanıcı Tablosundaki MüşteriID foreign key dir.

-Kredi Geri Ödeme Tablosu : Müşterinin Kredi ödeme bilgileri burada tutulur. KrediBaşvuru tablosundaki KrediId foreign keydir.

-Bildirim tablosu : Müşteriye gönderilen bildirimlerin tutulduğu tutulduğu tablodur. Kullanıcı Tablosundaki MüşteriId foreign key dir.



![Son](https://github.com/user-attachments/assets/24aa99f0-1765-4db8-9dff-9368694b3dd1)
