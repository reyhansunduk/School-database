use okulProje

create table bolum(Id int primary key identity,
bolum_adi nvarchar(50),
bolum_telno nvarchar(50),
eposta nvarchar(50))

create table ogrenci (Id int primary key identity, 
ogrenci_ad nvarchar(50), 
ogrenci_soyad nvarchar(50),
ogenci_no nvarchar(50),
bolumId int, foreign key (bolumId) references bolum(Id))

create table ders(Id int primary key identity,
ders_adi nvarchar(50),
ders_kodu nvarchar (50),
kredi int,
akts int,
bolumId int, foreign key (bolumId) references bolum(Id))

create table ogretmen(Id int primary key identity,
ogretmen_adi nvarchar(50),
ogretmen_soyadi nvarchar(50),
dogumyeri nvarchar(50),
bolumId int, foreign key (bolumId) references bolum(Id))

create table ogrenciDers(Id int primary key identity, 
dersId int, 
ogrenciId int, foreign key (ogrenciId) references ogrenci(Id),
vize int,
final int,
proje int)

create table ogretmenDers(Id int primary key identity,
ogretmenId int, foreign key (ogretmenId) references ogretmen(Id),
dersId int, foreign key (dersId) references ders(Id))

select*from bolum
select*from ders
select*from ogrenci
select*from ogrenciDers
select*from ogretmen
select*from ogretmenDers

/*1.öðretmen tablosundan soyismi Kaya yrine ustabaþ olarak deðiþtir. */
update ogretmen set ogretmen_soyadi='ustabaþ' where ogretmen_soyadi='kaya'   

/*2.öðrencilerin mak vize notlarýný yazdýr*/
select max(ogrenciDers.vize) as [en yuksek not] from ogrenciDers  

/*3.En yüksek proje notuna sahip 5 kiþiyi göster.*/
select  top 5 ogrenciDers.proje from ogrenciDers order by proje desc

/*4.En yüksek proje notuna sahip 5 kiþiyi göster.*/
select  top 5 ogrenciDers.proje from ogrenciDers order by proje asc

/*5.Vize final ve proje notu 100 olup, dersiýd si 5 olan öðrencileri listele*/
select ogrenciDers.vize,ogrenciDers.final, ogrenciDers.proje, ogrenci.ogrenci_ad, ogrenci.ogrenci_soyad from ogrenciDers inner join ogrenci on ogrenciDers.ogrenciId=ogrenci.Id
where dersId=5 and vize=100and final=100 and proje=100 order by vize,final,proje, ogrenci.ogrenci_ad, ogrenci.ogrenci_soyad

/*6.Elektrik mühendsiliði bölümünden olup Öðretmeni Ýbrahim alýþkan olup vize notu 50 olanlarý listele.*/
select bolum_adi,ogretmen_adi,ogretmen_soyadi,ogrenciDers.vize from ogretmen inner join bolum on ogretmen.Id=bolum.Id
inner join ogrenciDers on ogretmen.Id=ogrenciDers.Id where ogretmen_adi='Ýbrahim' and ogretmen_soyadi='Alýþkan' and 
bolum_adi='Elektrik Elektronik Mühendisliði' and vize=50 order by bolum_adi,ogretmen_adi,ogretmen_soyadi,ogrenciDers.vize

/*7. vizeNotu 75,90,100 olanlarý getirsin. */
select vize from ogrenciDers where vize in(75,90,100)

/*8.Öðrenciders tablosunda vize notlarýný getir fakat notlar tekrar etmesin.*/
select distinct vize from ogrenciDers 

/*9.Öðrenciders tablosundan proje notu 90 olmayanlarý getir.*/
select proje from ogrenciDers where proje!=90

/*10.Öðrenci tablosundan final notunda (20,40,55) içermeyenleri listele. */
select final from ogrenciDers where final not in(20,40,55)/* bu sayýlarý içermeyenleri listeler*/

