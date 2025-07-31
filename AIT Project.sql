CREATE TABLE CrimeData (
    IncidentID INT PRIMARY KEY,
    Date1 VARCHAR(225),
    CrimeType VARCHAR(255),
    Location VARCHAR(255),
    City VARCHAR(255),
    Arrested VARCHAR(225)
);
/*
Import the dataset i.e. csv file to the created table with only the first 6 columns.
Only 6 columns are imported because loading other columns will waste the time in importing,
and increase the processing time.
The first 6 columns are names as IncidentID, Date1, CrimeType, location, City, Arrested in the new table
*/

SELECT * FROM CrimeData;

SELECT City, COUNT(*) AS NumberOfIncidents
FROM CrimeData
GROUP BY City;

SELECT CrimeType, COUNT(*) AS Frequency
FROM CrimeData
GROUP BY CrimeType
ORDER BY Frequency DESC;

SELECT Arrested, COUNT(*) AS IncidentCount, 
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM CrimeData)) AS Percentage
FROM CrimeData
GROUP BY Arrested;

-- Research question -1  Temporal patterns and trends in crime rates in Los Angeles
SELECT EXTRACT(YEAR FROM Date) AS Year, EXTRACT(MONTH FROM Date) AS Month, COUNT(*) AS IncidentCount
FROM CrimeData
WHERE City = 'Los Angeles'
GROUP BY Year, Month
ORDER BY Year, Month;

-- Research question -2 Changes in specific crime categories in Los Angeles during the COVID-19 pandemic
SELECT CrimeType, COUNT(*) AS IncidentCount
FROM CrimeData
WHERE City = 'Los Angeles' AND EXTRACT(YEAR FROM Date) >= 2020
GROUP BY CrimeType
ORDER BY IncidentCount DESC;

-- Research question -3 Geographical impact on crime patterns in Los Angeles during the COVID-19 pandemic
SELECT Location, COUNT(*) AS IncidentCount
FROM CrimeData
WHERE City = 'Los Angeles' AND EXTRACT(YEAR FROM Date) >= 2020
GROUP BY Location
ORDER BY IncidentCount DESC;






