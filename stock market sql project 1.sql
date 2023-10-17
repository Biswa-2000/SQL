
/*
stock data		@id        	@date   						open price     	  	  close price        high price            low price          			volume
				int		date of stock market data		decimal opening price     close price         highest price	    lowest price		int treding volume of stock (how many user)
						of stock on that date

news data		id 					#date 								news_title						  news containt							sentiment score
				int 			date of news(foregin key)			text(title of news article)		  text(containt of news article)		text +ve -ve neutral sentiment score of news

@----primary key				#----foreign key




q1- what is the sentiment score distribution of news article(percentage)
q2- what is the over all sentiment score of news articles for a perticular date range
q3- identify the top 5 articles with highest sentiment score
q4- list the company that dont have any sentiment score
q5- find out all the stocks that crossed the higest stock price value of 100.00 in the last 30 days
q6- find out all the stock prices whose number of digits after the decimal point number is greater than 3 for the opening stock price values
q7- find out all the news articles which contains the all vowel A,E,I,O,U in the contains
q8- find out all the stocks in which closing price is less than the lowest price and the date is in between 1st  to 10th day of month.
q9- find out all the stock prices in which a news article which contains the word 'banned' ensured that the highest stock price values is equal to closing stock price value and lowest stock price value is equal to the opening stock price value
q10- find out all the stocks which saw a decline in stock price because of the contains (bd negative banned forged)in news article

*/


create database sql_project1;
use sql_project1;



create table stock_data
(
stock_id int,
stock_date date,
open_price decimal(7,5),
close_price decimal(7,5),
high_price decimal(7,5),
low_price decimal(7,5),
volume int,
primary key(stock_id,stock_date)
);
CREATE INDEX idx_stock_date ON stock_data (stock_date);

insert into stock_data(stock_id,stock_date,open_price,close_price,high_price,low_price,volume) 
values(102,'2020-02-02',94.07,96.23,97.235,96.23,27),(115,'2022-04-16',85.14,94.00,97.13,84.7523,14),
(112,'2022-11-26',87.17,82.04,91.35,77.23,27),(105,'2020-05-24',74.757,69.74,76.347,65.377,13),
(122,'2021-11-25',87.584,85.35,88.35,84.3,14),(109,'2021-05-27',57.7,69.4,54.351,70.443,21),
(116,'2020-08-31',69.478,72.1794,78.6412,67.13,17),(111,'2020-02-12',27.77,19.443,29.3335,19.13,null),
(104,'2021-08-24',89.714,93.7334,94.3334,87.123,12),(121,'2022-03-18',84.578,92.784,94.11333,84.578,26),
(168,'2020-11-02',66.133,66.787,68.147,59.58,14),(117,'2021-07-17',69.4,77.2496,78,69.4,15),
(172,'2022-07-14',95.77,89.114,97.733,86.73,21),(149,'2020-06-07',84.0553,93.474,93.474,84.0553,29),
(146,'2020-04-19',32.04,24.84,34.145,24.73,01),(137,'2021-07-12',84.3577,89.74,91.351,83.478,28),
(134,'2021-07-04',26.97,23.78,27.433,21.98,null),(131,'2022-01-13',74.05,76.4,77.235,73.13,14),
(138,'2021-06-13',76.04,83.79,82.0,75.14,11),(151,'2020-04-29',39.195,28.74,39.35,24.13,09),
(150,'2022-07-22',79,81.55,82.59,72.47,16),(127,'2021-05-17',55.77,64.4,67.3993,53.1759,17),
(158,'2020-07-13',94.67,96.1433,97.54,92.7374,24),(119,'2022-08-15',24.05,19.754,24.05,19.03,null),
(128,'2022-05-12',74.247,71.7835,75.5,68.73,16),(167,'2021-06-17',84.47,89.5714,89.6,84.43,21),
(160,'2020-06-09',72.33,73.1,73.5,72.23,14),(143,'2020-03-15',79.07,86.474,87.392,78.473,17),
(136,'2020-04-07',55.63,59.358,61.7,52.347,08),(139,'2021-05-11',39.04,54.17,54.17,39.04,22),
(144,'2020-04-14',64.0,71.55,72.58,61.17,14),(151,'2022-08-07',62.147,59.4,62.232,58.1423,09),
(156,'2021-04-23',77.3,72.5,78.687,67.58,12),(167,'2020-07-09',45.757,56.753,57.145,45.757,16),
(162,'2021-11-19',65.833,74.234,77.575,61.58,13),(145,'2021-02-14',79.758,83.4,84.35,76.783,19),
(118,'2022-12-02',91.9633,87.1333,92.479,84.23,18),(177,'2022-12-13',79.478,89.4,90.135,72.473,17),
(154,'2022-04-01',96.436,95.98,98.2735,92.9234,25),(165,'2020-12-26',78.17,78.95,79.54,77.143,24),
(142,'2020-11-09',26.747,23.4,27.235,21.241,null),(157,'2022-03-14',68.177,68.915,69.154,67.1443,21),
(140,'2021-07-07',97.07,98.88,99.7338,96.83,29),(171,'2021-07-19',74.07,76.4,77.3233,72.13,18),
(147,'2020-02-02',94.07,96.23,99.35,96.23,27);