/*11.Öðrenciders tablosunda vize, final ve proje notlarýnýn ortalamasýný ayrý ayrý göster.*/
 select avg(vize), avg(final), avg(proje) from ogrenciDers 

/*12.Ogrenciders tablosundan min final notunu iç içe elect ile göster*/
select*from ogrenciDers where final=(select min(final) from ogrenciDers)

/*13.Öðretmen adý Seda veya bölüm tablosundan bölüm ýdsi 5 olaný getir */
select ogretmen_adi, bolumId from ogretmen where ogretmen_adi='Seda' or bolumId=5

/*14.bolum tablosundan Ý harfi ile baþlayan bölümleri listele*/
select*from bolum where bolum_adi like 'Ý_%' 

/*15.bolum tablosundan son harfi r harfi ile biten bölümleri listele*/
select*from bolum where bolum_adi like '%_i' 

/*16.ogrenci ders tablosundan toplam proje puanlarýnýn sayýsý*/
select sum(proje) as [proje notlarýnýn ortalamasý] from ogrenciDers

/*17.Ogretmen adý Nihat ve proje notu 80 den büyük olanlarý getir*/
select ogretmen_adi,proje from  ogretmen inner join  ogrenciDers on ogretmen.Id=ogrenciDers.ogrenciId
where ogretmen_adi='Nihat' and proje>80
/*18.Öðrenci adý ve soyadý yazacak ve final notu 60 dan büyük olanlarý göster.*/
select ogrenci_ad,ogrenci_soyad, final from ogrenciDers inner join ogrenci on ogrenciDers.Id=ogrenci.Id where final>60 order by final desc

/*19. Ogretmenders tablosundan soldaki tablonun tüm verilerini getir.*/
select*from ogretmenDers left join bolum on ogretmenDers.Id=bolum.Id 

/*20. Ogretmenders tablosundan saðdaki tablonun tüm verilerini getir.*/
select*from ogretmenDers right join bolum on ogretmenDers.Id=bolum.Id 

/*21.Ogretmenders tablosundan tüm tablonun tüm verilerini getir.*/
select*from ogretmenDers full join bolum on ogretmenDers.Id=bolum.Id 

/*22.Öðrenciders tablosundaki final notu 35 in üzerindeyse geçti, 35 in altýndaysa kaldý büte girmeli yazsýn*/
select* , case when final<35 then 'kaldý, büte girmeli ' else 'geçti' end as [geçme durumu] from ogrenciDers

/*23.Bölümlerin baþ harflerini yazdýr*/
select SUBSTRING(bolum_adi,1,1) [ilk harf], bolum_adi from bolum

/*24. bölüm adlarýnýn tüm harflerini büyük yap */
select upper(SUBSTRING(bolum_adi,1,1)) [ilk harf], upper(bolum_adi) from bolum

/*24. bölüm adlarýnýn tüm harflerini küçük yap */
select upper(SUBSTRING(bolum_adi,1,1)) [ilk harf], lower(bolum_adi) from bolum

/*25.ders tablosundan pediatri dersini, pediatri bölümü olarak deðiþtir*/
select replace(ders_adi,'pediatri','pediatri bölümü') from ders

/*26.Öðretmen tablosundan öðretmen adýný ve soyadýný tek sutunda yaz*/
select Concat(ogretmen_adi,' ',ogretmen_soyadi) from  ogretmen

/*27.Hangi isimden kaç öðrenci var*/
select ogrenci_ad,count(*) from ogrenci group by ogrenci_ad

/*28.*/
 select vize, AVG(final) FROM ogrenciDers where proje=100 GROUP BY vize HAVING AVG(final) > 80

/*29.Hangi bölüm en çok ders veriyor*/
select top 1 d.ders_adi, count(*) as sayi from ogretmenDers o
join ders d on o.dersId=d.Id group by d.ders_adi order by sayi desc

/*30. Öðrencileri en çok aldýðý dersten en az aldýðý derse doðru sýralayýnýz*/
select bolum_adi, count (*)  [öðrenci sayýsý] from bolum inner join ogrenci on bolum.Id=ogrenci.bolumId 
group by bolum_adi order by [öðrenci sayýsý] desc

