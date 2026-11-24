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
  
  ![line_chart_1](https://github.com/Louismarriola/Data-Portfolio/blob/6e6b9e20e91ffb941ad61f573e5bdf8e24319d04/Cyclistic%20Viz/Total%20Count.png) 
 
  #### **Insights** 
 * In 2021 Cyclistic hit an impressive grand total of 5,595,063 rides. 
 * Members led with 55% of the rides at a total of 3 million rides. 
 * Casual riders hit a 45% of rides at a total of 2.5 million rides.
 * In the Total Ride- Share Rides graph we cleary noticed which months rides skyrocketed as well as max rides for each rider.
 
 
 #### **Total Rides by Bike Type**
  
  ![bar_graph_1](https://github.com/Louismarriola/Data-Portfolio/blob/6e6b9e20e91ffb941ad61f573e5bdf8e24319d04/Cyclistic%20Viz/Bike%20Type.png) 
  
  #### **Insights** 
  * Between the two types of bikes provided, Classic bike type was the most populer between both types of riders. 
  * Members rode more Classic bikes than Casual riders did.
  * Between both types of bikes Casual riders had a difference 316,651 rides. 
  * Members had almost a 3 fold difference with a total of 902,685 rides.

 #### **Weekend / Weekday Demand**

![pie_chart_1](https://github.com/Louismarriola/Data-Portfolio/blob/6e6b9e20e91ffb941ad61f573e5bdf8e24319d04/Cyclistic%20Viz/Weekday%3Aend.png) 

#### **Insights** 
* Casual riders beat members by almost 2 fold for Weekend rides for a total of 41% compared to Member riders use Cyclistic 26% of the time on Weekends. 
* Members have a majority of their rides during the week implying Members may use Cyclistic for commuting purposes while Casual riders use it for liesure. 

#### **Daily Timeline**

![bar_chart_2](https://github.com/Louismarriola/Data-Portfolio/blob/6e6b9e20e91ffb941ad61f573e5bdf8e24319d04/Cyclistic%20Viz/Time%20of%20Day.png) 

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


 #### **Daily Average Mileage**
  
![line_chart_2](https://github.com/Louismarriola/Data-Portfolio/blob/6e6b9e20e91ffb941ad61f573e5bdf8e24319d04/Cyclistic%20Viz/Avg%20Distance.png) 

#### **Insights**
* Members max average is 1.38 Miles during the early morning timeframe.
* Casual riders max an average of 1.47 Miles during the late afternoon timeframe.
* Yearly average ride distance between the two.
* Members- 1.32 Miles
* Casual- 1.40 Miles


 #### **Average Bike Time (Minutes)**

![chart_1](https://github.com/Louismarriola/Data-Portfolio/blob/6e6b9e20e91ffb941ad61f573e5bdf8e24319d04/Cyclistic%20Viz/Avg%20Minutes.png) 

#### **Insights**
* Casual riders have the highest average which is 27 minutes, this is during the spring season. 
* Members max average time is 13 minutes which is done during spring and summer. 


 #### **Rides during Seasons**

![bar_chart_3](https://github.com/Louismarriola/Data-Portfolio/blob/6e6b9e20e91ffb941ad61f573e5bdf8e24319d04/Cyclistic%20Viz/Seasons.png) 

#### **Insights**
* Members hit a max of 1.1 million rides in the Summer.
* Casual riders surpass members at 1.2 million rides in the summer.
* 42 % of the yearly rides were done in the Summer.
* Both rider types low season was Winter.

## Conclusion & Observations

* Frequency of Rides: 

    Annual members tend to use the bikes more frequently, with a higher portion of their rides being par of a communiting routine. Casual riders tend to use the bike services more sporadically for tourism and leisure activities. 

* Trip Duration:

    Annual members tend to take shorter trips, with the majority of their trips lasting less than 15 mintues. Casual riders used the bikes for longer periods of time, on average their trips were in between 20-30 minutes.
 
* Weekly Behavior:

    74 % of Annual members primarily riding during commuting hours of 6 am - 9am and 3-7pm. Weekend activity is very minimal and on average they ride less than the casual riders. Throuhgout the week casual riders tend to sporadically increase usage duirng the late afternoon into evening hours. On the weekends their demand outweights the members, noticing increase actvitiy during the afternoon.
    
* Final Thoughts

  Based on these differences, we can prdict that annual members and casual riders have different needs and motivations for using Cyclistic bikes. Annual members are likely using the bikes as part of a daily commute and value convenience and reliability. Casual riders are using the bikes for leisure actitives and value flexibility and the abilitiy to explore the surrounding areas in the city. These insights can inform recommendations for Cyclistic to better cater to the needs of these customer segments. These insights can also aide on creating powerful marketing campaigns.  

