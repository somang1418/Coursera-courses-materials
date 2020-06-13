Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000 
ii. Business table = 10000 
iii. Category table = 10000 
iv. Checkin table = 10000 
v. elite_years table = 10000 
vi. friend table = 10000 
vii. hours table = 10000 
viii. photo table = 10000 
ix. review table = 10000 
x. tip table = 10000 
xi. user table = 10000 
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000 
ii. Hours = 1562 
iii. Category = 2643 
iv. Attribute = 1115 
v. Review = id (primary key) = 10000  ,business_id (foreigh key 1) = 8090 , user_id (foreigh key 2) = 9581 
vi. Checkin = 493 
vii. Photo = id (primary key) = 10000, business id (foreign key) = 6493 
viii. Tip = business_id (foreigh key 1) = 3979 , user_id (foreigh key 2) = 537  
ix. User = 10000
x. Friend = 11 
xi. Elite_years = 2780 

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: "No"
	
	
	SQL code used to arrive at answer:
	
	/*make new variables to count null value. If there's null, null becomes 1 (using by case when statement) 
	and sum it up to check the total number of null in an attribute */ 
	
	select 
    sum(case when name is null then 1 else 0 end) as Column_1, 
    sum(case when review_count is null then 1 else 0 end) as Column_2, 
    sum(case when yelping_since is null then 1 else 0 end) as Column_3, 
    sum(case when useful is null then 1 else 0 end) as Column_4, 
    sum(case when funny is null then 1 else 0 end) as Column_5, 
    sum(case when cool is null then 1 else 0 end) as Column_6,
    sum(case when fans is null then 1 else 0 end) as Column_7, 
    sum(case when average_stars is null then 1 else 0 end) as Column_8, 
    sum(case when compliment_hot is null then 1 else 0 end) as Column_9,
    sum(case when compliment_more is null then 1 else 0 end) as Column_10,
    sum(case when compliment_profile is null then 1 else 0 end) as Column_11,
    sum(case when compliment_cute is null then 1 else 0 end) as Column_12,
    sum(case when compliment_list is null then 1 else 0 end) as Column_13,
    sum(case when compliment_note is null then 1 else 0 end) as Column_14,
    sum(case when compliment_plain is null then 1 else 0 end) as Column_15,
    sum(case when compliment_cool is null then 1 else 0 end) as Column_16,
    sum(case when compliment_funny is null then 1 else 0 end) as Column_17,
    sum(case when compliment_writer is null then 1 else 0 end) as Column_18,
    sum(case when compliment_photos is null then 1 else 0 end) as Column_19
    FROM  user -- by the way, I think there is a typo in the prompt (Users table --> User table) 
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:	1	max:	5	avg: 3.7082 
		
	
	ii. Table: Business, Column: Stars
	
		min:	1	max:	5	avg: 3.6549 
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max:   2		avg: 0.0144 
		
	
	iv. Table: Checkin, Column: Count
	
		min:	1	max:	53	avg: 1.9414 
		
	
	v. Table: User, Column: Review_count
	
		min:	0	max: 2000 		avg: 24.2995 
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
/* summing review counts by city and order it in descending order */

SELECT city, SUM(review_count) AS total_review_count FROM business 
GROUP BY city 
ORDER BY total_review_count DESC 

	
	Copy and Paste the Result Below:

+-----------------+--------------------+
| city            | total_review_count |
+-----------------+--------------------+
| Las Vegas       |              82854 |
| Phoenix         |              34503 |
| Toronto         |              24113 |
| Scottsdale      |              20614 |
| Charlotte       |              12523 |
| Henderson       |              10871 |
| Tempe           |              10504 |
| Pittsburgh      |               9798 |
| Montréal        |               9448 |
| Chandler        |               8112 |
| Mesa            |               6875 |
| Gilbert         |               6380 |
| Cleveland       |               5593 |
| Madison         |               5265 |
| Glendale        |               4406 |
| Mississauga     |               3814 |
| Edinburgh       |               2792 |
| Peoria          |               2624 |
| North Las Vegas |               2438 |
| Markham         |               2352 |
| Champaign       |               2029 |
| Stuttgart       |               1849 |
| Surprise        |               1520 |
| Lakewood        |               1465 |
| Goodyear        |               1155 |
+-----------------+--------------------+
(Output limit exceeded, 25 of 362 total rows shown)
	
