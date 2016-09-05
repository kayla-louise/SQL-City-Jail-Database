/* Kayla Cook */
/* City Jail Database */
/* Chapter 7 */

/* The City Jail organization is preparing to deploy the new database to four departments. The departments and associated duties for the database are described in the following chart:
	-Criminal Records (8 employees)- Add new criminals and crime charges, Make changes to criminal and crime charge data as needed for corrections or updates, Keep the police officer information up to date, Maintain the crime codes list.
	-Court Recording (7 employees)- Enter and modify all court appeals information, Enter and maintain all probation information, Maintain the probation officer list.
	-Crimes Analysis (4 employees)- Analyze all criminal and court data to identify trends, Query all crimes data as needed to prepare federal and state reports.
	-Data Officer (1 employee)- Remove crimes, court, and probation data based on approved requests from any of the other departments.
*/
/* Based on the department duties outlined in the table, develop a plan to assign privileges to employees in all four departments. The plan should include the following:
	-A description of what types of objects are required
	-A list of commands needed to address user creation for each department
*/


/*CH 7 Problem 1*/
/* The very first step that must be taken with all departments is creating the
users for each department and ensuring they are secure by using a password
expire option. A grant session command must be used on all users so that they
are able to log onto the system. I would then create four roles to represent
the four departments. These roles will specify privileges the employees have.
The following are the privileges each department would have:

Criminal Records Department(8 employees)
These people need to be able to view, update and enter new data into all tables
however we want to make sure that they don't accidently(or intentionally) delete
records from the table so they should not have access to DROP.
For this they would need to SELECT, INSERT, INDEX, ALTER, SELCET, and UPDATE.

Court Recording Department(7 employees)
These people only need to access the crimes table and the probation 
officers/probation management tables. For these tables they would need to be
able to view, update, and enter new data. They would not have access to the
DROP command. For this they would need to ALTER, INSERT, SELECT, INDEX, and
UPDATE.

Crimes Analysis Department(4 employees)
This department does not need to be able to update or add any new records they
just will be viewing them. They will need access to the crimes table and court
records if applicable. For their job they would need to just be able to query
using the SELECT and INDEX statements.

Data Officer Department(1 employee)
The purpose of this role is to remove data so they would have to have access
to the DELETE command.   */

/*CH 7 Problem 2*/
CREATE USER crim_rec_01
IDENTIFIED BY password1;
ALTER USER crim_rec_01
IDENTIFIED BY password1
PASSWORD EXPIRE;

CREATE USER crim_rec_02
IDENTIFIED BY password2;
ALTER USER crim_rec_02
IDENTIFIED BY password2
PASSWORD EXPIRE;

CREATE USER crim_rec_03
IDENTIFIED BY password3;
ALTER USER crim_rec_03
IDENTIFIED BY password3
PASSWORD EXPIRE;

CREATE USER crim_rec_04
IDENTIFIED BY password4;
ALTER USER crim_rec_04
IDENTIFIED BY password4
PASSWORD EXPIRE;

CREATE USER crim_rec_05
IDENTIFIED BY password5;
ALTER USER crim_rec_05
IDENTIFIED BY password5
PASSWORD EXPIRE;

CREATE USER crim_rec_06
IDENTIFIED BY password6;
ALTER USER crim_rec_06
IDENTIFIED BY password6
PASSWORD EXPIRE;

CREATE USER crim_rec_07
IDENTIFIED BY password7;
ALTER USER crim_rec_07
IDENTIFIED BY password7
PASSWORD EXPIRE;

CREATE USER crim_rec_08
IDENTIFIED BY password8;
ALTER USER crim_rec_08
IDENTIFIED BY password8
PASSWORD EXPIRE;

CREATE USER court_rec_01
IDENTIFIED BY password1;
ALTER USER court_rec_01
IDENTIFIED BY password1
PASSWORD EXPIRE;

