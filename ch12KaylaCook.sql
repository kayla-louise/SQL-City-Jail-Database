/*Kayla Cook */
/* City Jail Database */
/* Chapter 12 */

/* The city's Crime Analysis unit has submitted the following data requests. Provide the SQL statements using subqueries to satisfy the requests. */


/*Problem 1 */
/* List the name of each officer who has reported more than the average number of crimes officers have reported */
SELECT officer_id
FROM  crime_officers JOIN crime_charges USING(crime_id)
WHERE crime_charges >ALL (SELECT AVG(COUNT(*))
                    FROM crime_charges) ;
                     
/*Problem 2 */
/*List the criminal names for all criminals who have a less than average number of crimes and aren't listed as violent offenders */
SELECT cls.criminal_id, cls.first, cls.last, cr.crime_id
FROM criminals cls
JOIN crimes cr
ON cls.criminal_id = cr.criminal_id
WHERE crime_id <ALL (SELECT AVG(COUNT(*))
                    FROM crimes )
AND cls.v_status = 'N';

/*Problem 3 */
/* List appeal information for each appeal that has less than average number of days between filing and hearing dates */
SELECT *
FROM appeals
WHERE AVG((filing_date - hearing_date)) <ALL (SELECT AVG((filing_date - hearing_date));

/*Problem 4 */
/* List the names of probation officers who have had a less than average number of criminals assigned */
SELECT p.prob_id, p.last, p.first 
FROM prob_officers p
JOIN sentences s
ON p.prob_id = s.prob_id
WHERE crime_id <ALL (SELECT AVG (COUNT(*))
                    FROM sentences;

/*Problem 5 */
/* List each crime that has had the highest number of appeals recorded */
SELECT c.crime_id, c.crime_code, c.crime_charges, a.filing_date
FROM crime_charges c
JOIN appeals a
ON c.crime_id = a.crime_id
WHERE a.filing_date >ALL (SELECT MAX(filing_date)
							FROM appeals);