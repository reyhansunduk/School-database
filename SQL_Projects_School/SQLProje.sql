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

/*1.��retmen tablosundan soyismi Kaya yrine ustaba� olarak de�i�tir. */
update ogretmen set ogretmen_soyadi='ustaba�' where ogretmen_soyadi='kaya'   

/*2.��rencilerin mak vize notlar�n� yazd�r*/
select max(ogrenciDers.vize) as [en yuksek not] from ogrenciDers  

/*3.En y�ksek proje notuna sahip 5 ki�iyi g�ster.*/
select  top 5 ogrenciDers.proje from ogrenciDers order by proje desc

/*4.En y�ksek proje notuna sahip 5 ki�iyi g�ster.*/
select  top 5 ogrenciDers.proje from ogrenciDers order by proje asc

/*5.Vize final ve proje notu 100 olup, dersi�d si 5 olan ��rencileri listele*/
select ogrenciDers.vize,ogrenciDers.final, ogrenciDers.proje, ogrenci.ogrenci_ad, ogrenci.ogrenci_soyad from ogrenciDers inner join ogrenci on ogrenciDers.ogrenciId=ogrenci.Id
where dersId=5 and vize=100and final=100 and proje=100 order by vize,final,proje, ogrenci.ogrenci_ad, ogrenci.ogrenci_soyad

/*6.Elektrik m�hendsili�i b�l�m�nden olup ��retmeni �brahim al��kan olup vize notu 50 olanlar� listele.*/
select bolum_adi,ogretmen_adi,ogretmen_soyadi,ogrenciDers.vize from ogretmen inner join bolum on ogretmen.Id=bolum.Id
inner join ogrenciDers on ogretmen.Id=ogrenciDers.Id where ogretmen_adi='�brahim' and ogretmen_soyadi='Al��kan' and 
bolum_adi='Elektrik Elektronik M�hendisli�i' and vize=50 order by bolum_adi,ogretmen_adi,ogretmen_soyadi,ogrenciDers.vize

/*7. vizeNotu 75,90,100 olanlar� getirsin. */
select vize from ogrenciDers where vize in(75,90,100)

/*8.��renciders tablosunda vize notlar�n� getir fakat notlar tekrar etmesin.*/
select distinct vize from ogrenciDers 

/*9.��renciders tablosundan proje notu 90 olmayanlar� getir.*/
select proje from ogrenciDers where proje!=90

/*10.��renci tablosundan final notunda (20,40,55) i�ermeyenleri listele. */
select final from ogrenciDers where final not in(20,40,55)/* bu say�lar� i�ermeyenleri listeler*/

/*11.��renciders tablosunda vize, final ve proje notlar�n�n ortalamas�n� ayr� ayr� g�ster.*/
 select avg(vize), avg(final), avg(proje) from ogrenciDers 

/*12.Ogrenciders tablosundan min final notunu i� i�e elect ile g�ster*/
select*from ogrenciDers where final=(select min(final) from ogrenciDers)

/*13.��retmen ad� Seda veya b�l�m tablosundan b�l�m �dsi 5 olan� getir */
select ogretmen_adi, bolumId from ogretmen where ogretmen_adi='Seda' or bolumId=5

/*14.bolum tablosundan � harfi ile ba�layan b�l�mleri listele*/
select*from bolum where bolum_adi like '�_%' 

/*15.bolum tablosundan son harfi r harfi ile biten b�l�mleri listele*/
select*from bolum where bolum_adi like '%_i' 

/*16.ogrenci ders tablosundan toplam proje puanlar�n�n say�s�*/
select sum(proje) as [proje notlar�n�n ortalamas�] from ogrenciDers

/*17.Ogretmen ad� Nihat ve proje notu 80 den b�y�k olanlar� getir*/
select ogretmen_adi,proje from  ogretmen inner join  ogrenciDers on ogretmen.Id=ogrenciDers.ogrenciId
where ogretmen_adi='Nihat' and proje>80
/*18.��renci ad� ve soyad� yazacak ve final notu 60 dan b�y�k olanlar� g�ster.*/
select ogrenci_ad,ogrenci_soyad, final from ogrenciDers inner join ogrenci on ogrenciDers.Id=ogrenci.Id where final>60 order by final desc

/*19. Ogretmenders tablosundan soldaki tablonun t�m verilerini getir.*/
select*from ogretmenDers left join bolum on ogretmenDers.Id=bolum.Id 

/*20. Ogretmenders tablosundan sa�daki tablonun t�m verilerini getir.*/
select*from ogretmenDers right join bolum on ogretmenDers.Id=bolum.Id 

/*21.Ogretmenders tablosundan t�m tablonun t�m verilerini getir.*/
select*from ogretmenDers full join bolum on ogretmenDers.Id=bolum.Id 

/*22.��renciders tablosundaki final notu 35 in �zerindeyse ge�ti, 35 in alt�ndaysa kald� b�te girmeli yazs�n*/
select* , case when final<35 then 'kald�, b�te girmeli ' else 'ge�ti' end as [ge�me durumu] from ogrenciDers