CREATE USER court_rec_02
IDENTIFIED BY password2;
ALTER USER court_rec_02
IDENTIFIED BY password2
PASSWORD EXPIRE;

CREATE USER court_rec_03
IDENTIFIED BY password3;
ALTER USER court_rec_03
IDENTIFIED BY password3
PASSWORD EXPIRE;

CREATE USER court_rec_04
IDENTIFIED BY password4;
ALTER USER court_rec_04
IDENTIFIED BY password4
PASSWORD EXPIRE;

CREATE USER court_rec_05
IDENTIFIED BY password5;
ALTER USER court_rec_05
IDENTIFIED BY password5
PASSWORD EXPIRE;

CREATE USER court_rec_06
IDENTIFIED BY password6;
ALTER USER court_rec_06
IDENTIFIED BY password6
PASSWORD EXPIRE;

CREATE USER court_rec_07
IDENTIFIED BY password7;
ALTER USER court_rec_07
IDENTIFIED BY password7
PASSWORD EXPIRE;

CREATE USER crim_ana_01
IDENTIFIED BY password1;
ALTER USER crim_ana_01
IDENTIFIED BY password1
PASSWORD EXPIRE;

CREATE USER crim_ana_02
IDENTIFIED BY password2;
ALTER USER crim_ana_02
IDENTIFIED BY password2
PASSWORD EXPIRE;

CREATE USER crim_ana_03
IDENTIFIED BY password3;
ALTER USER crim_ana_03
IDENTIFIED BY password3
PASSWORD EXPIRE;

CREATE USER crim_ana_04
IDENTIFIED BY password4;
ALTER USER crim_ana_04
IDENTIFIED BY password4
PASSWORD EXPIRE;

CREATE USER data_officer
IDENTIFIED BY password1;
ALTER USER data_officer
IDENTIFIED BY password1
PASSWORD EXPIRE;

CREATE ROLE criminal_records;
GRANT criminal_records
TO crim_rec_01, crim_rec_02, crim_rec_03, crim_rec_04, crim_rec_05, crim_rec_06,
crim_rec_07, crim_rec_08;

CREATE ROLE court_recording;
GRANT court_recording
TO court_rec_01, court_rec_02, court_rec_03, court_rec_04, court_rec_05,
court_rec_06, court_rec_07;

CREATE ROLE crimes_analysis;
GRANT crimes_analysis
TO crim_ana_01, crim_ana_02, crim_ana_03, crim_ana_04;

CREATE ROLE officer_data;
GRANT officer_data
TO data_officer;

GRANT CREATE SESSION
TO criminal_records, court_recording, crimes_analysis, officer_data;

GRANT UPDATE, INSERT, SELECT, COMMENT, BACKUP, ALTER, CREATE
TO crimial_records;
GRANT select, insert, update, index
ON criminals
TO criminal_records;
GRANT select, insert, update, index
ON crimes
TO criminal_records;
GRANT select, insert, update, index
ON police_officers
TO criminal_records;
GRANT select, insert, update, index
ON crime_codes
TO criminal_records;

GRANT UPDATE, INSERT, COMMENT, BACKUP, ALTER, CREATE
TO court_recording;
GRANT select, insert, update, index
ON criminals
TO court_recording;
GRANT select, insert, update, index
ON crimes
TO court_recording;
GRANT select, insert, update, index
ON probation
TO court_recording;
GRANT select, insert, update, index
ON probation_officers
TO court_recording;

GRANT SELECT, COMMENT
TO crimes_anaylysis;
GRANT select, index
ON criminals
TO crimes_analysis;
GRANT select, index
ON crimes
TO crimes_analysis;

GRANT DELETE, COMMENT, DROP
TO officer_data
WITH ADMIN OPTION;
GRANT select, delete
ON criminals
TO officer_data;
GRANT select, delete
ON crimes
TO officer_data;
GRANT select, delete
ON probation
TO officer_data;