create table news_data
(
news_id int primary key,
news_date date,
news_title text,
news_contains text,
sentiment_score text , 
FOREIGN KEY (news_date) REFERENCES stock_data (stock_date)
);

insert into news_data(news_id,news_date,news_title,news_contains,sentiment_score)
values(25,'2021-07-07','IIFL Securities gains after huge block deal','For the June quarter, the company reported a 71.3 YoY percent increase in net profit at Rs 74.7 crore.','+ve'),
(27,'2020-04-07','Vodafone sinks as Q1 net loss widens to Rs 7,840 crore','The cash-strapped company said that it had received communication from a promoter group entity promising financial support of up to Rs 2,000 crore if required to meet payment obligations.','-ve'),
(39,'2020-04-29','IndiGo shares fly down 4.5% after Rs 4,837-cr share sale likely by Gangwal family','The Gangwal Family s ongoing stake negative exercise began in September last year after Rakesh Gangwal stepped down from the board of Interglobe Aviation in February 2022','-ve'),
(34,'2020-07-13','Tejas Networks shares up 6% on purchase order of Rs 7,492 crore from TCS','Tejas Networks shares were up 6 percent in early trade after the company executed the master contract with Tata Consultancy Services (TCS) towards supply, support, and annual maintenance services of Radio Access Network equipment for BSNL’s Pan-India 4G/5G network for approximately 100,000 sites.','+ve'),
(42,'2022-11-26','ITC shares gain on positive net profit numbers, valuations keep brokerages bullish on the stock','ITC shares were up 1.37 percent at Rs 455.35 after the FMCG conglomerate ITC reported a 17 percent increase in net profit for the June quarter over the last year at Rs 4,902.74 crore.','+ve'),
(35,'2022-08-07','Adani stocks decline, group market cap falls by Rs 25,000 crore','Shares of Adani Enterprises, the group flagship company, fell as much as 5.4% in early trades Monday before closing 3.3% lower at ₹2,456. Adani Ports & SEZ shares banned almost 2% to close at ₹787.','-ve'),
(47,'2021-05-27','Subhash Chandra, Punit Goenka cannot hold director position in group cos: Sebi','The Zee stock has climbed more than 13% in the past five trading sessions after the NCLT approved its merger with Sony. The bulk of the recent gains at Zee, which has a market capitalization in excess of ₹26,000 crore, is attributed to investor optimism that regulators would approve the merger.','+ve'),
(37,'2021-05-11','Popular cough syrups banned shelves after India bans 14 fixed dose drug combinations','In a move which was in the making for the past few months, the government citing lack of therapeutic rationale banned several medicines used to treat coughs, colds and respiratory infections. It clamped down mainly on cough syrups, banning at least 10 combinations available in the market including all those that contain codeine, an opioid pain reliever.','neutral'),
(41,'2022-12-13','Double-digit growth could become difficult this year, see momentum once uncertainty ends: TCS CEO Krithivasan','The TCS CEO expects growth momentum to return once uncertainty ends in major markets such as the US and added that they will have better visibility in the second half of the year in a quarter or two.','-ve'),
(33,'2020-06-09','Bharat Biotech recalls batch of its rabies vaccine due to theft of several vials','Bharat Biotech stressed that this voluntary action is being taken in accordance with the principle of abundant precaution, keeping patient safety and the public interest in mind.','+ve');