6. Find the distribution of star ratings to the business in the following cities:


/* see the breakdown of stars and count for each breakdown*/


i. Avon

SQL code used to arrive at answer:

SELECT stars,
	   COUNT(*) AS star_count
	   FROM business
	   WHERE city = 'Avon'
	   GROUP BY stars		
	
Copy and Paste the Resulting Table Below (2 columns – star rating and count):

+-------+------------+
| stars | star_count |
+-------+------------+
|   1.5 |          1 |
|   2.5 |          2 |
|   3.5 |          3 |
|   4.0 |          2 |
|   4.5 |          1 |
|   5.0 |          1 |
+-------+------------+

ii. Beachwood

SQL code used to arrive at answer:

SELECT stars,
	   COUNT(*) AS star_count
	   FROM business
	   WHERE city = 'Beachwood'
	   GROUP BY stars		
	

Copy and Paste the Resulting Table Below (2 columns – star rating and count):
	

+-------+------------+
| stars | star_count |
+-------+------------+
|   2.0 |          1 |
|   2.5 |          1 |
|   3.0 |          2 |
|   3.5 |          2 |
|   4.0 |          1 |
|   4.5 |          2 |
|   5.0 |          5 |
+-------+------------


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:

/* select id, name, review count, order by review count in descending order, select top 3 by using limit */


SELECT id,name,review_count from user 
ORDER BY review_count DESC
limit 3


		
Copy and Paste the Result Below:
		
+------------------------+--------+--------------+
| id                     | name   | review_count |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
+------------------------+--------+--------------+

8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:

Yes, more reviews somewhat moderately has a positive correlation with more fans. However, it also relates to how long a user uses yelp as well.  

/* put order by the number of fans in descending order and see the relationship */

SELECT id, name, review_count, fans, yelping_since from user 
ORDER BY fans DESCC

+------------------------+-----------+--------------+------+---------------------+
| id                     | name      | review_count | fans | yelping_since       |
+------------------------+-----------+--------------+------+---------------------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |          609 |  503 | 2007-07-19 00:00:00 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 | 2011-03-30 00:00:00 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 | 2012-11-27 00:00:00 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 | 2012-12-16 00:00:00 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 | 2009-07-08 00:00:00 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |          813 |  159 | 2009-10-05 00:00:00 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |          377 |  133 | 2009-02-05 00:00:00 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 | 2015-02-19 00:00:00 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |          862 |  124 | 2012-04-05 00:00:00 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |          834 |  120 | 2007-08-14 00:00:00 |
| -B-QEUESGWHPE_889WJaeg | Mark      |          861 |  115 | 2009-05-31 00:00:00 |
| -DmqnhW4Omr3YhmnigaqHg | Tiffany   |          408 |  111 | 2008-10-28 00:00:00 |
| -cv9PPT7IHux7XUc9dOpkg | bernice   |          255 |  105 | 2007-08-29 00:00:00 |
| -DFCC64NXgqrxlO8aLU5rg | Roanna    |         1039 |  104 | 2006-03-28 00:00:00 |
| -IgKkE8JvYNWeGu8ze4P8Q | Angela    |          694 |  101 | 2010-10-01 00:00:00 |
| -K2Tcgh2EKX6e6HqqIrBIQ | .Hon      |         1246 |  101 | 2006-07-19 00:00:00 |
| -4viTt9UC44lWCFJwleMNQ | Ben       |          307 |   96 | 2007-03-10 00:00:00 |
| -3i9bhfvrM3F1wsC9XIB8g | Linda     |          584 |   89 | 2005-08-07 00:00:00 |
| -kLVfaJytOJY2-QdQoCcNQ | Christina |          842 |   85 | 2012-10-08 00:00:00 |
| -ePh4Prox7ZXnEBNGKyUEA | Jessica   |          220 |   84 | 2009-01-12 00:00:00 |
| -4BEUkLvHQntN6qPfKJP2w | Greg      |          408 |   81 | 2008-02-16 00:00:00 |
| -C-l8EHSLXtZZVfUAUhsPA | Nieves    |          178 |   80 | 2013-07-08 00:00:00 |
| -dw8f7FLaUmWR7bfJ_Yf0w | Sui       |          754 |   78 | 2009-09-07 00:00:00 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |   76 | 2008-01-03 00:00:00 |
| -0zEEaDFIjABtPQni0XlHA | Nicole    |          161 |   73 | 2009-04-30 00:00:00 |
+------------------------+-----------+--------------+------+---------------------+
(Output limit exceeded, 25 of 10000 total rows shown)



	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:
