/* Kayla Cook */
/* City Jail Database */
/* Chapter 4 */

/* In previous chapters, you have designed and created tables for the City Jail Database. These tables don't include any constraints. Review the information from previous chapters to determine what constraints you might need for the City Jail database.

1) First, drop the APPEALS, CRIME_OFFICERS, and CRIME_CHARGES tables constructed in chapter 3. These three tables are to be built last, using a CREATE TABLE command that includes all the necessary constraints.
2) Second, use the ALTER TABLE command to add all constraints to the existing tables. Note that the sequence of constraint addition has an impact. Any tables referenced by FOREIGN KEYs must already have the PRIMARY KEY created.
3) Third, use the CREATE TABLE command, including all constraints, to build the three tables dropped in the first step. 
*/

DROP TABLE  criminals CASCADE CONSTRAINTS;
DROP TABLE  crimes CASCADE CONSTRAINTS;
CREATE TABLE criminals
  (criminal_id NUMBER(6),
   last VARCHAR2(15),
   first VARCHAR2(10),
   street VARCHAR2(30),
   city VARCHAR2(20),
   state CHAR(2),
   zip CHAR(5),
   phone CHAR(10),
   v_status CHAR(1) DEFAULT 'N',
   p_status CHAR(1) DEFAULT 'N' );
CREATE TABLE crimes
  (crime_id NUMBER(9),
   criminal_id NUMBER(6),
   classification CHAR(1),
   date_charged DATE,
   status CHAR(2),
   hearing_date DATE,
   appeal_cut_date DATE);
ALTER TABLE crimes
  MODIFY (classification DEFAULT 'U');
ALTER TABLE crimes
  ADD (date_recorded DATE DEFAULT SYSDATE);
ALTER TABLE criminals
  ADD CONSTRAINT criminals_id_pk PRIMARY KEY (criminal_id);
ALTER TABLE criminals
  ADD CONSTRAINT criminals_vstatus_ck CHECK (v_status IN('Y','N'));
ALTER TABLE criminals
  ADD CONSTRAINT criminals_pstatus_ck CHECK (p_status IN('Y','N'));
ALTER TABLE crimes
  ADD CONSTRAINT crimes_id_pk PRIMARY KEY (crime_id);
ALTER TABLE crimes
  ADD CONSTRAINT crimes_class_ck CHECK (classification IN('F','M','O','U'));
ALTER TABLE crimes
  ADD CONSTRAINT crimes_status_ck CHECK (status IN('CL','CA','IA'));
ALTER TABLE crimes
  ADD CONSTRAINT crimes_criminalid_fk FOREIGN KEY (criminal_id)
             REFERENCES criminals(criminal_id);
ALTER TABLE crimes
  MODIFY (criminal_id NOT NULL);

