--                               ODEV 5

--Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.

--film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi sıralayınız.
--film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en kısa (length) ikinci(6,7,8,9,10) 5 filmi(6,7,8,9,10) sıralayınız.
--customer tablosunda bulunan last_name sütununa göre azalan yapılan sıralamada store_id 1 olmak koşuluyla ilk 4 veriyi sıralayınız.


SELECT title FROM film
WHERE title LIKE '%n'
ORDER BY length DESC 
LIMIT 5;

---------------------------------

SELECT title FROM film
WHERE title LIKE '%n'
ORDER BY length ASC
OFFSET 5 
LIMIT 5;

---------------------------------

SELECT * FROM customer
WHERE store_id = 1
ORDER BY last_name ASC
LIMIT 4;

--                    ODEV 6

--film tablosunda bulunan rental_rate sütunundaki değerlerin ortalaması nedir?
--film tablosunda bulunan filmlerden kaç tanesi 'C' karakteri ile başlar?
--film tablosunda bulunan filmlerden rental_rate değeri 0.99 a eşit olan en uzun (length) film kaç dakikadır?
--film tablosunda bulunan filmlerin uzunluğu 150 dakikadan büyük olanlarına ait kaç farklı replacement_cost değeri vardır?

---------------------------------------------------
SELECT ROUND(AVG(rental_rate),2) FROM film;

---------------------------------------------------

SELECT COUNT(*) FROM film
WHERE title LIKE 'C%';

---------------------------------------------------

SELECT MAX(length) FROM film
WHERE rental_rate = 0.99;

---------------------------------------------------

SELECT DISTINCT rental_rate FROM film
WHERE length > 150;

---------------------------------------------------

--                   ODEV 7

--film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.

--film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda film 
--sayısı 50 den fazla olan replacement_cost değerini ve karşılık gelen film sayısını sıralayınız.

--3. customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir? 

--4. city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra en fazla
-- şehir sayısı barındıran country_id bilgisini ve şehir sayısını paylaşınız.

--------------------------------------------

SELECT title,rating FROM film
GROUP BY rating;

--------------------------------------------

SELECT replacement_cost, COUNT(*) FROM film
GROUP BY replacement_cost
HAVING COUNT(*) > 50;

--------------------------------------------
SELECT store_id, COUNT(*) FROM customer
GROUP BY store_id;

--------------------------------------------

SELECT country_id,COUNT(*) FROM city
GROUP BY country_id
ORDER BY  COUNT(*) DESC 
LIMIT 1;