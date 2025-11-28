---CREATE TYPES
CREATE TYPE tp_name AS OBJECT (
	title VARCHAR2(5),
	firstName VARCHAR2(20),
	surName VARCHAR2(20)
)FINAL;
/
CREATE TYPE tp_phone AS OBJECT (
	phoneType VARCHAR(12),
	phoneNumber VARCHAR(12)
);
/	
CREATE TYPE tp_phone_nested AS TABLE OF tp_phone;
/
CREATE TYPE tp_address AS OBJECT (
	street VARCHAR2(60),
	city VARCHAR2(60),
	postCode VARCHAR2(8)
)FINAL;
/
CREATE TYPE tp_branch AS OBJECT(
	bID INT,
	address tp_address,
	phone tp_phone_nested
)FINAL;
/
CREATE TYPE tp_person AS OBJECT (
	name tp_name,
	phone tp_phone_nested,
	address tp_address,
	niNum VARCHAR(9)
)NOT FINAL;
/
CREATE TYPE tp_job AS OBJECT (
	position VARCHAR2(50),
	salary NUMBER
)FINAL;
/
CREATE TYPE tp_employee UNDER tp_person (
	empID INT,
	supervisor_r REF tp_employee,
	job tp_job,
	branch_r REF tp_branch,
	joinDate DATE
)FINAL;
/
CREATE TYPE tp_customer UNDER tp_person (
	custID INT
)FINAL;
/
CREATE TYPE tp_account AS OBJECT (
	accNum INT,
	accType VARCHAR2(15),
	balance NUMBER,
	branch_r REF tp_branch,
	inRate NUMBER,
	limitOfFreeOD NUMBER,
	openDate DATE
)FINAL;
/
---CREATE TABLES
CREATE TABLE branch_table OF tp_branch (
	CONSTRAINT bID PRIMARY KEY(bID),
	CONSTRAINT baddress CHECK(address IS NOT NULL),
	CONSTRAINT bPhone CHECK(phone IS NOT NULL)
)NESTED TABLE phone STORE AS branch_phone_nested;
/
CREATE TABLE customer_table OF tp_customer (
	CONSTRAINT custID PRIMARY KEY(custID),
	CONSTRAINT cname CHECK(name IS NOT NULL),
	CONSTRAINT cphone CHECK(phone IS NOT NULL),
	CONSTRAINT caddress CHECK(address IS NOT NULL),
	CONSTRAINT cniNum UNIQUE(niNum)
)NESTED TABLE phone STORE AS cust_phone_nested;
/
CREATE TABLE employee_table OF tp_employee (
	CONSTRAINT empID PRIMARY KEY(empID),
	CONSTRAINT ename CHECK(name IS NOT NULL),
	CONSTRAINT ephone CHECK(phone IS NOT NULL),
	CONSTRAINT eaddress CHECK(address IS NOT NULL),
	CONSTRAINT eniNum UNIQUE(niNum),
	CONSTRAINT ejob CHECK(job IS NOT NULL),
	CONSTRAINT ebranch_r CHECK(branch_r IS NOT NULL),
	CONSTRAINT joinDate CHECK(joinDate IS NOT NULL)
)NESTED TABLE phone STORE AS emp_phone_nested;
/
CREATE TABLE account_table OF tp_account (
	CONSTRAINT accNum PRIMARY KEY(accNum),
	CONSTRAINT accType CHECK(accType IS NOT NULL),
	CONSTRAINT abranch_r CHECK(branch_r IS NOT NULL),
	CONSTRAINT inRate CHECK(inRate IS NOT NULL),
	CONSTRAINT limitOfFreeOD CHECK(limitOfFreeOD IS NOT NULL),
	CONSTRAINT openDate CHECK(openDate IS NOT NULL)
);
/
CREATE TABLE CustomerAccount (
	customer_r REF tp_customer SCOPE IS customer_table,
	account_r REF tp_account SCOPE IS account_table
);
/
---METHODS
ALTER TYPE tp_person
ADD MEMBER FUNCTION print_name RETURN STRING,
ADD MEMBER FUNCTION print_phones(phoneType_in STRING) RETURN STRING
CASCADE;
/
CREATE OR REPLACE TYPE BODY tp_person AS
	MEMBER FUNCTION print_name RETURN STRING IS
		BEGIN
			RETURN name.title || '. ' || name.firstName || ' ' || name.surName;
		END print_name;

	MEMBER FUNCTION print_phones(phoneType_in STRING) RETURN STRING IS
		phone_list STRING(50) := '';
		BEGIN
			FOR i IN 1 .. SELF.phone.COUNT LOOP
				IF SELF.phone(i).phoneType = phoneType_in THEN
					IF phone_list IS NOT NULL THEN
						phone_list := phone_list || ', ';
					END IF;
					phone_list := phone_list || SELF.phone(i).phoneNumber;
				END IF;
			END LOOP;
		RETURN phone_list;
	END print_phones;
END;
/	
ALTER TYPE tp_address
ADD MEMBER FUNCTION print_address RETURN STRING
CASCADE;
/
CREATE OR REPLACE TYPE BODY tp_address AS
MEMBER FUNCTION print_address RETURN STRING IS
	BEGIN
		RETURN self.street || ', ' || self.city || ', ' || self.postCode;
	END print_address;
END;
/
ALTER TYPE tp_employee
ADD MEMBER FUNCTION award_medal RETURN STRING
CASCADE;
/
CREATE OR REPLACE TYPE BODY tp_employee AS
MEMBER FUNCTION award_medal RETURN STRING IS
supervises INT;
	BEGIN
		SELECT COUNT(*)
		INTO supervises
		FROM employee_table
		WHERE DEREF(supervisor_r) = self;
		
		IF MONTHS_BETWEEN(SYSDATE, self.joinDate) > 120
		AND supervises > 10
			THEN RETURN 'Gold';
		
		ELSIF MONTHS_BETWEEN(SYSDATE, self.joinDate) > 96
		AND supervises > 6
			THEN RETURN 'Silver';
		
		ELSIF MONTHS_BETWEEN(SYSDATE, self.joinDate) > 48
			THEN RETURN 'Bronze';
			
		ELSE RETURN NULL;	
		END IF;
	END award_medal;
END;