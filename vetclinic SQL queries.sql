-- View all information on the billing table
--------------------------------------------------

SELECT * FROM billing;

--------------------------------------------------------------

-- View all those that have paid 
-------------------------------------------------------------

SELECT * FROM billing WHERE PRICEPAID = 'YES';

-------------------------------------------------------------

-- Updating table staff to include Staff Email addresses

---------------------------------------------------------------

ALTER TABLE staff ADD StaffAddress VARCHAR(200);

-----------------------------------------------------------------

-- Update the Vet's email address'

----------------------------------------------------------------------------

UPDATE staff SET StaffAddress = '[emailprotected]' WHERE JOB = 'VET';

---------------------------------------------------------------------------

-- Change the column name from StaffAddress to EmailAddress

-----------------------------------------------------------------------

ALTER TABLE staff change StaffAddress EmailAddress VARCHAR(200);

------------------------------------------------------------------------

--- Add in a new patient in the patient table

-----------------------------------------------------
INSERT INTO patient (FIRSTNAME, LASTNAME, PATIENTID, PET) VALUES ('BARRY', 'DUGGAN', 7, 'OWL');


--- Creating a new Table for Medicine that the Vetinery holds

----------------------------------------------------------------------

CREATE TABLE Medicine (Name VARCHAR(255), Form VARCHAR(255), Price CHAR(9), Strength VARCHAR(255), Quantity CHAR(10));

--------------------------------------------------------------------------------------------------------------------------

--- Update information in the table for Medicine

-------------------------------------------------------------------------------
INSERT INTO medicine (Name, Form, Price , Strength, Quantity) VALUES('Steriod', 'Liquid', 45, 'Strong', 25), ('Opioid', 'Tablet', 20, 'Strong', 55);

-------------------------------------------------------------------------------

-- Delete Phone Number column in patient's table

---------------------------------------------------------------------------------

ALTER TABLE patient DROP COLUMN PhoneNo;

------------------------------------------------------------------------------------

--Update how the payment was made for those who have paid

-------------------------------------------------------------------------------------

UPDATE billing SET PaymentMethod = 'Online' WHERE PETNAME = 'LASSIE';
UPDATE billing SET PaymentMethod = 'CASH' WHERE PETNAME = 'SKY';
UPDATE billing SET PaymentMethod = 'CARD' WHERE PETNAME = 'ROXY';

-------------------------------------------------------------------------------------

-- Add Patient Grainne Walsh to the list

---------------------------------------------------------------------------------------

INSERT INTO patient (FIRSTNAME, LASTNAME, PATIENTID, PET) VALUES ('GRAINNE', 'WALSH', 8, 'SHEEP');

--------------------------------------------------------------------------------------

-- DELETE patient GRAINNE WALSH from the patient table

-------------------------------------------------------------------------------------

DELETE patient WHERE PATIENTID = 8;

-------------------------------------------------------------------------------------