/* Kayla Cook */
/* City Jail Database */
/* Chapter 9 */

/* The following list reflects the current data requests from city managers. Provide the SQL statements that satisfy the requests. For each request, include one solution using the traditional method and one using an ANSI JOIN statement. */


/*------------------------------------------------------------------------------- */
/* Problem 1 : List all criminals along with the crime charges filed. The report needs to include the criminal ID, name, crime code, and fine amount. */

/*CH 9 Problem 1 */
/*Traditional Method */
SELECT cls.criminal_id, cls.first, cls.last, cc.crime_code, cc.fine_amount
FROM crime_charges cc, crimes cr, criminals cls
WHERE cc.crime_id = cr.crime_id
  AND cr.criminal_id = cls.criminal_id
ORDER BY criminal_id, first, last, crime_code, fine_amount;

/* Join Method */
SELECT cls.criminal_id, cls.first, cls.last, cc.crime_code, cc.fine_amount
FROM criminals cls
  JOIN crimes cr
    ON cr.criminal_id = cls.criminal_id
  JOIN crime_charges cc
    ON cc.crime_id = cr.crime_id
ORDER BY criminal_id, first, last, crime_code, fine_amount;
/* ---------------------------------------------------------------------------------- */

/* --------------------------------------------------------------------------------- */
/* Problem 2 : List all criminals along with crime status and appeal status (if applicable). The reports need to include the criminal ID, name, crime classification, date charged, appeal filing date, and appeal status. Show all criminals, regardless of whether they have filed an appeal. */

/*CH 9 Problem 2 */
/*Traditional Method */
SELECT cls.criminal_id, cls.first, cls.last, cr.classification, cr.date_charged,
  ap.filing_date, ap.status
FROM criminals cls, crimes cr, appeals ap
WHERE cls.criminal_id = cr.criminal_id
  AND cr.crime_id = ap.crime_id
ORDER BY criminal_id;

/*JOIN Method */
SELECT cls.criminal_id, cls.first, cls.last, cr.classification, cr.date_charged,
  ap.filing_date, ap.status
FROM criminals cls
JOIN crimes cr
  ON cr.criminal_id = cls.criminal_id
JOIN appeals ap
  ON ap.crime_id = cr.crime_id
ORDER BY criminal_id;
/* --------------------------------------------------------------------------------- */

/* ----------------------------------------------------------------------- */
/* Problem 3 : List all criminals along with crime information. The report needs to include the criminal ID, name, crime classification, date charged, crime code and fine amount. Include only crimes classified as "Other". Sort the list by Criminal ID and Date Charged. */

/*CH 9 Problem 3*/
/*Traditional Method */
SELECT cls.criminal_id, cls.first, cls.last, cr.classification, cr.date_charged,
  cc.fine_amount, cc.crime_code
FROM criminals cls, crimes cr, crime_charges cc
WHERE cls.criminal_id = cr.criminal_id
  AND cr.crime_id = cc.crime_id
  AND classification = 'O'
ORDER BY criminal_id, date_charged;

/*JOIN METHOD*/
SELECT cls.criminal_id, cls.first, cls.last, cr.classification, cr.date_charged,
  cc.fine_amount, cc.crime_code
FROM criminals cls
JOIN crimes cr
  ON cr.criminal_id = cr.criminal_id
JOIN crime_charges cc
  ON cc.crime_id = cr.crime_id
WHERE classification = 'O'
ORDER BY criminal_id, date_charged;
/* ---------------------------------------------------------------------------------- */

/* -------------------------------------------------------------------- */
/* Problem 4 : Create an alphabetical list of all criminals, including criminal ID, name, violent offender status, parole status, and any known aliases. */

/*CH 9 Problem 4 */
/*Traditional Method*/
SELECT c.criminal_id, c.first, c.last, c.v_status, c.p_status, a.alias
FROM criminals c, aliases a
WHERE c.criminal_id = a.criminal_id(+)
ORDER BY c.last, c.first;

/*JOIN Method */
SELECT c.criminal_id, c.first, c.last, c.v_status, c.p_status, a.alias
FROM criminals c LEFT OUTER JOIN aliases a
  ON c.criminal_id = a.criminal_id
ORDER BY last, first;
/* ------------------------------------------------------------------ */

/* ------------------------------------------------------------------------- */
/* Problem 5 : A table named Prob_Contact contains the required frequency of contact with a probation officer, based on the length of the probation period (the number of days assigned to probation).
Review the data in the table, which indicated ranges for the number of days and applicable contact frequencies. Create a list containing each criminal who has been assigned a probation period, which is indicated by the sentence type.
The list should contain the criminal name, probation start date, probation end date, and required frequency of contact. Sort the list by criminal name and probation start date. */

/*CH 9 Problem 5 */
/*Traditional Method */
SELECT c.last, c.first, s.start_date, s.end_date, p.con_freq
FROM criminals c, sentences s, prob_contact p
WHERE c.criminal_id = s.criminal_id
  AND s.end_date - s.start_date >= p.low_amt
  AND s.end_date - s.start_date <= p.high_amt
  AND s.type = 'P'
ORDER BY last, first, start_date;

/*JOIN Method */
SELECT c.last, c.first, s.start_date, s.end_date, p.con_freq
FROM criminals c
JOIN sentences s
  ON s.type = 'P'
JOIN prob_contact p
  ON s.end_date - s.start_date >= p.low_amt
  AND s.end_date - s.start_date <= p.high_amt
ORDER BY last, first, start_date;
/* ---------------------------------------------------------------------- */

/* ------------------------------------------------------------------ */
/* Problem 6 : A column named Mgr_ID has been added to the Prob_Officers table and contains the ID number of the Probation supervisor for each officer. Produce a list showing each probation officer's name and his or her supervisor's name. Sort the list alphabetically by probation officer name. */

/*CH 9 Problem 6 */
/*Tradtional Method */
SELECT pro.last, pro.first, mgr.last AS "Manager Last Name", mgr.first AS
  "Manager First Name"
FROM prob_officers pro, prob_officers mgr
WHERE pro.mgr_id = mgr.prob_id(+)
ORDER BY pro.last, pro.first;

/*JOIN Method */
SELECT pro.last, pro.first, mgr.last AS "Manager Last Name", mgr.first AS
  "Manager First Name"
FROM prob_officers pro LEFT OUTER JOIN prob_officers mgr
  ON pro.mgr_id = mgr.prob_id
ORDER BY last, first;