/*23.B�l�mlerin ba� harflerini yazd�r*/
select SUBSTRING(bolum_adi,1,1) [ilk harf], bolum_adi from bolum

/*24. b�l�m adlar�n�n t�m harflerini b�y�k yap */
select upper(SUBSTRING(bolum_adi,1,1)) [ilk harf], upper(bolum_adi) from bolum

/*24. b�l�m adlar�n�n t�m harflerini k���k yap */
select upper(SUBSTRING(bolum_adi,1,1)) [ilk harf], lower(bolum_adi) from bolum

/*25.ders tablosundan pediatri dersini, pediatri b�l�m� olarak de�i�tir*/
select replace(ders_adi,'pediatri','pediatri b�l�m�') from ders

/*26.��retmen tablosundan ��retmen ad�n� ve soyad�n� tek sutunda yaz*/
select Concat(ogretmen_adi,' ',ogretmen_soyadi) from  ogretmen

/*27.Hangi isimden ka� ��renci var*/
select ogrenci_ad,count(*) from ogrenci group by ogrenci_ad

/*28.*/
 select vize, AVG(final) FROM ogrenciDers where proje=100 GROUP BY vize HAVING AVG(final) > 80

/*29.Hangi b�l�m en �ok ders veriyor*/
select top 1 d.ders_adi, count(*) as sayi from ogretmenDers o
join ders d on o.dersId=d.Id group by d.ders_adi order by sayi desc

/*30. ��rencileri en �ok ald��� dersten en az ald��� derse do�ru s�ralay�n�z*/
select bolum_adi, count (*)  [��renci say�s�] from bolum inner join ogrenci on bolum.Id=ogrenci.bolumId 
group by bolum_adi order by [��renci say�s�] desc

/*31.��retmen tablosunda do�um yeri �atalca olup bilgisayar m�hendisli�i b�l�m�nde okuyan ��rencilerin ad� soyad� ve ��retmenlerin ad� soyad�n� ve bolum ve dogum yerinilisteleyin*/
select ogrenci.ogrenci_ad, ogrenci.ogrenci_soyad, ogretmen_adi, ogretmen_soyadi, bolum_adi, ogretmen.dogumyeri from bolum inner join ogretmen on bolum.Id=ogretmen.bolumId 
inner join ogrenci on bolum.Id=ogrenci.bolumId
where ogretmen.dogumyeri='�atalca' and bolum_adi='Bilgisayar M�hendisli�i' order by ogrenci.ogrenci_ad, ogrenci.ogrenci_soyad, ogretmen_adi, ogretmen_soyadi, bolum_adi, ogretmen.dogumyeri

/*32.bolumEkleyici ad�nda prosed�r olu�tur ve bolumad ve bolumeposta s�n� mimarl�k ve mimarl�k@beun.edu.tr ekle*/
go 
create proc bolumEkleyici
(@bolumad nvarchar(20),
@bolumtel nvarchar(20))
as insert into bolum(bolum_adi,bolum.eposta)
values(@bolumad, @bolumtel)
go 
exec bolumEkleyici 'Mimarl�k Fak�ltesi','mimarl�k@beun.edu.tr'

select*from bolum

/*33.Notguncelle prosed�r� yaz ve ogrenciders tablosundan vize, final ve proje notunu s�ras�yla 60,70,80 notlar�n� ekle. */
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

/*34.projeNotuEkle ad�nda prosed�r olu�tur ve ogrenci ders tablosundan proje notlar�na 10 puan d�s�r fakat proje notu 100 olanlar de�i�mesin*/
go
alter proc projeNotuEkle(
@proje int)
as update ogrenciDers set proje-=@proje where proje!=100
go
exec projeNotuEkle 10

select*from ogrenciDers

/*35.d��ar�dan girilen bolumu in�aat m�h olan ve yine d��ar�dan girilen vize  notu 20 ve 60 aras�nda olanlar� getir */
go
create proc notGetir
(@bolumAdi nvarchar (30),
@Not1 int,
@Not2 int)
as select* from ogrenciDers inner join bolum on  ogrenciDers.Id=bolum.Id 
where bolum_adi=@bolumAdi and vize between @Not1 and @Not2
go
exec notGetir '�n�aat M�hendisli�i ',20,60

/*36. d��ar�dan al�nan ogretmen ad� ve dogum yeri yazan bir procedur tan�mlay�n�z, */
go
create proc isimEkle
(@Adi nvarchar(20),
@dyeri nvarchar(100))
as insert into ogretmen(ogretmen_adi,dogumyeri) 
values(@Adi,@dyeri)
go
exec isimEkle 'Aysun','Silivri'
select*from ogretmen

/*37. ogrenci ad�yla ogrenci silen store prosed�r tasarlay�n*/
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

/*39. ogrenci tablosuna eklenen son kayd�n detaylar�n� gosteren trigger  */
alter trigger sonVeriler
on  ogrenci
after insert 
as
declare @sonId int
select @sonId=Id from inserted
select*from ogrenci where ogrenci.Id=@sonId
insert into ogrenci(ogrenci_ad,ogrenci_soyad) values ('reyhan','s�nd�k')