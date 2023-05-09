
--Below is the approach taken to clean the Cyclistic---

---------------------------------------------
--Check all monthly tables to view their column names and data types--

SELECT c.TABLE_NAME, c.COLUMN_NAME, c.DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS c
INNER JOIN (
    SELECT TABLE_NAME, COUNT(*) AS NumColumns
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME IN ('Jan21', 'Feb21', 'Mar21','Apr21', 'May21', 'Jun21','July21', 'Aug21', 'Sept21','Oct21', 'Nov21', 'Dec21')
    GROUP BY TABLE_NAME
) t ON c.TABLE_NAME = t.TABLE_NAME
WHERE t.NumColumns = (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = c.TABLE_NAME
)
ORDER BY c.COLUMN_NAME, c.ORDINAL_POSITION;

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
FROM dbo.YearlyView
GROUP BY ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual, day_of_week, started_date, ended_date, time_started, time_ended, ride_len
HAVING COUNT(*) > 1;
-----------------------------------------------
--Are there any rows with NULLS in every column ?--

SELECT COUNT(*) AS null_rows_count
FROM [dbo].[YearlyView]
WHERE [ride_id] IS NULL AND [rideable_type] IS NULL AND [started_at] IS NULL AND [ended_at] IS NULL AND [start_station_name] IS NULL AND [start_station_id] IS NULL AND [end_station_name] IS NULL AND [end_station_id] IS NULL AND [start_lat] IS NULL AND [start_lng] IS NULL AND [end_lat] IS NULL AND [end_lng] IS NULL AND [member_casual] IS NULL AND [day_of_week] IS NULL AND [started_date] IS NULL AND [ended_date] IS NULL AND [time_started] IS NULL AND [time_ended] IS NULL AND [ride_len] IS NULL;

------------------------------------------------

-- Separate date and time into their own columns-- 

-- Add new columns for started date, ended date, started time, ended time ---

ALTER TABLE yearlyview
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

ALTER TABLE yearlyview ADD ride_len VARCHAR(5);

-------------------------------------------
-- Calculate ride_len by using time_started and time_ended column--

UPDATE yearlyview
SET ride_len = DATEDIFF(minute, time_started, time_ended)

-------------------------------------------

--Change time format of ride_len to mm:ss --

UPDATE yearlyview
SET ride_len = CONVERT(varchar(5), DATEADD(second, ride_len * 60, 0), 108)

-------------------------------------------
--Add a new column showing weekdays--
ALTER TABLE dbo.YearlyView
ADD WEEKDAY VARCHAR(10)

UPDATE dbo.YearlyView
SET WEEKDAY = DATENAME(weekday, started_date)
-------------------------------------------

Select * 
From YearlyView