/*31.Öðretmen tablosunda doðum yeri çatalca olup bilgisayar mühendisliði bölümünde okuyan öðrencilerin adý soyadý ve öðretmenlerin adý soyadýný ve bolum ve dogum yerinilisteleyin*/
select ogrenci.ogrenci_ad, ogrenci.ogrenci_soyad, ogretmen_adi, ogretmen_soyadi, bolum_adi, ogretmen.dogumyeri from bolum inner join ogretmen on bolum.Id=ogretmen.bolumId 
inner join ogrenci on bolum.Id=ogrenci.bolumId
where ogretmen.dogumyeri='Çatalca' and bolum_adi='Bilgisayar Mühendisliði' order by ogrenci.ogrenci_ad, ogrenci.ogrenci_soyad, ogretmen_adi, ogretmen_soyadi, bolum_adi, ogretmen.dogumyeri

/*32.bolumEkleyici adýnda prosedür oluþtur ve bolumad ve bolumeposta sýný mimarlýk ve mimarlýk@beun.edu.tr ekle*/
go 
create proc bolumEkleyici
(@bolumad nvarchar(20),
@bolumtel nvarchar(20))
as insert into bolum(bolum_adi,bolum.eposta)
values(@bolumad, @bolumtel)
go 
exec bolumEkleyici 'Mimarlýk Fakültesi','mimarlýk@beun.edu.tr'

select*from bolum

/*33.Notguncelle prosedürü yaz ve ogrenciders tablosundan vize, final ve proje notunu sýrasýyla 60,70,80 notlarýný ekle. */
go
create proc notEkle
(@vize int,
@final int,
@proje int)
as insert into ogrenciDers(vize,final,proje)
values(@vize,@final,@proje)
go
exec notEkle 60,70,80

select*from ogrenciDers

/*34.projeNotuEkle adýnda prosedür oluþtur ve ogrenci ders tablosundan proje notlarýna 10 puan düsür fakat proje notu 100 olanlar deðiþmesin*/
go
alter proc projeNotuEkle(
@proje int)
as update ogrenciDers set proje-=@proje where proje!=100
go
exec projeNotuEkle 10

select*from ogrenciDers

/*35.dýþarýdan girilen bolumu inþaat müh olan ve yine dýþarýdan girilen vize  notu 20 ve 60 arasýnda olanlarý getir */
go
create proc notGetir
(@bolumAdi nvarchar (30),
@Not1 int,
@Not2 int)
as select* from ogrenciDers inner join bolum on  ogrenciDers.Id=bolum.Id 
where bolum_adi=@bolumAdi and vize between @Not1 and @Not2
go
exec notGetir 'Ýnþaat Mühendisliði ',20,60

/*36. dýþarýdan alýnan ogretmen adý ve dogum yeri yazan bir procedur tanýmlayýnýz, */
go
create proc isimEkle
(@Adi nvarchar(20),
@dyeri nvarchar(100))
as insert into ogretmen(ogretmen_adi,dogumyeri) 
values(@Adi,@dyeri)
go
exec isimEkle 'Aysun','Silivri'
select*from ogretmen

/*37. ogrenci adýyla ogrenci silen store prosedür tasarlayýn*/
go
create proc ogrenciSil
(@ogrencisil nvarchar(20))
as 
	begin
		if exists (select*from ogrenci where ogrenci_ad=@ogrencisil)
	delete from ogrenci where ogrenci_ad=@ogrencisil
	end
	go
	exec ogrenciSil 'Cansel'
select*from ogrenci

/*39. ogrenci tablosuna eklenen son kaydýn detaylarýný gosteren trigger  */
alter trigger sonVeriler
on  ogrenci
after insert 
as
declare @sonId int
select @sonId=Id from inserted
select*from ogrenci where ogrenci.Id=@sonId
insert into ogrenci(ogrenci_ad,ogrenci_soyad) values ('reyhan','sündük')