There are more comments that include the word "love" than comments with the word "hate". 

+--------------+--------------+
| hate_comment | love_comment |
+--------------+--------------+
|          232 |         1780 |
+--------------+--------------+

	
	SQL code used to arrive at answer:

/* counting comments that includes hate and love by count and case when statement */

SELECT COUNT(CASE WHEN text LIKE '%hate%' THEN text END) as hate_comment,
      COUNT(CASE WHEN text LIKE '%love%' THEN text END) as love_comment
     FROM review 
	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
SELECT id, name, fans FROM user 
ORDER BY fans DESC 
LIMIT 10

	
	Copy and Paste the Result Below:

	+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+
	
11. Is there a strong relationship (or correlation) between having a high number of fans and being listed as "useful" or "funny?" Out of the top 10 users with the highest number of fans, what percent are also listed as “useful” or “funny”?

Key:
0% - 25% - Low relationship
26% - 75% - Medium relationship
76% - 100% - Strong relationship
	
	SQL code used to arrive at answer:

/* order by the number of fans in descending order and see funny and useful attributes */	
SELECT id, name, fans, funny, useful FROM user 
ORDER BY fans DESC 
LIMIT 10 
	
	Copy and Paste the Result Below:

	+------------------------+-----------+------+--------+--------+
| id                     | name      | fans |  funny | useful |
+------------------------+-----------+------+--------+--------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |   2554 |   3226 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |    138 |    257 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 | 122419 | 122921 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |   2324 |  17524 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |   6646 |   4834 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |     13 |     48 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |    672 |   1062 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |   9361 |   9363 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |   7606 |   9851 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |    150 |    455 |
+------------------------+-----------+------+--------+--------+
	
	
	Please explain your findings and interpretation of the results:
	
	All of top 10 users with the highest number of fans are listed as useful and funny, which leads to the conclusion that having a high number of fans and 
	being listed as "useful" or "funny" has a strong relationship based on the given condition.
	

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.


	
i. Do the two groups you chose to analyze have a different distribution of hours?

Yes. In fact, even within the star group, they have a different distribution of hours. However, I believe that my analysis has some shortcoming. I could not extract the hour variable as I wanted to make it...
      

ii. Do the two groups you chose to analyze have a different number of reviews?

Yes, 4-5 star group has more reviews than 2-3 star group (however, 1 star group has the biggest number of review)

+----------------+---------------+---------------+-----------+
| star_group     | sum_of_review |    avg_reivew | city      |
+----------------+---------------+---------------+-----------+
| 1 star group   |         20637 |     64.490625 | Las Vegas |
| 2-3 star group |         15265 | 37.8784119107 | Las Vegas |
| 4-5 star group |         46952 | 56.0286396181 | Las Vegas |
+----------------+---------------+---------------+-----------+

/* I picked Las Vegas as my city to look at */

