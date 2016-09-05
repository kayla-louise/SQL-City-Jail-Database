/* Kayla Cook */
/* City Jail Database */
/* Chapter 5 */

/* -----------------------------
1) Create and execute statements to perform the following DML activites. Save the changes permanently to the database.
  a) Create a script to allow a user to add new criminals to the CRIMINALS table.
  b) Add the following criminals, using the script created in the previous step. No value needs to be entered af it should be set to the DEFAULT column value. Query the CRIMINALS table to confirm that new rows have been added.
  c) Add a column named Mail_flag to the CRIMINALS table. The column should be assigned a datatype of CHAR(1).
  d) Set the Mail_flag column to a value of 'Y' for all criminals.
  e) Set the Mail_flag column to 'N' for all criminals who don't have a street address recorded in the database.
  f) Change the phone number for criminal 1016 to 7225659032.
  g) Remove criminal 1017 from the database
----------------------------------------------------- */

INSERT INTO criminals(criminal_ID, last_col, first_col, street, city, state, zip, phone, v_status, p_status)
VALUES(1015, 'Fenter', 'Jim', '', 'Chesapeake', 'VA', 23320, '', DEFAULT, DEFAULT);
INSERT INTO criminals(criminal_ID, last_col, first_col, street, city, state, zip, phone, v_status, p_status)
VALUES(1016, 'Saunder', 'Bill', '11 Apple Rd', 'Virgina Beach', 'VA', 23455, 7678217443, DEFAULT, DEFAULT);
INSERT INTO criminals(criminal_ID, last_col, first_col, street, city, state, zip, phone, v_status, p_status)
VALUES(1017, 'Painter', 'Troy', '77 Ship Lane', 'Norfolk', 'VA', 22093, 7677655454, DEFAULT, DEFAULT);
DESC criminals;
ALTER TABLE criminals
MODIFY mail_flag CHAR(1);
UPDATE criminals
SET mail_flag = 'Y';
UPDATE criminals
SET mail_flag = 'N'
WHERE street = '';
UPDATE criminals
SET phone = 7225659032
WHERE criminal_ID = 1016;
DELETE FROM criminals
WHERE criminal_ID = 1017;
