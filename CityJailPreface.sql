/* Kayla Cook */
/* City Jail Database project */
/* This was a semester long project, with weekly end of chapter assignments */

/* Project Overview: 

---------------------------------------------

Your company receives the following memo. 

First based off the memo, create an inital database design (E-R model) for the City Jail that indicates entities, attributes,
primary keys, and relationships. In developing your design, consider the columns needed to build relationships between the entities.
Use only the entitites identified in the memo to develop the E-R model.

Second, create a list of additional entities or attributes not identified in the memo that might be applicable to a crime-tracking database.

Keep in mind that the memo is written from an end-user perspective, not by a database developer.

MEMO:
To: Database Consultant
From: City Jail Information Director
Subject: Establishing a Crime-Tracking Database System

It was a pleasure meeting with you last week. I look forward to working with your company to create a much-needed crime-tracking system. As you requested, our project group has outlined the crime-tracking data we anticipate. Our goal is to simplify the process of tracking criminal activity and provide a more efficient mechanism for data analysis and reporting. Please review the data needs outlined below and contact me with any questions.

Criminals: name, address, phone number, violent offender status(yes/no), probation status(yes/no), and aliases

Crimes: classification(felony, misdemeanor, other), date charged, appeal status(closed, can appeal, in appeal), hearing date, appeal cutoff date(always 60 days after the hearing date), arresting officers(can be more than one officer), crime codes(such as burglary, forgery, assault; hundreds of codes exist), amount of fine, court fee, amount paid, payment due date, and charge status(pending, guilty, not guilty)

Sentencing: start date, end date, number of violations(such as not reporting to probation officer), and type of sentence(jail period, house arrest, probation)

Appeals: appeal filing date, appeal hearing date, status(pending, approved, and disapproved) * Note each crime case can be apealed up to three times

Police Officers: name, precinct, badge number, phone contact, status(active/inactive)

Additional Notes:
--- A single crime can involve multiple crime charges, such as burglary and assault
--- Criminals can be assigned multiple sentences. For example, a criminal might be required to serve a jail sentence followed by a period of probation

-------------------------------------------------------------

*/