SELECT CASE WHEN b.stars BETWEEN 2 AND 3 THEN '2-3 star group' 
            WHEN b.stars BETWEEN 4 AND 5 THEN '4-5 star group' ELSE '1 star group' END AS star_group,
       sum(b.review_count) AS sum_of_review,
       avg(b.review_count) AS avg_reivew, 
       b.city
FROM business b
WHERE b.city='Las Vegas'
GROUP BY star_group
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

Yes, I am able to find mildy interesting information that might infer the difference between these two groups (2-3 star vs. 4-5 star)
In Las Vegas, a neighborhood where a resturant is located can be related to the rating. For example, In the Spring Valley neighborhood, the 67 percent of the 
resturants is in 4-5 star group, and its average rating is 4.0 from the 4-5 star group. The sunrise neighborhood, which has the lowest average rating neighborhood among neighborhoods that have more than 10 rating reviews, 
has the 35 percent of 2-3 star with the average rating 3.16 overall. 


SQL code used for analysis:

/* there are two queries for this questions. 

In the first query, I used union all to see top 10 average rating neighborhoods for each star group (2-3 star group vs. 4-5 star group). 
I filtered neighborhoods that has small numbers of rating review (less than 10) */


SELECT * FROM (SELECT  
CASE WHEN b.stars BETWEEN 2 AND 3 THEN '2-3 star group' 
            WHEN b.stars BETWEEN 4 AND 5 THEN '4-5 star group' ELSE '1 star group' END AS star_group,
       COUNT(*) AS num_of_rating,
       AVG(b.stars) AS averge_rating,
       b.city, 
       neighborhood
FROM business b
WHERE b.city='Las Vegas' AND star_group = '4-5 star group'
GROUP BY star_group, neighborhood
HAVING num_of_rating>10
ORDER BY averge_rating ASC) 

UNION ALL 

SELECT * FROM (SELECT CASE WHEN b.stars BETWEEN 2 AND 3 THEN '2-3 star group' 
            WHEN b.stars BETWEEN 4 AND 5 THEN '4-5 star group' ELSE '1 star group' END AS star_group,
       COUNT(*) AS num_of_rating,
       AVG(b.stars) AS averge_rating, 
       b.city, 
       neighborhood
FROM business b
WHERE b.city='Las Vegas' AND star_group = '2-3 star group'
GROUP BY star_group, neighborhood
HAVING num_of_rating>10
ORDER BY averge_rating DESC)

+----------------+---------------+---------------+-----------+---------------+
| star_group     | num_of_rating | averge_rating | city      | neighborhood  |
+----------------+---------------+---------------+-----------+---------------+
| 4-5 star group |           154 | 4.62012987013 | Las Vegas |               |
| 4-5 star group |           107 | 4.60747663551 | Las Vegas | Spring Valley |
| 4-5 star group |            48 |       4.53125 | Las Vegas | Southwest     |
| 4-5 star group |            24 | 4.52083333333 | Las Vegas | Centennial    |
| 4-5 star group |           107 | 4.51869158879 | Las Vegas | Westside      |
| 4-5 star group |            27 | 4.51851851852 | Las Vegas | Northwest     |
| 4-5 star group |            97 | 4.50515463918 | Las Vegas | Southeast     |
| 4-5 star group |            32 |      4.453125 | Las Vegas | Summerlin     |
| 4-5 star group |            58 | 4.41379310345 | Las Vegas | Downtown      |
| 4-5 star group |            27 | 4.38888888889 | Las Vegas | Chinatown     |
| 2-3 star group |            11 | 2.95454545455 | Las Vegas | Summerlin     |
| 2-3 star group |            19 | 2.81578947368 | Las Vegas | Centennial    |
| 2-3 star group |            13 | 2.76923076923 | Las Vegas | Sunrise       |
| 2-3 star group |            56 | 2.74107142857 | Las Vegas | The Strip     |
| 2-3 star group |            48 |        2.6875 | Las Vegas | Westside      |
| 2-3 star group |            13 | 2.65384615385 | Las Vegas | Chinatown     |
| 2-3 star group |            35 | 2.64285714286 | Las Vegas | Eastside      |
| 2-3 star group |            12 |         2.625 | Las Vegas | Southwest     |
| 2-3 star group |            26 | 2.61538461538 | Las Vegas | Downtown      |
| 2-3 star group |            46 | 2.60869565217 | Las Vegas | Southeast     |
+----------------+---------------+---------------+-----------+---------------+

