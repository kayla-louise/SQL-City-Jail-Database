/* Kayla Cook */
/* City Jail Database */
/* Chapter 8 */

/* The following list reflects common data requests from city managers. Write the SQL statements to satisfy the requests. */


/*CH 8 Problem 1 */
/* List all criminal aliases beginning with the letter B */
SELECT alias
FROM aliases
WHERE alias LIKE 'B%' ;

/*CH 8 Problem 2 */
/* List all crimes that occurred (were charged) during the month October 2008. List the crime ID, criminal ID, date charged, and classification. */
SELECT crime_ID, criminal_ID, date_charged, classification
FROM crimes
WHERE hearing_date BETWEEN '01-OCT-08' AND '31-OCT-08' ;

/*CH* Problem 3 */
/* List all crimes with a status of CA(can appeal) or IA(in appeal). List the crime ID, criminal ID, date charged, and status. */
SELECT crime_ID, criminal_ID, date_charged, status
FROM crimes
WHERE status IN ('CA', 'IA');

/*CH 8 Problem 4 */
/* List all crimes classified as a felony. List the crime ID, criminal ID, date charged, and classification. */
SELECT crime_ID, criminal_ID, date_charged, classification
FROM crimes
WHERE classification = 'F' ;

/*CH 8 Problem 5 */
/* List all crimes with a hearing date more than 14 days after the date charged. List the crime ID, criminal ID, date charged, and hearing date. */
SELECT crime_ID, criminal_ID, date_charged, hearing_date
FROM crimes
WHERE hearing_date-date_charged > 14;

/*CH 8 Problem 6 */
/* List all criminals with the zip code 23510. List the criminal ID, last name, and zip code. Sort the list by criminal ID. */
SELECT criminal_ID, last, zip
FROM criminals
WHERE zip = 23510;

/*CH 8 Problem 7 */
/* List all crimes that don't have a hearing date scheduled. List the crime ID, criminal ID, date charged, and hearing date. */
SELECT crime_ID, criminal_ID, date_charged, hearing_date
FROM crimes
WHERE hearing_date IS NULL;

/*CH 8 Problem 8 */
/* List all sentences with a probation officer assigned. List the sentence ID, criminal ID, and probation officer ID. Sort the list by probation officer ID and then criminal ID. */
SELECT sentence_ID, criminal_ID, prob_ID
FROM sentences
WHERE prob_ID IS NOT NULL
ORDER BY prob_ID, criminal_ID;

/*CH 8 Problem 9 */
/* List all crimes that are classified as misdemeanors and are currently in appeal. List the crime ID, criminal ID, classification, and status. */
SELECT crime_ID, criminal_ID, classification, status
FROM crimes
WHERE classification = 'M' AND status = 'IA';

/*CH 8 Problem 10 */
/* List all crime charges with a balance owed. List the charge ID, crime ID, fine amount, court fee, amount paid, and amount owed. */
SELECT charge_ID, crime_ID, fine_amount, court_fee, amount_paid, 
fine_amount + court_fee - amount_paid AS "Amount Owed"
FROM crime_charges
WHERE "Amount Owed" > 0;

/*CH 8 Problem 11 */
/* List all police officers who are assigned to the precinct OCVW or GHNT and have a status of active. List the officer ID, last name, precinct, and status. Sort the list by precint and then by officer last name. */
SELECT officer_ID, last, precinct, status
FROM officers
WHERE precinct IN('OCVW', 'GHNT') AND  status = 'A'
ORDER BY precinct, last;