show tables;

drop table news_data;
drop index idx_stock_date on stock_data ; 
drop table stock_data;

select* from stock_data;
select* from news_data;
select news_date, sentiment_score from news_data;



#q1- what is the sentiment score distribution of news article(percentage)



#q2- what is the over all sentiment score of news articles for a perticular date range

SELECT avg(CASE WHEN sentiment_score = '+ve' THEN 1
				WHEN sentiment_score = '-ve' THEN -1
				ELSE 0 
				END) AS overall_sentiment_score
FROM news_data
WHERE news_date BETWEEN '2020-05-07' AND '2021-05-10';



#q3- identify the top 5 articles with highest sentiment score

SELECT  news_title, CASE WHEN sentiment_score = '+ve' THEN 1
				WHEN sentiment_score = '-ve' THEN -1
				ELSE 0 
				END as sentiment_score
FROM news_data
ORDER BY sentiment_score DESC
LIMIT 5;


#q4- list the company that dont have any sentiment score(company name means company stock id)

SELECT sd.stock_id
FROM stock_data sd
left JOIN news_data nd ON sd.stock_date = nd.news_date
WHERE nd.sentiment_score IS NULL
GROUP BY sd.stock_id
order by sd.stock_id desc;



#	q5- find out all the stocks that crossed the higest stock price value of 90.00 in the last 360 days

SELECT stock_id ,high_price
FROM stock_data
WHERE stock_date >= (CURRENT_DATE - INTERVAL 360 DAY)
AND high_price > 90.00;



#q6- find out all the stock prices whose number of digits after the decimal point number is greater than 3 for the opening stock price values




#	q7- find out all the news articles which contains the all vowel A,E,I,O,U in the contains

SELECT news_title
FROM news_data
WHERE news_title LIKE '%A%' 
  AND news_title LIKE '%E%' 
  AND news_title LIKE '%I%' 
  AND news_title LIKE '%O%' 
  AND news_title LIKE '%U%'
  ;
  

#q8- find out all the stocks in which closing price is less than the lowest price and the date is in between 1st  to 10th day of month.

SELECT stock_id, stock_date, close_price, low_price
FROM stock_data
WHERE EXTRACT(DAY FROM stock_date) BETWEEN 1 AND 10
AND close_price < low_price;


#q9- find out all the stock prices in which a news article which contains the word 'banned' ensured that the highest stock price values is equal to closing stock price value and lowest stock price value is equal to the opening stock price value

SELECT sd.stock_id, sd.stock_date, sd.open_price, sd.close_price, sd.high_price, sd.low_price, nd.news_contains
FROM stock_data sd
INNER JOIN news_data nd ON sd.stock_date = nd.news_date
WHERE nd.news_contains LIKE '%banned%' 
  AND sd.high_price = sd.close_price 
  AND sd.low_price = sd.open_price;
  
  
#q10- find out all the stocks which saw a decline in stock price because of the contains (bd negative banned forged)in news article

SELECT sd.stock_id, sd.stock_date, sd.close_price, nd.news_contains
FROM stock_data sd
INNER JOIN news_data nd ON sd.stock_date = nd.news_date
WHERE (nd.news_contains LIKE '%bad%' 
    OR nd.news_contains LIKE '%negative%' 
    OR nd.news_contains LIKE '%banned%' 
    OR nd.news_contains LIKE '%forged%')
  AND sd.close_price < sd.open_price;