/* In the second query, I looked at the average rating of each neighborhood and the number of rating review 
to see the percent of 4-5 star group/2-3 star group in a neighborhood. */

SELECT city, 
       AVG(stars) AS averge_rating, 
       neighborhood, 
       count(*) AS rating_num 
       FROM business
       
WHERE city='Las Vegas'
GROUP BY neighborhood
HAVING rating_num>10
ORDER by averge_rating DESC


+-----------+---------------+-----------------+------------+
| city      | averge_rating | neighborhood    | rating_num |
+-----------+---------------+-----------------+------------+
| Las Vegas | 4.02702702703 | Southwest       |         74 |
| Las Vegas | 4.00943396226 | Spring Valley   |        159 |
| Las Vegas | 3.87234042553 | Northwest       |         47 |
| Las Vegas | 3.85454545455 | Summerlin       |         55 |
| Las Vegas | 3.79464285714 |                 |        280 |
| Las Vegas |          3.75 | University      |         28 |
| Las Vegas |        3.7425 | Westside        |        200 |
| Las Vegas | 3.73097826087 | Southeast       |        184 |
| Las Vegas | 3.70192307692 | Chinatown       |         52 |
| Las Vegas | 3.67924528302 | Centennial      |         53 |
| Las Vegas | 3.66504854369 | Downtown        |        103 |
| Las Vegas |          3.65 | South Summerlin |         20 |
| Las Vegas | 3.55696202532 | The Strip       |        158 |
| Las Vegas |          3.49 | Eastside        |        100 |
| Las Vegas | 3.16216216216 | Sunrise         |         37 |
+-----------+---------------+-----------------+------------+

		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:

The total number of review and the average number of review for the closed ones are less than the open ones 
         
         
ii. Difference 2:
The average of star rating for the open ones is higher than the closed ones. 
         
         
         
SQL code used for analysis:

SELECT SUM(review_count), AVG(review_count), SUM(stars) ,AVG(stars), AVG(c.count), SUM(c.count), is_open 
FROM business b
LEFT JOIN checkin c ON b.id=c.business_id -- since some of ones might not have checkin/review information, I used left join
GROUP BY is_open
	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
predicting the overall star rating for resturants (regression model)         
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
In order to build a regression model to predict overall star rating for resturants, I need to gather information that might relate to a resturant rating and 
aggreate data by resturant level. For example, the number of reviews for a resturant or operation hours can be related to a rating of a resturant. 
I chose this dataset below because I think that the number of reviews, the location of a resturant, the number of checkin, opeation hours, and attributes will be good predictors for a rating of a resturant.  
                  
iii. Output of your finished dataset:
         
