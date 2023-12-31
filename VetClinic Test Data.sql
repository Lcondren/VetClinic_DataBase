

CREATE TABLE PATIENT (
 FIRSTNAME         CHAR(9),
 LASTNAME          CHAR(9),
 PATIENTID         SMALLINT(3) NOT NULL,
 PET               CHAR(9),
PRIMARY KEY (PATIENTID));


INSERT INTO PATIENT VALUES ('BRÍDÍN','HALPERT', 001,'BIRD');
INSERT INTO PATIENT VALUES ('MOSSIE','FITZMAURICE', 002,'HORSE');
INSERT INTO PATIENT VALUES ('ELIZABETH','FITZWILLIAM', 003,'CAT');
INSERT INTO PATIENT VALUES ('EDWARD','BEESLEY', 004,'HAMSTER');
INSERT INTO PATIENT VALUES ('SEAN','OREILLY', 005,'PIG');
INSERT INTO PATIENT VALUES ('MICHAEL','SCOTT', 006,'LLAMA');


CREATE TABLE PET (
 PETNAME             CHAR(9),
 ANIMALTYPE          CHAR(9),
 MEDICATION          CHAR(9),
 PATIENTID           SMALLINT(3) NOT NULL,
FOREIGN KEY (PATIENTID) REFERENCES PATIENT(PATIENTID),
PRIMARY KEY (PETNAME));



INSERT INTO PET VALUES ('LASSIE','BIRD','HEART_CONDITION',001);
INSERT INTO PET VALUES ('SKY','HORSE','CHOLESTEROL',002);
INSERT INTO PET VALUES ('OSCAR','CAT','BLINDNESS',003);
INSERT INTO PET VALUES ('FLOPPY','HAMSTER','ASTHMA',004);
INSERT INTO PET VALUES ('HANK','PIG','BLOOD PRESSURE',005);
INSERT INTO PET VALUES ('ROXY','LLAMA','EPILEPSY',006);


CREATE TABLE STAFF (
 STAFFNO       SMALLINT(4) NOT NULL,
 STAFFNAME     CHAR(9),
 JOB           CHAR(9),
 PATIENTID     SMALLINT(3) NOT NULL,
FOREIGN KEY (PATIENTID) REFERENCES PATIENT(PATIENTID),
PRIMARY KEY (STAFFNO));

INSERT INTO STAFF VALUES (103, 'LARRY FITZGERALD','VET',001);
INSERT INTO STAFF VALUES (104, 'JENNY DOYLE','VET',002);
INSERT INTO STAFF VALUES (105, 'EMMA WILSON','NURSE',003);
INSERT INTO STAFF VALUES (106, 'ROXANNE MERRIGAN','NURSE',004);
INSERT INTO STAFF VALUES (107, 'KEVIN WILDE','NURSE',005);
INSERT INTO STAFF VALUES (108, 'ANGELA WATSON','VET',006);

CREATE TABLE BILLING (
 PAYMENTID        SMALLINT(3) NOT NULL,
 LASTPAYMENTDATE  VARCHAR(10),
 PRICEPAID          CHAR(9),
 PAYMENTSTATUS      CHAR(10),
 PETNAME            CHAR(9),
FOREIGN KEY (PETNAME) REFERENCES PET(PETNAME),
PRIMARY KEY (PAYMENTID));

INSERT INTO BILLING VALUES (175,'2020-12-12','YES','COMPLETE','LASSIE');
INSERT INTO BILLING VALUES (165,'2021-10-05','NO','INCOMPLETE','OSCAR');
INSERT INTO BILLING VALUES (187,'2022-03-15','YES','COMPLETE','SKY');
INSERT INTO BILLING VALUES (194,'2022-05-15','NO','INCOMPLETE','HANK');
INSERT INTO BILLING VALUES (203,'2022-08-25','YES','COMPLETE','ROXY');
INSERT INTO BILLING VALUES (207,'2022-11-20','YES','COMPLETE','FLOPPY');