<h1>Banka Otomasyonu Veritabanı</h1>


-220260069 İsmail Turan

-230260161 Yusuf Durgunsu

-230260155 Talha Zincirkıran




<h2>Bankacılık Otomasyonu Projesi Tanıtımı</h2>



Bankacılık otomasyonunun amacı, bankacılık işlemlerini daha hızlı, güvenilir ve verimli hale getirmektir. 
Bu sistem, hem müşterilere hem de banka çalışanlarına kapsamlı hizmetler sunarak manuel süreçleri azaltır, 
hataları minimuma indirir ve müşteri memnuniyetini artırır.


<h2>Projenin Temel Özellikleri</h2>



-Müşteri Hesap Yönetimi: Müşterilerin banka hesaplarını görüntüleyebilme, bakiye kontrolü yapabilme ve hesap hareketlerini inceleyebilme imkanı.

-Para Transferleri: Müşteriler, farklı bankalar ya da hesaplar arasında kolayca para transferi yapabilir. Havale, EFT gibi işlemler de desteklenir.

-Kredi İşlemleri: Müşteriler, ihtiyaç kredisi, konut kredisi gibi çeşitli kredi başvurularını dijital ortamda yapabilir. Onaylanan krediler için geri ödeme planı oluşturulur.

-Kart İşlemleri: Kart başvurusu, kart harcama takibi ve ekstre işlemleri gibi hizmetler sunulur.

-Fatura ve Otomatik Ödeme Talimatları: Fatura ödeme, otomatik ödeme talimatı verme gibi işlemler sayesinde müşterilerin düzenli ödemeleri kolaylaştırılır.

-Destek Talepleri ve Müşteri Hizmetleri: Müşteriler, bankacılık hizmetleriyle ilgili sorunlarını ve sorularını destek talepleri oluşturarak iletebilir.

<h3>Varlıklar ve Nitelikleri</h3>


| Varlık      | Nitelikler      |
|----------------|----------------|
| Kullanıcılar      | MusteriID(PK), Ad, Soyad, TC, Tel, E-mail, Sifre, OlusturmaTarihi  |
| Hesaplar     |HesapNo(PK), MusteriID(FK), SubeId(FK), Bakiye, HesapTuru, Durum, OlusturmaTarihi, Iban  |
| Giris     | GirisID(PK), MusteriID(FK), GirisTarihi, IPAdresi, Basarilimi      |
| Destek     | DestekID(PK), MusteriID(FK), Konu, Aciklama, Durum, OlusturmaTarihi      |
| Şube Bilgileri     | SubeId(PK), SubeAdi, Adres, Telefon, E-Posta      |
| İslemler      |islemID(PK), HesapNo(FK), islemTuru, Tutar, Aciklama, Tarih, HavaleHesapNo      |
| KrediBasvuru   | BasvuruID(PK), MusteriID(FK), KrediTuru, Miktar, Durum, BasvuruTarihi, OnayTarihi      |
| Odeme     | FaturaID(PK), FaturaNo, MusteriID(FK), Tutar, FaturaTarihi, SonOdemeTarihi, OdemeDurumu      |
| Kartlar      | kartID(PK), MusteriId(FK), KartNo, KartTuru, SonkullanmaTarihi, CVV     |
| KrediKart    | kredikartID(PK), KartID(FK), limit, Borc, kullanılabilir_limit, HesapKesimTarihi  |
| Bankakart    | BankakartID(PK), KartID(FK), Bakiye     |
| KrediEkstre    | KrediEkstre(PK), KrediKartId(FK), Donem ,ToplamHarcama ,AsgariOdemeTutari, SonOdemeTarihi,Durum     |
|Geri Odeme    | GeriOdemeID(PK), KrediID(FK), TaksitNo, OdemeTarihi, OdemeTutari, OdendiMi     |

<h3>İlişkiler</h3>



| Varlıklar      | İlişki       | Açıklama       |
|----------------|----------------|----------------|
| Kullanıcılar-Hesaplar      |  1-n   | Bir Kullanıcın birden fazla Hesabı(vadeli hesap, vadesiz hesap) olabilir.      |
| Kullanıcılar-Destek      | 1-n      | Bir Kullanıcı birden fazla Destek talebi gönderebilir. |
| Kullanıcılar-Giris      | 1-n      | Bir kullanıcı birden fazla giris yapabilir    |
| Kullanıcılar-Kartlar      | 1-n      | Bir kullanıcı birden fazla karta(kredi kartı,banka kartı) sahip olabilir      |
| Kullanıcılar-KrediBasvuru      | 1-n      | Bir kullanıcı birden fazla kredi başvurusu(ihtiyac, konut, taşıt) yapabilir.      |
| kullanıcılar-Odeme     | 1-n      | Bir kullanıcı birden fazla fatura odeme oluşturabilir.     |
| SubeBilgileri-Hesaplar      | 1-n     | Bir hesap sadece bir banka şubesini bağlı olabilir.      |
| Hesaplar-islemler      | 1-n      | Bir Hesaptan birden fazla işlem yapılabilir.     |
| KrediBasvuru-GeriOdeme     | 1-1      | Bir kredi başvursunda sadece bir geri ödeme tablosu bulunur.      |
| Kartlar-KrediKart   |   1-1    | Her kartın içinde en fazla bir kredi kartı bulunur.    |
| Kartlar-BankaKart     | 1-1     | Her kartın içinde en fazla bir banka kartı bulunur.     |
| KrediKart-KrediEkstre     | 1-1      | Bir kredi kartının bir kredi ekstresi olabilir.    |







![Banka](https://github.com/user-attachments/assets/7ea445bb-9383-481d-9393-f80f07bcf223)
