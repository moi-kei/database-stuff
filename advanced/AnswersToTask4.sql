/*
a. Find employees whose first name includes the string “st” and live in
Edinburgh, displaying their full names
*/
---select the names and addresses
SELECT e.print_name() AS name, e.address.print_address() AS address
FROM employee_table e
---where first name contains 'st' and lives in edinburgh
WHERE UPPER(e.name.firstName) LIKE '%ST%'
AND e.address.city = 'Edinburgh';
/
/*
b. Find the number of saving accounts at each branch, displaying the
number and the branch’s address.
*/
---select address of branch and number of accounts
SELECT a.branch_r.address.print_address() AS address,
	count(a.accType) AS "number of savings accounts"
FROM account_table a
---where accType is savings
WHERE UPPER(accType) = 'SAVINGS'
GROUP BY a.accType, a.branch_r.address.print_address();
/
/*
c. At each branch, find customers who have the lowest balance in their
savings account, displaying the branch ID, the customer’s full names,
and the balance.
*/
---select, bid, full name, and balance
SELECT c.account_r.branch_r.bID AS bID,
	c.customer_r.print_name() AS name,
	c.account_r.balance AS balance
FROM (
	---select the minimum balance from each branch
	SELECT c.account_r.branch_r.bID AS bID,
		MIN(c.account_r.balance) AS balance
	FROM CustomerAccount c
	WHERE c. account_r.accType = 'Savings'
	GROUP BY c.account_r.branch_r.bID, c.account_r.accType
	) balance, customerAccount c
---where the minimum balance mathes the mimimum balance of the branch
WHERE c.account_r.branch_r.bID = balance.bID
AND c.account_r.balance = balance.balance;
/
/*
d. Find employees who are supervised by a manager and have accounts in
the bank, displaying the branch address that the employee works in and
the branch address that the account is opened with.
*/
---select name, banks they work at, and bank they are a customer at
SELECT e.print_name() AS name,
	e.branch_r.address.print_address() AS "Employed at",
	c.account_r.branch_r.address.print_address() AS "Banks with"
FROM employee_table e
---inner join customer_table and account_table on niNum
---which returns the people that works at the banks and have an account in the bank
INNER JOIN customerAccount c
ON e.niNum = c.customer_r.niNum
---where the employees supervisor is a manager
WHERE e.supervisor_r.job.position LIKE '%Manager';
/
/*
e. At each branch, find customers who have the highest free overdraft
limit in all current accounts that are joint accounts, displaying the
branch’s ID, the customer’s full names, the free overdraft limit in the
joint current account.
*/
---select the bid, account holder names, and thier overdraft
SELECT maxJoint.bID as bID,
	MIN(c.customer_r.print_name()) || ', ' || MAX(c.customer_r.print_name()) AS "Account Holders",
	maxJoint.OD AS OD
FROM (
	---select each entry that the OD matches the maxOD from subquery
	SELECT bID,
		accNum,
		OD
	FROM (
		---add row that contains the highest OD jointAccount from the branch
		SELECT jointAccounts.bID AS bID,
			jointAccounts.accNum AS accNum,
			jointAccounts.OD AS OD,
			MAX(jointAccounts.OD) OVER (PARTITION BY jointAccounts.bID) AS maxOD
		FROM (
			---select all acounts with more than 1 holder
			SELECT c.account_r.accNum AS accNum,
				c.account_r.branch_r.bID AS bID,
				MAX(c.account_r.limitOfFreeOD) AS OD,
				COUNT(c.account_r.accNum) AS accountHolders
			FROM customerAccount c
			GROUP BY c.account_r.accNum, c.account_r.branch_r.bID
			HAVING COUNT(c.account_r.accNum) > 1) jointAccounts
		)
	WHERE OD = maxOD) maxJoint, customerAccount c
WHERE c.account_r.accNum = maxJoint.accNum
GROUP BY maxJoint.bID, maxJoint.OD;
/
/*
f. Find customers who have more than one mobile, and at least one of the
numbers starts with 0750, displaying the customer’s full name and
mobile numbers. COLLECTIONS must be used.
*/
--select name, ID, and all mobile numbers
SELECT c.custID AS custID,
	c.print_name() AS name,
	c.print_phones('mobile') AS "mobile numbers"
FROM (
	---select all customers that have more than 1 mobile
	SELECT c.custID AS custID
    FROM customer_table c, table(c.phone) p
	WHERE p.phoneType = 'mobile'
	GROUP BY c.custID, p.phoneType
	HAVING COUNT(p.phonetype) > 1) multipleMobiles, 
	customer_table c, table(c.phone) p
---where customer has multiple mobiles and at least one begins with '0750'
WHERE c.custID = multipleMobiles.custID
AND p.phoneNumber LIKE '0750%'
---group together in case a customer has more than one mobile beginning with '0750'
GROUP BY c.custID, c.print_name(), c.print_phones('mobile');
/
/*
g. Find the number of employees who are supervised by Mrs Smith, who
is supervised by Mr Barclay. REFERENCES must be used.
*/
---select count of employees
SELECT COUNT(e.empID) AS "Employees supervised by Mrs Smith, who is supervised by Mr. Barclay"
FROM employee_table e
---where supervisor is 'mrs smith'
WHERE e.supervisor_r.name.title = 'Mrs'
AND e.supervisor_r.name.surName = 'Smith'
---and supervisor's supervisor is 'mr barclay'
AND e.supervisor_r.supervisor_r.name.title = 'Mr'
AND e.supervisor_r.supervisor_r.name.surName = 'Barclay';
/
/*
h. Award employees at the end of a year: gold medals for employees who
have been working at the bank for more than 10 years and supervised
more than 10 staff; silver medals for employees who have been
working at the bank for more than 8 years and supervised more than 6
staff; bronze medals for employees who have been working at the bank
for more than 4 years. Displaying winners’ names and Medal awarded
(only displaying those who have been awarded). METHODS must be
used.
*/
---select employees name and award they will be given
SELECT e.print_name() AS name,
	e.award_medal() AS medal
FROM employee_table e
WHERE e.award_medal() IS NOT NULL
---order medals given by gold -> silver -> bronze
ORDER BY CASE WHEN e.award_medal() = 'Gold' THEN 1
              WHEN e.award_medal() = 'Silver' THEN 2
              ELSE 3 END;