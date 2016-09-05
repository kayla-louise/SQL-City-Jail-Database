/* Kayla Cook */
/* City Jail Database */
/* Chaper 6 */



/* CH 6 Problem 1 */
/* The head DBA has requested the creation of a sequence for the primary key columns of the Criminals and Crimes tables. After creating the sequences, add a new criminal named Johnny Capps to the Criminals table by using the correct sequence (use any values for the remainder of columns). A crime needs to be added for the criminal too. Add a row to the Crimes table, referencing the sequence value already generated for the Crime_ID value (use any values for the remainder of columns).
*/
CREATE SEQUENCE city_jail_criminals_seq
INCREMENT BY 1
START WITH 111111
NOCACHE NOCYCLE;

CREATE SEQUENCE city_jail_crimes_seq
INCREMENT BY 1
START WITH 111111111
NOCACHE NOCYCLE;

INSERT INTO criminals(criminal_id, last, first, street, city, state, zip, phone,
v_status, p_status)
VALUES (city_jail_criminals_seq.NEXTVAL, 'Capps', 'Johnny', '77 Broadway Street',
'Denver', 'CO', 80246, 3035555555, 'N', 'N');

INSERT INTO crimes(crime_id, criminal_id, classification, date_charged, 
status, hearing_date, appeal_cut_date)
VALUES (city_jail_crimes_seq.NEXTVAL, city_jail_criminals_seq.CURRVAL,
'F', '02-FEB-2009', 'U', '02-JUL-2009', '02-AUG-2009');

/* -------------------------------------------------------------------------------------- */
/* CH 6 Problem 2 */
/* The last name, street, and phone number columns of the Criminals table are used quite often in the WHERE clause condition of queries. Create objects that might improve data retrieval for these queries.
*/

CREATE PUBLIC SYNONYM
lastname
FOR last.criminals;

CREATE PUBLIC SYNONYM
street
FOR street.criminals;

CREATE PUBLIC SYNONYM
phone#
FOR phone.criminals;

/* --------------------------------------------------------------------------------------- */
/*CH 6 Problem 3 */
/* Would a bitmap index be appropriate for any columns in the City Jail database (assuming the columns are used in search and/or sort operations)? If so, identify the columns and explain why a bitmap index is appropriate for them. */

/* A bitmap index would be appropriate for the crimes column, specifically the 
classification column. I'm assuming that there are only so many classifications
for crime type. A bitmap index would work for this because the classficiations
column has low-selectivity/cardinality and so it could make searching for a
criminal who performed a specific type of crime, much faster. */
/* --------------------------------------------------------------------------------------- */


/*CH 6 Problem 4 */
/* Would using the City Jail database be any easier with the creation of synonyms? Explain why or why not. */

/* Using the city jail database with synonyms could be faster if there are 
multiple users of the database. Synonyms would make this faster because an
user would not have to reference the user that created the object first before
naming the object that they would like to reference. It could also be faster
because instead of having to remember both the table name and the column name
only the synonym name would have to be rememebered which would make it more 
user friendly. */


