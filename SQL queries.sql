
--Below is the approach taken to clean the Cyclistic---

---------------------------------------------
--Check all monthly tables to view their column names and data types--

SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
INNER JOIN (
    SELECT TABLE_NAME, COUNT(*) AS NumColumns
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME IN ('Jan21', 'Feb21', 'Mar21','Apr21', 'May21', 'Jun21','Jul21', 'Aug21', 'Sep21','Oct21', 'Nov21', 'Dec21')
    GROUP BY TABLE_NAME
) t ON INFORMATION_SCHEMA.COLUMNS.TABLE_NAME = t.TABLE_NAME
WHERE t.NumColumns = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = INFORMATION_SCHEMA.COLUMNS.TABLE_NAME
)
ORDER BY COLUMN_NAME, ORDINAL_POSITION;

-----------------------------------------------
--Combine all tables into a yearly table

SELECT * INTO new_table_name
FROM (
    SELECT * FROM Jan21
    UNION ALL
    SELECT * FROM Feb21
    UNION ALL
    SELECT * FROM Mar21
    UNION ALL 
    SELECT * FROM Apr21
    UNION ALL
    SELECT * FROM May21
    UNION ALL
    SELECT * FROM Jun21
    UNION ALL
    SELECT * FROM Jul21
    UNION ALL
    SELECT * FROM Aug21
    UNION ALL
    SELECT * FROM Sep21
    UNION ALL
    SELECT * FROM Oct21
    UNION ALL
    SELECT * FROM Nov21
    UNION ALL
    SELECT * FROM Dec21
) AS combined_data;
-----------------------------------------------

--Are there any duplicate entries? --
SELECT ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual, day_of_week, started_date, ended_date, time_started, time_ended, ride_len, COUNT(*)
FROM YearlyView
GROUP BY ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual, day_of_week, started_date, ended_date, time_started, time_ended, ride_len
HAVING COUNT(*) > 1;

-----------------------------------------------

--Are there any rows with NULLS in every column ?--

SELECT COUNT(*) AS null_rows_count
FROM YearlyView
WHERE ride_id IS NULL 
  AND rideable_type IS NULL 
  AND started_at IS NULL 
  AND ended_at IS NULL 
  AND start_station_name IS NULL 
  AND start_station_id IS NULL 
  AND end_station_name IS NULL 
  AND end_station_id IS NULL 
  AND start_lat IS NULL 
  AND start_lng IS NULL 
  AND end_lat IS NULL 
  AND end_lng IS NULL 
  AND member_casual IS NULL 
  AND day_of_week IS NULL 
  AND started_date IS NULL 
  AND ended_date IS NULL 
  AND time_started IS NULL 
  AND time_ended IS NULL 
  AND ride_len IS NULL;

------------------------------------------------

-- Separate date and time into their own columns-- 

-- Add new columns for started date, ended date, started time, ended time ---

ALTER TABLE Yearlyview
ADD date_started DATE,
    date_ended DATE,
    started_time TIME(0),
    ended_time TIME(0);

-------------------------------------------------
-- Update columns according to data type-- 

UPDATE YearlyView
SET date_started = CONVERT(date, started_at),
    started_time = CONVERT(time, started_at);

UPDATE YearlyView
SET date_ended = CONVERT(date, started_at),
    ended_time = CONVERT(time, started_at);

------------------------------------------------
--Delete unnecessary columns Started_at and ended_at-- 

ALTER TABLE Yearlyview
DROP COLUMN started_at;

ALTER TABLE Yearlyview
DROP COLUMN ended_at;

-------------------------------------------------
--- Convert time format under columns time_started and time_ended 
SELECT CONVERT(varchar(5), started_time, 108) AS mmss_time
FROM YearlyView;

SELECT CONVERT(varchar(5), ended_time, 108) AS mmss_time
FROM YearlyView;

-------------------------------------------
--Add ride length column--

ALTER TABLE yearlyview 
ADD ride_len VARCHAR(5);

-------------------------------------------
-- Calculate ride_len by using time_started and time_ended column--

UPDATE yearlyview
SET ride_len = DATEDIFF(minute, time_started, time_ended)

-------------------------------------------

--Change time format of ride_len to mm:ss --

UPDATE Yearlyview
SET ride_len = CONVERT(varchar(5), DATEADD(second, ride_len * 60, 0), 108)

-------------------------------------------
--Add a new column showing weekdays--
ALTER TABLE YearlyView
ADD WEEKDAY VARCHAR(10)

UPDATE YearlyView
SET WEEKDAY = DATENAME(weekday, started_date)
-------------------------------------------
-- Add a new column showing ride_distance--
ALTER TABLE Yearlyview 
ADD ride_distance FLOAT;

UPDATE Yearlyview
SET ride_distance = (
    3959 * acos(
        cos(radians(start_lat)) * cos(radians(end_lat)) *
        cos(radians(end_lng) - radians(start_lng)) +
        sin(radians(start_lat)) * sin(radians(end_lat))
    )
);
--------------------------------------------
-- Average distance rode by members and casual riders-- 

SELECT member_casual, AVG(ride_distance) AS avg_distance_rode
FROM YearlyView
GROUP BY member_casual;

--------------------------------------------
--Average ride_len by members and casual riders--

SELECT member_casual, AVG(ride_len) AS avg_length
FROM YearlyView
GROUP BY member_casual;

--------------------------------------------

Select * 
From YearlyView