+----------------------------------+-----------------+-------+-------+--------------+---------+--------------+---------------+-----------------+----------------+--------------+----------------+--------------+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------+--------------------------+------------------------+----------------+
| name                             | neighborhood    | state | stars | review_count | is_open | monday_hours | tuesday_hours | wednesday_hours | thursday_hours | friday_hours | saturday_hours | sunday_hours | categories  | attributes                                                                                                                                                                                                                                                                                                                          | user_review_funny_score | user_review_useful_score | user_review_cool_score | checkin_number |
+----------------------------------+-----------------+-------+-------+--------------+---------+--------------+---------------+-----------------+----------------+--------------+----------------+--------------+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------+--------------------------+------------------------+----------------+
| Flaming Kitchen                  | Brown's Corners | ON    |   3.0 |           25 |       1 | 12:00-23:00  | 12:00-23:00   | 12:00-23:00     | 12:00-23:00    | 12:00-23:00  | 12:00-23:00    | 12:00-23:00  | Restaurants | RestaurantsTableService,GoodForMeal,Alcohol,Caters,HasTV,RestaurantsGoodForGroups,NoiseLevel,WiFi,RestaurantsAttire,RestaurantsReservations,OutdoorSeating,RestaurantsPriceRange2,BikeParking,RestaurantsDelivery,Ambience,RestaurantsTakeOut,GoodForKids,BusinessParking                                                           |                    None |                     None |                   None |           None |
| Deli 194                         |                 | EDH   |   3.0 |            4 |       1 | None         | None          | None            | None           | None         | None           | None         | Restaurants | GoodForMeal,Alcohol,HasTV,RestaurantsGoodForGroups,NoiseLevel,RestaurantsAttire,RestaurantsReservations,OutdoorSeating,RestaurantsPriceRange2,RestaurantsTableService,Ambience,RestaurantsTakeOut,GoodForKids,BusinessParking                                                                                                       |                    None |                     None |                   None |           None |
| Fiesta Ranchera                  |                 | IL    |   2.0 |            4 |       0 | None         | None          | None            | None           | None         | None           | None         | Restaurants | GoodForMeal,RestaurantsGoodForGroups,NoiseLevel                                                                                                                                                                                                                                                                                     |                    None |                     None |                   None |           None |
| Eklectic Pie - Mesa              |                 | AZ    |   4.0 |          129 |       0 | 11:00-21:00  | 11:00-21:00   | 11:00-21:00     | 11:00-21:00    | 11:00-22:00  | 11:00-22:00    | 11:00-21:00  | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                    None |                     None |                   None |           None |
| Cracker Barrel Old Country Store |                 | OH    |   3.5 |           27 |       1 | None         | None          | None            | None           | None         | None           | None         | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                    None |                     None |                   None |            161 |
| TWIISTED Burgers & Sushi         |                 | OH    |   4.0 |           94 |       1 | None         | None          | None            | None           | None         | None           | None         | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                    None |                     None |                   None |           None |
| Mama Mia                         |                 | ON    |   4.0 |            8 |       0 | None         | None          | None            | None           | None         | None           | None         | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                    None |                     None |                   None |           None |
| Brubaker's Pub                   |                 | OH    |   3.0 |            5 |       1 | 11:00-2:30   | 11:00-2:30    | 11:00-2:30      | 11:00-2:30     | 11:00-2:30   | 11:00-2:30     | 12:00-2:30   | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                    None |                     None |                   None |           None |
| Patiala House                    |                 | ON    |   4.0 |           10 |       1 | None         | None          | None            | None           | None         | None           | None         | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                    None |                     None |                   None |           None |
| What A Bagel                     |                 | ON    |   3.0 |            8 |       1 | 6:00-15:30   | 6:00-15:30    | 6:00-15:30      | 6:00-15:30     | 6:00-15:30   | 6:00-15:30     | None         | Restaurants | NoiseLevel,RestaurantsAttire,RestaurantsTableService,OutdoorSeating                                                                                                                                                                                                                                                                 |                    None |                     None |                   None |           None |
| Cabin Fever                      | High Park       | ON    |   4.5 |           26 |       1 | 16:00-2:00   | 18:00-2:00    | 18:00-2:00      | 18:00-2:00     | 18:00-2:00   | 16:00-2:00     | 16:00-2:00   | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                    None |                     None |                   None |           None |
| Indian Ocean Restaurant          |                 | HLD   |   3.5 |            3 |       1 | None         | None          | None            | None           | None         | None           | None         | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                    None |                     None |                   None |           None |
| Royal Dumpling                   | Willowdale      | ON    |   1.5 |            4 |       1 | None         | None          | None            | None           | None         | None           | None         | Restaurants | NoiseLevel,OutdoorSeating,RestaurantsPriceRange2,BikeParking,RestaurantsDelivery,RestaurantsTakeOut,RestaurantsGoodForGroups                                                                                                                                                                                                        |                    None |                     None |                   None |           None |
| Mango Flats                      |                 | AZ    |   2.5 |            5 |       1 | None         | None          | None            | None           | None         | None           | None         | Restaurants | RestaurantsTableService,GoodForMeal,Alcohol,Caters,HasTV,RestaurantsGoodForGroups,NoiseLevel,WiFi,RestaurantsAttire,RestaurantsReservations,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,BikeParking,RestaurantsDelivery,Ambience,RestaurantsTakeOut,GoodForKids,BusinessParking                                |                    None |                     None |                   None |           None |
| Five Guys                        |                 | AZ    |   3.5 |           63 |       1 | 10:00-22:00  | 10:00-22:00   | 10:00-22:00     | 10:00-22:00    | 10:00-22:00  | 10:00-22:00    | 10:00-22:00  | Restaurants | RestaurantsTableService,GoodForMeal,Alcohol,Caters,HasTV,RestaurantsGoodForGroups,NoiseLevel,WiFi,RestaurantsAttire,RestaurantsReservations,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,BikeParking,RestaurantsDelivery,Ambience,RestaurantsTakeOut,GoodForKids,DriveThru,BusinessParking                      |                    None |                     None |                   None |           None |
| Student Tasty Biryani            | Ville-Marie     | QC    |   3.5 |           15 |       1 | None         | None          | None            | None           | None         | None           | None         | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                    None |                     None |                   None |           None |
| Big Smoke Burger                 | Downtown Core   | ON    |   3.0 |           47 |       1 | 10:30-21:00  | 10:30-21:00   | 10:30-21:00     | 10:30-21:00    | 10:30-21:00  | 10:30-21:00    | 11:00-19:00  | Restaurants | RestaurantsTableService,GoodForMeal,Alcohol,Caters,HasTV,RestaurantsGoodForGroups,NoiseLevel,WiFi,RestaurantsAttire,RestaurantsReservations,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,WheelchairAccessible,BikeParking,RestaurantsDelivery,Ambience,RestaurantsTakeOut,GoodForKids,DriveThru,BusinessParking |                    None |                     None |                   None |           None |
| Irish Republic                   |                 | AZ    |   3.0 |          141 |       0 | 11:00-0:30   | 11:00-0:30    | 11:00-0:30      | 11:00-0:30     | 11:00-2:30   | 9:00-2:30      | 9:00-0:30    | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                    None |                     None |                   None |           None |
| Landgasthaus Busse               |                 | NI    |   3.0 |            3 |       0 | None         | None          | None            | None           | None         | None           | None         | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                    None |                     None |                   None |           None |
| Club India restaurant            | Old Town        | EDH   |   3.5 |            3 |       0 | None         | None          | None            | None           | None         | None           | None         | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                    None |                     None |                   None |           None |
| Subway                           |                 | NC    |   3.5 |            7 |       1 | 6:00-22:00   | 6:00-22:00    | 6:00-22:00      | 6:00-22:00     | 6:00-22:00   | 10:00-21:00    | None         | Restaurants | Ambience,RestaurantsPriceRange2,GoodForKids                                                                                                                                                                                                                                                                                         |                    None |                     None |                   None |           None |
| Cafe Tandoor                     |                 | OH    |   3.5 |           32 |       1 | None         | 17:30-22:00   | 11:30-14:00     | 17:30-22:00    | 17:30-22:00  | 11:30-14:00    | 15:00-21:00  | Restaurants | None                                                                                                                                                                                                                                                                                                                                |                       0 |                        0 |                      0 |           None |
| Famous Sam's                     |                 | AZ    |   2.5 |            3 |       0 | None         | None          | None            | None           | None         | None           | None         | Restaurants | GoodForMeal,Alcohol,RestaurantsGoodForGroups,RestaurantsAttire,RestaurantsReservations,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,RestaurantsTableService,RestaurantsDelivery,Ambience,RestaurantsTakeOut,GoodForKids,WheelchairAccessible,BusinessParking                                                    |                    None |                     None |                   None |           None |
| Oinky's Pork Chop Heaven         |                 | OH    |   3.0 |            3 |       1 | 6:00-23:00   | 6:00-23:00    | 6:00-23:00      | 6:00-23:00     | 6:00-23:00   | 6:00-23:00     | 6:00-23:00   | Restaurants | RestaurantsAttire,RestaurantsGoodForGroups,GoodForKids,RestaurantsReservations,RestaurantsTakeOut                                                                                                                                                                                                                                   |                    None |                     None |                   None |           None |
| Sushi Osaka                      | Etobicoke       | ON    |   4.5 |            8 |       1 | 11:00-23:00  | 11:00-23:00   | 11:00-23:00     | 11:00-23:00    | 11:00-23:00  | 11:00-23:00    | 14:00-23:00  | Restaurants | RestaurantsTakeOut,WiFi,RestaurantsGoodForGroups,RestaurantsReservations                                                                                                                                                                                                                                                            |                    None |                     None |                   None |           None |
+----------------------------------+-----------------+-------+-------+--------------+---------+--------------+---------------+-----------------+----------------+--------------+----------------+--------------+-------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------+--------------------------+------------------------+----------------+
(Output limit exceeded, 25 of 71 total rows shown)


