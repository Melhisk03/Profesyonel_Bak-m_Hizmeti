# Profesyonel Bakım Hizmeti

Bu proje, profesyonel bakım hizmeti süreçlerini dijitalleştirmek ve detay olarak yönetmek için tasarlanmış, SQL Server üzerinde çalışan ilişkisel bir veritabanıdır.

Sistem, hasta demografisini, adres lokasyonlarını, hemşire-hasta atamalarını, uygulanan ilaç tedavilerini birbirine bağlayan bir yapı oluşturmaktadır.

Projede toplam 5 temel tablodan oluşmaktadır:
- Adresler: Mahalle, sokak, il, ilçe gibi bilgiler içerir.
- HastaBilgileri: Hastaların genel bilgilerini içerir. Kimlik, yaş, hastalık gibi bilgiler.
- Hemsireler: Çalışan hemşirelerin bilgileri telefon, kimlik bilgileri vb bilgiler.
- KullanilanIlaclar: Hastalara uygulanan ilaçların adları, dozları, tarih-saat vb bilgiler.
- Hemsire_Hasta (Atama): Hemşireler ile hastalar arasındaki "many-to-many" ilişkiyi çözer. Hangi hemşirenin hangi hastadan sorumlu olduğunu belirler.

İlişkisel Yapı

Veri tutarlılığı sağlamak amacıyla tablolar Foreign Key kısıtlarıyla birbirine bağlanmıştır.

- HastaBilgileri ve Hemsireler tabloları, AdresID üzerinden Adresler tablosuna bağlıdır.
- Hemsire_Hasta tablosu, HastaID ve HemsireID sütunları üzerinden birincil tabloları eşleştirir
- KullanılanIlaclar tablosu da yine HastaID ve HemsireID kolonları ile işlem yapan kişileri kayıt altına alır.

Raporlama ve Analiz

Sağlık ve operasyon süreçleri çeşitli sorgulara imkan tanır. Proje ile birlikte gelen örnek sorgular raporlama tarafında kullanılabilir.

- En yaygın hastalık veya kullanılan ilaç.
- Belirlenen tarih aralıklarında uygulanan tedaviler.
- Şehir bazlı yoğunluk analizi.
- Belirli bir hemşirenin sorumlu olduğu toplam hasta sayısı.

Kurulum

profesyonel_bakım_hizmeti dosyasını SQL Server Management Studio uygulamasında açın.
Script ProfesyonelBakımHizmeti isimli veritabanına bağlanacak, tablolar oluşturulacak ve 120 adres 99 hasta ile 23 hemşirenin verisini, sisteme eklenecek.
Scriptin en altındaki örnek SELECT sorgularını seçip test edebilirsiniz





