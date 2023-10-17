
/* table name									column names

1-promotion           		    @promotion id        promotion name       start date           end date        discount percentage
2- catgories         			@catgory id         catgory name    
3- products            			     id                  name               price             #catgory id 
4- users           				   @userd id           password            user name             email
5-user roles          			  role id             role name
6- user promo usages 			   usage id           #user id            #promotion id          usage date

@ primary key      # foregin key

          QUESTIONS
q1- how retrive all promotion from promotion tables
q2- how to find promotion with higest discount percentage
q3- how to gate total count active promotion which have happend between 1st aug 2019 6.30pm to 1st august 2022 7.39.33 sec.alter
q4- how to calculate average discount percentage across all promotion
	q5-how to add a new product in products table in which the catagory id is a prime number
q6- how to update a price of a specific product in product  table where the product id is a multiple of a product catagory id
q7-how to delte a product from product table where the catagory id is a multiple of price and price is greater than 5000
q8- how to retrive all products from a specific catagory in the product tables
	q9- how to create a new role in the users role table in which the length of the role name is 6 characters and its starts with a number which is greater than 5 and it ends with character whose ascci value is greater than 75
q10- how to find the total count of promotion used by each users from user promo usages table
q11-how to calculate the total number of users who have used promotions in last 180 dates  from user promo usages table
	q12- how to create a entry in the users table where the pasword starts with a special character and ends with a space and the 5th character is a multiple of two
q13- how to delete a user from users table where email id conatins gmail.com yahoo.com and 'com' start from 10th character.
q14-how to retrive all promotions that have not been used before 28th september 2021 and the month of usage date should always be a month which has 31days
	q15- create a trigger which will be before insert trigger or after insert trigger where before inserting any daat in user promo usages table
			data 1st has to be inserted into user table and promotion table provided user id is always less than promotion id and user id is a multiple of 5 and promotion id is a multiple of 10 
						and the usage id will be in between promotion id and user id which will be a multiple of 3 and the usage date should have a value which is in between  the last leap year and the last day of the last quater.
*/








create database sql_project2;
use sql_project2;
show tables;




create table promotion
(promotion_id int ,
promotion_name text ,
start_date datetime ,
end_date datetime,
dis_percent int,
primary key (promotion_id)
);

insert into promotion(promotion_id,promotion_name,start_date,end_date,dis_percent)
values(51,'Indipendence day sale','2023-08-12 12:00:01','2023-08-14 11:59:59',60),
(55,'Great indian festival sale','2022-11-02 08:00:01','2022-11-11 10:00:00',70),
(72,'Prime day sale','2023-05-12 06:45:01','2023-05-19 11:59:59',75),
(64,'Dusheera sale','2022-10-12 12:00:01','2022-10-18 11:30:00',60),
(87,'Republic day sale','2023-01-22 07:30:01','2023-01-25 09:59:59',60),
(77,'New year sale','2022-12-25 12:00:01','2022-12-31 10:30:59',50),
(95,'Indipendence day sale','2023-08-12 12:00:01','2023-08-14 11:59:59',60),
(45,'Great indian festival sale','2021-11-05 12:30:01','2021-11-12 11:59:59',70),
(32,'Prime day sale','2022-05-09 12:30:01','2022-05-18 11:59:59',75),
(24,'Dusheera sale','2021-10-11 06:00:01','2021-10-17 11:59:59',60),
(37,'Republic day sale','2022-01-22 12:00:01','2022-01-25 11:00:00',60),
(47,'New year sale','2021-12-25 07:00:01','2021-12-31 10:59:30',50);

create table catagories
(
catagory_id int,
catagory_name text,
primary key(catagory_id)
);
insert into catagories(catagory_id,catagory_name)
values(113,'moobiles computers'),
(112,'electronics'),
(115,'clothes'),
(117,'kitchen applinces'),
(119,'sports'),
(118,'grocery');

create table products
(
product_id int,
product_name text,
product_price decimal(10,4),
catagory_id int,
FOREIGN KEY (catagory_id) REFERENCES catagories (catagory_id)
);
insert into products(product_id,product_name,product_price,catagory_id)
values(5112,'Xiaomi 12 Pro',15000,113),
(5152,'LG 2.0 Ton 3 Star AI DUAL Inverter Split AC',35999,112),
(6175,'Samsung Galaxy M04 Light Green',22999,113),
(7142,'Mens Round Neck Cotton Blend Half Sleeve T-Shirts',5290,115),
(6457,'Cricket Kit Bag, Army Color',1350,119),
(5746,'Mens Slim Fit Washed Jeans Stretchable',1299,115),
(5759,'Smart Glass Top 2 Burner Open Gas Stove',2389,117),
(6174,'HP All-in-One PC Intel',45000,113),
(6571,'Teso Pro Lunch Box with Insulated Bag',999,117),
(6478,'Cotton Straight Fit Womens Kurta',700,115);