iv. Provide the SQL code you used to create your final dataset:


SELECT b.name,
       neighborhood,
       state,
       b.stars,
       b.review_count,
       is_open,
       MAX(CASE
			   WHEN h.hours LIKE "%monday%" THEN TRIM(h.hours,'%MondayTuesWednesThursFriSatSun|%')  -- trim the attribute to extract only the hour (same things for other days below)
			   END) AS monday_hours,
			   MAX(CASE
			   WHEN h.hours LIKE "%tuesday%" THEN TRIM(h.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS tuesday_hours,
			   MAX(CASE
			   WHEN h.hours LIKE "%wednesday%" THEN TRIM(h.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS wednesday_hours,
			   MAX(CASE
			   WHEN h.hours LIKE "%thursday%" THEN TRIM(h.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS thursday_hours,
			   MAX(CASE
			   WHEN h.hours LIKE "%friday%" THEN TRIM(h.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS friday_hours,
			   MAX(CASE
			   WHEN h.hours LIKE "%saturday%" THEN TRIM(h.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS saturday_hours,
			   MAX(CASE
			   WHEN h.hours LIKE "%sunday%" THEN TRIM(h.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS sunday_hours,
			   GROUP_CONCAT(DISTINCT(c.category)) AS categories,
			   GROUP_CONCAT(DISTINCT(a.name)) AS attributes, -- extract attributes for each resturant 
       SUM(r.funny) AS user_review_funny_score, -- sum of funny reviews from users for each restruant 
       SUM(r.useful) AS user_review_useful_score, -- sum of useful reviews from users for each restruant
       SUM(r.cool) AS user_review_cool_score, -- sum of cool reviews from users for each restruant
       SUM(ch.count) AS checkin_number
       FROM business AS b
 
 /* I used left join because some of resturants do not have data from tables (checkin, tip, hours, attribute, and review)
  I used inner join for category because I need to make sure that the business is in restaurants category */ 
INNER JOIN category AS c ON c.business_id=b.id 
LEFT JOIN checkin AS ch ON ch.business_id=b.id 
LEFT JOIN tip AS t ON b.id=t.business_id  
LEFT JOIN hours h ON b.id = h.business_id
LEFT JOIN attribute a ON b.id = a.business_id
LEFT JOIN review r ON b.id=r.business_id
WHERE category='Restaurants' --only select resturants
Group BY b.id 
