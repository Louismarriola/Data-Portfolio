## Table of Contents

1. [Introduction](README.md#introduction)
2. [Business Objective](README.md#businessobjective)
3. [Data](README.md#Data)
4. [Processing & Cleaning](README.md#processing-and-cleaning)
5. [Analyzing](README.md#analyzing)
6. [Conclusion](README.md#conclusion)


## Introduction 

  This project is a capstone project for the completion of the [Google Data Analytics Certification](https://www.coursera.org/account/accomplishments/professional-cert/AHR8TAZNRZGJ). The scenario involves a fictitious company called "Cyclistic", which provides bike-share services in Chicago. This program features more than 5,800 bicycles across 600 docking stations. Customers who purchased single-ride or full-day passes are classified as "casual" riders. The customers who purchased annual memberships are "members". The director of marketing is aiming to maximize the number of annual memberships for future growth of the company. 
  
## Buiness Objective 

  The main objective set by the director of marketing is, 
  
    "How do annual members and casual riders use Cyclistic bikes differently?"

## Data

* Data Source : [Cyclistic Historical Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html)

* Date Range: 1/1/2021 - 12/31/2021. 

* Files: 12 csv files representing each month.

* Data Structure: There are 13 columns and 5.5 million rows when data is combined in a Yearly View. 


## Processing and Cleaning

* A database was created in SQL using all 12 csv files.
* An overview of actions done to process and clean the data. 

     [SQL Queries](https://github.com/Louismarriola/Data-Portfolio/commit/83c04905d90ebc79a944abaadeef0d0c53b7c1a3)
       
        * Datatypes

        * Formatting        
  
        * Duplicate entry 
        
        * Add/Delete columns 
        
        * Calculations

## Analyzing
 
 Data analysis and visualization was done on Tableau using the final clean data set done on SQL. 
  
 #### **Total Ride-Share Rides**
  
  ![line_chart_1](https://github.com/Louismarriola/Data-Portfolio/blob/b12aca90166b6fd6f203c4054efaf671559dd050/Ride%20Countviz.png) 
 
  #### **Insights** 
 * In 2021 Cyclistic hit an impressive grand total of 5,595,063 rides. 
 * Members led with 55% of the rides at a total of 3 million rides. 
 * Casual riders hit a 45% of rides at a total of 2.5 million rides.
 * In the Total Ride- Share Rides graph we cleary noticed which months rides skyrocketed as well as max rides for each rider.
 
 
 #### **Total Rides by Bike Type**
  
  ![bar_graph_1](https://github.com/Louismarriola/Data-Portfolio/blob/e7efa1d151a2d7c53874b74b1a4b4b3d957c69f4/Bike%20Typeviz.png) 
  
  #### **Insights** 
  * Between the two types of bikes provided, Classic bike type was the most populer between both types of riders. 
  * Members rode more Classic bikes than Casual riders did.
  * Between both types of bikes Casual riders had a difference 316,651 rides. 
  * Members had almost a 3 fold difference with a total of 902,685 rides.

 #### **Weekend / Weekday Demand**

![pie_chart_1]( Image) 

#### **Insights** 
* Casual riders beat members by almost 2 fold for Weekend rides for a total of 41% compared to Member riders use Cyclistic 26% of the time on Weekends. 
* Members have a majority of their rides during the week implying Members may use Cyclistic for commuting purposes while Casual riders use it for liesure. 

#### **Daily Timeline**

![bar_chart_2]( image ) 

#### **Insights**

* Early Morning-     00:00 AM - 9:00 AM                      
* Morning-            9:00 AM - 12:00 PM 
* Early Afternoon-   12:00 PM - 3:00 PM
* Late Afternoon-     3:00 PM - 6:00 PM 
* Evening-            6:00 PM - 9:00 PM
* Late Night-         9:00 PM - 00:00 AM 

* Members. during weekdays noticably have an increase in usage between early morning and late afternoon hours, these timeframes are typical commuting hours. 
* Casual riders on weekdays have an increase in rides in the late afternoon into evening hours. 
* Bike usage is in demand during early and late afternoons on weekends for both riders.


 #### **Avg Time**

![bar_chart_2]( image ) 

#### **Insights**










 #### **Daily Average Mileage**
  
![bar_chart_2]( image ) 

#### **Insights**
* Members max average is 1.38 Miles during the early morning timeframe.
* Casual riders max an average of 1.47 Miles during the late afternoon timeframe.
* Yearly average ride distance between the two.
* Members- 1.32 Miles
* Casual- 1.40 Miles


 #### **Rides during Seasons**

![bar_chart_2]( image ) 

#### **Insights**
* Members hit a max of 1.1 million rides in the Summer.
* Casual riders surpass members at 1.2 million rides in the summer.
* 42 % of the yearly rides were done in the Summer.
* Both rider types low season was Winter.

## Conclusion