create table users
(
user_id varchar(12),
user_pass text,
user_name text,
email_id text,
primary key (user_id)
);
insert into users(user_id,user_pass,user_name,email_id)
values('25AMZ44721','@Chandu 1#','Chandan Mohanty','mohantychandu143@gmail.com'),
('29AMZ98745','$K KSahu#89','Kirti Kalmal Sahu','sahu.kirtikamal@proton.com'),
('26AMZ75486','Raj@147$','Jatin Raj','rajjatin5@gmail.com'),
('28AMZ14754','@58 Rahul','Rahul Bala','rahulbala058@gmail.com'),
('27AMZ45874','Sahoo89#SB','Soubhagya Sahoo','souvhagyasahoo89@yahoo.com'),
('28AMZ96475','rahul!rout27','Rahulendra Rout','rahulendrarout48@gmail.com'),
('24AMZ24785','Swain95@Ajesh','Ajesh Swain','ajesh.swain95@outlook.com'),
('34AMZ14759','06Gupta@P08','Preety Gupta','preetygupta0608@yahoo.com'),
('24AMZ15762','Lipsa!% rani01','Lipsarani Mathan','lipsaranimathan1@proton.com'),
('25AMZ97581','06cute @sonu','Srinivas Sahoo','sonusahoo6@outlook.com');

create table user_promo_usages
(
usage_id int,
user_id varchar(12),
promotion_id int,
usage_date datetime,
FOREIGN KEY (user_id) REFERENCES users (user_id),
FOREIGN KEY (promotion_id) REFERENCES promotion (promotion_id)
);
insert into user_promo_usages(usage_id,user_id,promotion_id,usage_date)
values(551,'25AMZ44721',72,'2023-05-13 18:42:57'),
(624,'29AMZ98745',55,'2022-11-04 14:55:09'),
(678,'27AMZ45874',64,'2022-10-13 08:07:51'),
(657,'26AMZ75486',87,'2023-01-24 08:25:08'),
(758,'28AMZ14754',32,'2022-05-09 20:37:45'),
(428,'25AMZ97581',72,'2023-05-14 19:12:00'),
(963,'24AMZ24785',37,'2022-01-23 23:49:34'),
(314,'27AMZ45874',47,'2021-12-28 12:08:04'),
(458,'26AMZ75486',64,'2022-10-14 12:00:01'),
(553,'25AMZ44721',72,'2023-05-13 07:34:41'),
(559,'25AMZ44721',77,'2022-12-26 16:00:01');

create table user_roles
(
role_id int,
role_name text
);
insert into user_roles(role_id,role_name)
values(1154752,'585as88d@18'),(17584752,'sxsu54487#dsdc');


select * from user_roles ; 		# promotion          catagories		products    users      user_roles     user_promo_usages 
drop table user_roles ;





#q1- how retrive all promotion from promotion tables
 SELECT promotion_name 
 FROM promotion;


#q2- how to find promotion with higest discount percentage
SELECT promotion_name,dis_percent 
FROM promotion 
ORDER BY dis_percent DESC LIMIT 1;


#q3- how to gate total count active promotion which have happend between 1st aug 2019 6.30pm to 1st august 2022 7.39.33 sec.alter
SELECT COUNT(*) as active_promotion 
FROM promotion  
WHERE 	start_date >= '2019-08-01 18:30:00' 
		AND end_date <= '2022-08-01 19:39:33' ;


#q4- how to calculate average discount percentage across all promotion
SELECT AVG(dis_percent) 
FROM promotion;


#q5-how to add a new product in products table in which the catagory id is a prime number




#q6- how to update a price of a specific product in product  table where the product id is a multiple of a product catagory id
UPDATE products
SET product_price = 10
WHERE product_id % catagory_id = 0 ;
select * from products;


#q7-how to delte a product from product table where the catagory id is a multiple of price and price is greater than 5000
DELETE FROM products 
WHERE catagory_id % product_price = 0 
AND product_price > 5000;


#q8- how to retrive all products from a specific catagory in the product tables
SELECT * FROM products 
WHERE catagory_id = 115;


#q9- how to create a new role in the users role table in which the length of the role name is 6 characters and its starts with a number which is greater than 5 and it ends with character whose ascci value is greater than 75




#q10- how to find the total count of promotion used by each users from user promo usages table
SELECT user_id, COUNT(*) AS total_promotions_used 
FROM user_promo_usages 
GROUP BY user_id 
order by total_promotions_used desc ;


#q11-how to calculate the total number of users who have used promotions in last 180 dates  from user promo usages table
SELECT COUNT(DISTINCT user_id) as number 
FROM user_promo_usages 
WHERE usage_date >= (CURDATE() - INTERVAL 180 DAY);


#q12- how to create a entry in the users table where the pasword starts with a special character and ends with a space and the 5th character is a multiple of two



#q13- how to delete a user from users table where email id conatins gmail.com yahoo.com and 'com' start from 10th character.
DELETE FROM users 
WHERE 	SUBSTRING(email_id, 10, 3) = 'com' 
		AND (email_id LIKE '%gmail.com%' OR email_id LIKE '%yahoo.com%');


#q14-how to retrive all promotions that have not been used before 28th september 2021 and the month of usage date should always be a month which has 31days
SELECT p.*,up.usage_date
FROM promotion p
LEFT JOIN user_promo_usages up ON p.promotion_id = up.promotion_id
WHERE up.usage_date < '2021-09-28'
AND (DAYOFMONTH(up.usage_date) <= 31 AND DAYOFMONTH(DATE_ADD(up.usage_date, INTERVAL 31 DAY)) = DAYOFMONTH(up.usage_date));


#q15- create a trigger which will be before insert trigger or after insert trigger where before inserting any daat in user promo usages table
#			data 1st has to be inserted into user table and promotion table provided user id is always less than promotion id and user id is a multiple of 5 and promotion id is a multiple of 10 
#						and the usage id will be in between promotion id and user id which will be a multiple of 3 and the usage date should have a value which is in between  the last leap year and the last day of the last quater.
