---BRANCHES
INSERT INTO branch_table VALUES (
	1,
	tp_address('30 George Street', 'Glasgow', 'G1 2PA'),
	tp_phone_nested(tp_phone('Branch','01412045810'))
);
/	
INSERT INTO branch_table VALUES (
	2,
	tp_address('456 Sauchiehall Street', 'Glasgow', 'G2 3JD'),
	tp_phone_nested(tp_phone('Branch','01413549922'))
);
/	
INSERT INTO branch_table VALUES (
	3,
	tp_address('142 Lothian Road', 'Aberdeen', 'AB11 5BA'),
	tp_phone_nested(tp_phone('Branch','01224345236'))
);
/	
INSERT INTO branch_table VALUES (
	4,
	tp_address('49 Hanover Street', 'Dundee', 'DD1 3DQ'),
	tp_phone_nested(tp_phone('Branch','01382263100'))
);
/	
INSERT INTO branch_table VALUES (
	5,
	tp_address('30 St Andrew Square', 'Inverness', 'IV1 1EX'),
	tp_phone_nested(tp_phone('Branch','01463259900'))
);
/	
INSERT INTO branch_table VALUES (
	6,
	tp_address('100 George Street', 'Prestonpans', 'EH32 9BG'),
	tp_phone_nested(tp_phone('Branch','01312258088'))
);
/	
INSERT INTO branch_table VALUES (
	7,
	tp_address('80 George Street', 'Haddington', 'EH41 3QS'),
	tp_phone_nested(tp_phone('Branch','01312255432'))
);
/	
INSERT INTO branch_table VALUES (
	8,
	tp_address('68-72 Rose Street', 'Haddington', 'EH41 3QS'),
	tp_phone_nested(tp_phone('Branch','03457134341'))
);
/	
INSERT INTO branch_table VALUES (
	9,
	tp_address('15-17 South St Andrew Street', 'Edinburgh', 'EH12 3AB'),
	tp_phone_nested(tp_phone('Branch','03457134405'))
);
/	
INSERT INTO branch_table VALUES (
	10,
	tp_address('2 Rutland Square', 'Edinburgh', 'EH1 2AS'),
	tp_phone_nested(tp_phone('Branch','03457134401'))
);
/	
INSERT INTO branch_table VALUES (
	11,
	tp_address('30-34 North Bridge', 'Glasgow', 'G1 1QN'),
	tp_phone_nested(tp_phone('Branch','03457134402'))
);
/	
INSERT INTO branch_table VALUES (
	12,
	tp_address('12-14 Frederick Street', 'Glasgow', 'G2 2HB'),
	tp_phone_nested(tp_phone('Branch','03457134404'))
);
/	
INSERT INTO branch_table VALUES (
	13,
	tp_address('35-37 Leith Street', 'Glasgow', 'G3 3AT'),
	tp_phone_nested(tp_phone('Branch','03457134403'))
);
/	
INSERT INTO branch_table VALUES (
	14,
	tp_address('36 Nicolson Street', 'Edinburgh', 'EH8 9DT'),
	tp_phone_nested(tp_phone('Branch','03457134406'))
);
/	
INSERT INTO branch_table VALUES (
	15,
	tp_address('6-7 South St Andrew Street', 'Edinburgh', 'EH2 2AZ'),
	tp_phone_nested(tp_phone('Branch','01312261204'))
);
/
---EMPLOYEES
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Ross', 'Barclay'),
	tp_phone_nested(
		tp_phone('home', '01823748472'),
		tp_phone('mobile', '94848923887'),
		tp_phone('mobile', '07283849392')),
	tp_address('15 Sauchiehall Street', 'Glasgow', 'G2 4DA'),
	'PC435465A',
	1000,
	NULL,
	tp_job('Regional Manager', 115000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	'10-Feb-2006'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mrs', 'Emily', 'Smith'),
	tp_phone_nested(
		tp_phone('home', '01412044444'),
		tp_phone('mobile', '07849920038'),
		tp_phone('mobile', '0123456789')),
	tp_address('45 Buchanan Street', 'Glasgow', 'G1 3HL'),
	'PC123456A',
	1001,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1000),
	tp_job('Manager', 65000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	'10-Feb-2006'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Sarah', 'Morrison'),
	tp_phone_nested(
		tp_phone('home', '01415620000'),
		tp_phone('mobile', '07999123456')),
	tp_address('98 Sauchiehall Street', 'Glasgow', 'G2 3DE'),
	'PC234567B',
	1002,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1001),
	tp_job('Sales Associate', 22000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	'15-Mar-2022'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'David', 'Clark'),
	tp_phone_nested(
		tp_phone('home', '01416334455'),
		tp_phone('mobile', '07771234567')),
	tp_address('72 George Street', 'Glasgow', 'G1 1RF'),
	'PC345678C',
	1003,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1001),
	tp_job('Senior Accountant', 40000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	'20-Jul-2015'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Emily', 'Stewart'),
	tp_phone_nested(
		tp_phone('home', '01418888888'),
		tp_phone('mobile', '07654321098')),
	tp_address('14 Argyle Street', 'Glasgow', 'G2 8DL'),
	'PC456789D',
	1004,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1001),
	tp_job('Marketing Manager', 45000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	'05-Sep-2018'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Linda', 'Wilson'),
	tp_phone_nested(
		tp_phone('home', '01415678900'),
		tp_phone('mobile', '07991234567')),
	tp_address('56 Sauchiehall Street', 'Glasgow', 'G2 3DE'),
	'PC678901F',
	1005,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1001),
	tp_job('HR Manager', 42000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	'25-Nov-2017'
);
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Emily', 'Jones'),
	tp_phone_nested(
		tp_phone('home', '01415678900'),
		tp_phone('mobile', '07991234567')),
	tp_address('72 Argyle Street', 'Glasgow', 'G2 8DL'),
	'PC244467B',
	1006,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1001),
	tp_job('Sales Associate', 22000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	'15-Mar-2023'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'David', 'Johnson'),
	tp_phone_nested(
		tp_phone('home', '01419876543'),
		tp_phone('mobile', '07778889999')),
	tp_address('30 Renfield Street', 'Glasgow', 'G2 5AR'),
	'PC123678C',
	1007,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1001),
	tp_job('Financial Analyst', 45000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	'20-Nov-2018'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Sophia', 'Miller'),
	tp_phone_nested(
		tp_phone('home', '01412233445'),
		tp_phone('mobile', '07897766543')),
	tp_address('15 Hope Street', 'Glasgow', 'G2 6AB'),
	'PC456111D',
	1008,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1001),
	tp_job('Marketing Specialist', 38000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	'05-Apr-2017'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Michael', 'Brown'),
	tp_phone_nested(
		tp_phone('home', '01415554433'),
		tp_phone('mobile', '07666554433')),
	tp_address('10 George Square', 'Glasgow', 'G2 1AL'),
	'PC567890E',
	1009,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1001),
	tp_job('IT Manager', 50000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	'10-Oct-2016'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Olivia', 'Davis'),
	tp_phone_nested(
		tp_phone('home', '01418887766'),
		tp_phone('mobile', '07554433221')),
	tp_address('5 St Vincent Place', 'Glasgow', 'G1 2DH'),
	'PC633301F',
	1010,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1001),
	tp_job('HR Coordinator', 32000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	'30-Sep-2019'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Connor', 'Young'),
	tp_phone_nested(
		tp_phone('home', '0678901234'),
		tp_phone('mobile', '07849920038'),
		tp_phone('mobile', '0123456789')),
	tp_address('222 Argyle Street', 'Glasgow', 'G2 8TL'),
	'PC999678C',
	1011,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1001),
	tp_job('Customer Service Representative', 25000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	'10-Feb-22'
);
/ 
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Matthew', 'Street'),
	tp_phone_nested(
		tp_phone('home', '0212345678'),
		tp_phone('mobile','07993847734'),
		tp_phone('mobile', '0890123456')),
	tp_address('777 Elm Street', 'Glasgow', 'G4 7YZ'),
	'PC012345M',
	1012,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1001),
	tp_job('Investment Banker', 70000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 10),
	'30-Mar-99'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'David', 'Miller'),
	tp_phone_nested(
		tp_phone('home', '0234567890'),
		tp_phone('mobile','07839492753'),
		tp_phone('mobile', '0789012345')),
	tp_address('123 Argyle Street', 'Glasgow', 'G2 8XY'),
	'PC789012D',
	1013,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1000),
	tp_job('Branch Manager', 76000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	'15-Nov-07'
); 
/
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Rachel', 'Wilson'),
	tp_phone_nested(
		tp_phone('home', '0345678901'),
		tp_phone('mobile','07485993843'),
		tp_phone('mobile', '0567890123')),
	tp_address('456 Buchanan Street', 'Glasgow', 'G1 3HR'),
	'PC901234R',
	1014,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1013),
	tp_job('Manager', 42000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	'02-Mar-04'
); 
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Ryan', 'Campbell'),
	tp_phone_nested(
		tp_phone('home', '0456789012'),
		tp_phone('mobile','07859399483'),
		tp_phone('mobile', '0678901234')),
	tp_address('789 Sauchiehall Street', 'Glasgow', 'G3 7UW'),
	'PC123456R',
	1015,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1013),
	tp_job('Financial Advisor', 49000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	'18-Sep-05'
); 
/	
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Sophie', 'Walker'),
	tp_phone_nested(
		tp_phone('home', '0567890123'),
		tp_phone('mobile','07839572634'),
		tp_phone('mobile', '0789012345')),
	tp_address('101 Union Street', 'Glasgow', 'G1 3TA'),
	'PC234567S',
	1016,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1013),
	tp_job('Teller', 23000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	'29-Apr-20'
); 
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Connor', 'Young'),
	tp_phone_nested(
		tp_phone('home', '01412044444'),
		tp_phone('mobile', '07849920038'),
		tp_phone('mobile', '0123456789')),
	tp_address('45 Buchanan Street', 'Glasgow', 'G1 3HL'),
	'PC126666A',
	1017,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1013),
	tp_job('Customer Service Representative', 25000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	'10-Feb-2006'
);
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Sarah', 'Clarke'),
	tp_phone_nested(
		tp_phone('home', '01415620000'),
		tp_phone('mobile', '07999123456')),
	tp_address('98 Sauchiehall Street', 'Glasgow', 'G2 3DE'),
	'PC737645D',
	1018,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1013),
	tp_job('Sales Associate', 22000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	'15-Mar-2020'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Liam', 'Campbell'),
	tp_phone_nested(
		tp_phone('home', '01415556677'),
		tp_phone('mobile', '07894433221')),
	tp_address('25 Buchanan Street', 'Glasgow', 'G1 3HL'),
	'PC901234I',
	1019,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1013),
	tp_job('Software Engineer', 48000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	'20-Sep-2016'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Harper', 'Mitchell'),
	tp_phone_nested(
		tp_phone('home', '01411223344'),
		tp_phone('mobile', '07779998877')),
	tp_address('8 Sauchiehall Street', 'Glasgow', 'G2 3DE'),
	'PC012345J',
	1020,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1013),
	tp_job('Marketing Coordinator', 32000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	'15-Jul-2019'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mrs', 'Sophie', 'Smith'),
	tp_phone_nested(
		tp_phone('home', '0345678901'),
		tp_phone('mobile', '07987654321'),
		tp_phone('mobile', '07551423419')),
	tp_address('789 Bridge Street', 'Aberdeen', 'AB25 1AB'),
	'PC345678F',
	1021,
	NULL,
	tp_job('Manager', 49000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	'14-Oct-20'
); 
/	
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Jack', 'Grant'),
	tp_phone_nested(
		tp_phone('home', '0456789012'),
		tp_phone('mobile', '07765432109'),
		tp_phone('mobile', '07551423419')),
	tp_address('101 High Street', 'Aberdeen', 'AB15 6CD'),
	'PC456789G',
	1022,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1021),
	tp_job('Teller', 33000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	'03-Jun-09'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Emma', 'Murray'),
	tp_phone_nested(
		tp_phone('home', '0567890123'),
		tp_phone('mobile', '07891234567'),
		tp_phone('mobile', '07551423419')),
	tp_address('222 Market Street', 'Aberdeen', 'AB16 5EF'),
	'PC567890M',
	1023,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1021),
	tp_job('Customer Service', 25000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	'27-Feb-18'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Daniel', 'Smith'),
	tp_phone_nested(
		tp_phone('home', '0678901234'),
		tp_phone('mobile', '07654321098'),
		tp_phone('mobile', '07551423419')),
	tp_address('333 King Street', 'Aberdeen', 'AB16 5GH'),
	'PC678901S',
	1024,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1021),
	tp_job('Customer Service', 25000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	'15-Oct-08'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'David', 'Brown'),
	tp_phone_nested(
		tp_phone('home', '0678901234'),
		tp_phone('mobile', '07654321098'),
		tp_phone('mobile', '07551423419')),
	tp_address('444 Queen Street', 'Aberdeen', 'AB17 5IJ'),
	'PC789412D',
	1025,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1021),
	tp_job('Customer Service', 25000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	'15-Oct-08'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Emma', 'Wilson'),
	tp_phone_nested(
		tp_phone('home', '01224561234'),
		tp_phone('mobile', '07766554433')),
	tp_address('33 Union Street', 'Aberdeen', 'AB11 5DS'),
	'PC123789E',
	1026,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1021),
	tp_job('Sales Representative', 28000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	'10-Jun-2012'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Daniel', 'Smith'),
	tp_phone_nested(
		tp_phone('home', '01224678900'),
		tp_phone('mobile', '07894433221')),
	tp_address('55 Rosemount Place', 'Aberdeen', 'AB25 2XP'),
	'PC456123F',
	1027,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1021),
	tp_job('IT Technician', 32000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	'25-Mar-2015'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Sophie', 'MacDonald'),
	tp_phone_nested(
		tp_phone('home', '01224567890'),
		tp_phone('mobile', '07991234567')),
	tp_address('20 Great Northern Road', 'Aberdeen', 'AB24 3PU'),
	'PC789456G',
	1028,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1021),
	tp_job('HR Assistant', 30000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	'18-Nov-2018'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Norman', 'MacDonald'),
	tp_phone_nested(
		tp_phone('home', '01224567890'),
		tp_phone('mobile', '07539948839')),
	tp_address('20 Great Northern Road', 'Aberdeen', 'AB24 3PU'),
	'PC735492G',
	1029,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1021),
	tp_job('HR Assistant', 30000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	'18-Nov-2018'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mrs', 'Caitlin', 'Smith'),
	tp_phone_nested(
		tp_phone('home', '01224678900'),
		tp_phone('mobile', '0750394828')),
	tp_address('55 Rosemount Place', 'Aberdeen', 'AB25 2XP'),
	'PC283920F',
	1030,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1021),
	tp_job('IT Technician', 32000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	'25-Mar-2015'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Andrew', 'Stevenson'),
	tp_phone_nested(
		tp_phone('home', '0245678901'),
		tp_phone('mobile','07839928485'),
		tp_phone('mobile', '0789012345')),
	tp_address('555 Pine Street', 'Inverness', 'IV1 1YZ'),
	'PC890123A',
	1031,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1000),
	tp_job('Manager', 54000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 5),
	'28-Jul-03'
);
/	
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Christopher', 'Brown'),
		tp_phone_nested(
		tp_phone('home', '0198765432'),
		tp_phone('mobile','07567384923'),
		tp_phone('mobile', '0123456789')),
	tp_address('789 Elm Street', 'Edinburgh', 'EH6 5CD'),
	'PC987654C',
	1032,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1000),
	tp_job('Manager', 55000),
	(SELECT REF(b) FROM branch_table b WHERE b.bID = 9),
	'21-Feb-99'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'John', 'Stewart'),
	tp_phone_nested(
		tp_phone('home', '0178945632'),
		tp_phone('mobile','07465838473'),
		tp_phone('mobile', '0345678901')),
	tp_address('222 Maple Street', 'Edinburgh', 'EH9 8YZ'),
	'PC789012J',
	1033,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1032),
	tp_job('Customer Service', 25000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 9),
	'03-Oct-21'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Mrs', 'Victoria', 'Walker'),
	tp_phone_nested(
		tp_phone('home', '0156789012'),
		tp_phone('mobile','07388477374'),
		tp_phone('mobile', '0234567890')),
	tp_address('666 Oak Street', 'Edinburgh', 'EH3 4CD'),
	'PC678901W',
	1034,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1032),
	tp_job('Compliance Officer', 48000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 9),
	'20-Apr-08'
);
/	
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Jennifer', 'Smith'),
	tp_phone_nested(
		tp_phone('home', '0189324567'),
		tp_phone('mobile','07499599383'),
		tp_phone('mobile', '0678901234')),
	tp_address('444 Cedar Street', 'Edinburgh', 'EH11 9AB'),
	'PC234567J',
	1035,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1032),
	tp_job('Teller', 21000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 9),
	'02-Feb-06'
);
/
INSERT INTO employee_table VALUES (
	tp_name('Ms', 'Laura', 'Campbell'),
	tp_phone_nested(
		tp_phone('home', '0267890123'),
		tp_phone('mobile','07938847734'),
		tp_phone('mobile', '0123456789')),
	tp_address('888 Maple Street', 'Edinburgh', 'EH7 6XY'),
	'PC901234L',
	1036,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1032),
	tp_job('Teller', 35000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 9),
	'09-Jul-05'
);	
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Matthew', 'Street'),
	tp_phone_nested(
		tp_phone('mobile','07848273849'),
		tp_phone('mobile', '0678901234')),
	tp_address('666 Oak Street', 'Edinburgh', 'EH3 4CD'),
	'PC678901I',
	1037,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1032),
	tp_job('Manager', 40000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 9),
	'28-mar-06'
	);
/
INSERT INTO employee_table VALUES (
	tp_name('Mr', 'Steven', 'Stewart'),
	tp_phone_nested(
		tp_phone('home', '0225678901'),
		tp_phone('mobile','07839948273')),
	tp_address('1212 Elm Street', 'Edinburgh', 'EH5 6YZ'),
	'PC506070O',
	1038,
	(SELECT ref(e) FROM employee_table e WHERE e.empID = 1032),
	tp_job('Customer Service', 27000),
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 9),
	'28-Aug-18'
);
/
---CUSTOMERS
INSERT INTO customer_table VALUES (
	tp_name('Ms', 'Sarah', 'Morrison'),
	tp_phone_nested(
		tp_phone('home', '01415620000'),
		tp_phone('mobile', '07999123456')),
	tp_address('98 Sauchiehall Street', 'Glasgow', 'G2 3DE'),
	'PC234567B',
	1001
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'David', 'Clark'),
	tp_phone_nested(
		tp_phone('home', '01416334455'),
		tp_phone('mobile', '07771234567')),
	tp_address('72 George Street', 'Glasgow', 'G1 1RF'),
	'PC345678C',
	1002
);
/
INSERT INTO customer_table VALUES (
	tp_name('Ms', 'Laura', 'Campbell'),
	tp_phone_nested(
		tp_phone('home', '0189324576'),
		tp_phone('mobile1','07899237756')),
	tp_address('777 Elm Street', 'Glasgow', 'G4 7YZ'),
	'PC998877J',
	1003
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mrs', 'Sarah', 'Williams'),
	tp_phone_nested(tp_phone('mobile', '0249012345')),
	tp_address('1313 Maple Street', 'Glasgow', 'G5 8YZ'),
	'PC607080P',
	1004
);
/
INSERT INTO customer_table VALUES (
	tp_name('Ms', 'Samantha', 'Stewart'),
	tp_phone_nested(
		tp_phone('home', '0123456789'),
		tp_phone('mobile','07838492938')),
	tp_address('456 High Street', 'Glasgow', 'G12 8YZ'),
	'PC654321B',
	1005
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Jack', 'Grant'),
	tp_phone_nested(
		tp_phone('home', '0456789012'),
		tp_phone('mobile', '07765432109'),
		tp_phone('mobile', '07551423419')),
	tp_address('101 High Street', 'Aberdeen', 'AB15 6CD'),
	'PC456789G',
	1006
);
/
INSERT INTO customer_table VALUES (
	tp_name('Ms', 'Emma', 'Murray'),
	tp_phone_nested(
		tp_phone('home', '0567890123'),
		tp_phone('mobile', '07891234567'),
		tp_phone('mobile', '07551423419')),
	tp_address('222 Market Street', 'Aberdeen', 'AB16 5EF'),
	'PC567890M',
	1007
);
/
INSERT INTO customer_table VALUES (
	tp_name('Ms', 'Jennifer', 'Smith'),
	tp_phone_nested(
		tp_phone('home', '0246881357'),
		tp_phone('mobile','08988128764')),
	tp_address('333 Birch Street', 'Aberdeen', 'AB1 2XY'),
	'PC445566F',
	1008
);
/
INSERT INTO customer_table VALUES (
	tp_name('Ms', 'Hannah', 'Scott'),
	tp_phone_nested(
		tp_phone('home', '0237890123'),
		tp_phone('mobile','07836748374')),
	tp_address('1111 Oak Street', 'Aberdeen', 'AB2 4XY'),
	'PC405060N',
	1009
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Cameron', 'Jones'),
	tp_phone_nested(
		tp_phone('home', '0739488232'),
		tp_phone('mobile', '0779348899'),
		tp_phone('mobile', '0750939348')),
	tp_address('15 High Street', 'Aberdeen', 'AB15 5CD'),
	'PC447879G',
	1010
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mrs', 'Connie', 'Grant'),
	tp_phone_nested(
		tp_phone('home', '0456789012'),
		tp_phone('mobile', '07388938432')),
	tp_address('101 High Street', 'Aberdeen', 'AB15 6CD'),
	'PC645829A',
	1011
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Connor', 'Martin'),
	tp_phone_nested(
		tp_phone('home', '0456789012'),
		tp_phone('mobile', '07505432109'),
		tp_phone('mobile', '07551423419')),
	tp_address('15 Abbotswell Drive', 'Aberdeen', 'AB12 5QN'),
	'PC456635T',
	1012
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mrs', 'Evie', 'Martin'),
	tp_phone_nested(
		tp_phone('home', '0456789012'),
		tp_phone('mobile', '07506662109'),
		tp_phone('mobile', '07508938432')),
	tp_address('15 Abbotswell Drive', 'Aberdeen', 'AB12 5QN'),
	'PC67773A',
	1013
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mrs', 'Emma', 'Stone'),
	tp_phone_nested(
		tp_phone('mobile','01782947737'),
		tp_phone('mobile', '0112233445')),
	tp_address('101 Oak Street', 'Dundee', 'DD1 1XY'),
	'PC112233D',
	1014
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mrs', 'Rebecca', 'Stewart'),
	tp_phone_nested(
		tp_phone('home', '0178945632'),
		tp_phone('mobile','07889345273')),
	tp_address('999 Cedar Street', 'Dundee', 'DD2 3AB'),
	'PC304050L',
	1015
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mrs', 'Victoria', 'Walker'),
	tp_phone_nested(
		tp_phone('home', '0145678901'),
		tp_phone('mobile','07355479327')),
	tp_address('555 Pine Street', 'Inverness', 'IV1 1YZ'),
	'PC223344H',
	1016
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'John', 'Stevenson'),
	tp_phone_nested(tp_phone('mobile1','07367488233')),
	tp_address('123 Main Street', 'Edinburgh', 'EH12 3AB'),
	'PC123456A',
	1017
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Christopher', 'Brown'),
	tp_phone_nested(
		tp_phone('home', '0198765432'),
		tp_phone('mobile','07567384923'),
		tp_phone('mobile', '0123436789')),
	tp_address('789 Elm Street', 'Edinburgh', 'EH6 5CD'),
	'PC987654C',
	1018
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Robert', 'Stewart'),
	tp_phone_nested(
		tp_phone('home', '0132456789'),
		tp_phone('mobile','0983647737'),
		tp_phone('mobile', '0556677889')),
	tp_address('222 Maple Street', 'Edinburgh', 'EH9 8YZ'),
	'PC556677E',
	1019
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Andrew', 'Stevenson'),
	tp_phone_nested(
		tp_phone('mobile','07836482834'),
		tp_phone('mobile', '0334455667')),
	tp_address('444 Cedar Street', 'Edinburgh', 'EH11 9AB'),
	'PC334455G',
	1020
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Matthew', 'Street'),
	tp_phone_nested(
		tp_phone('mobile','07553467625'),
		tp_phone('mobile', '0678901234')),
	tp_address('666 Oak Street', 'Edinburgh', 'EH3 4CD'),
	'PC678901I',
	1021
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Daniel', 'Stevenson'),
	tp_phone_nested(
		tp_phone('mobile','07489384756'),
		tp_phone('mobile', '0102030405')),
	tp_address('888 Maple Street', 'Edinburgh', 'EH7 6XY'),
	'PC102030K',
	1022
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'James', 'Thompson'),
	tp_phone_nested(
		tp_phone('mobile','07355478374'),
		tp_phone('mobile', '0203040506')),
	tp_address('1010 Pine Street', 'Edinburgh', 'EH8 5CD'),
	'PC203040M',
	1023
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Steven', 'Stewart'),
	tp_phone_nested(
		tp_phone('home', '0225678901'),
		tp_phone('mobile','07584838493')),
	tp_address('1212 Elm Street', 'Edinburgh', 'EH5 6YZ'),
	'PC506070O',
	1024
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Adam', 'Stewart'),
	tp_phone_nested(tp_phone('mobile', '0298765432')),
	tp_address('1414 Cedar Street', 'Edinburgh', 'EH6 7AB'),
	'PC708091Q',
	1025
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Peter', 'Stevenson'),
	tp_phone_nested(tp_phone('mobile', '0201234567')),
	tp_address('1616 Oak Street', 'Edinburgh', 'EH4 8CD'),
	'PC910111S',
	1026
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mrs', 'Jane', 'Stevenson'),
	tp_phone_nested(tp_phone('mobile', '0784592834')),
	tp_address('1616 Oak Street', 'Edinburgh', 'EH4 8CD'),
	'PC837248R',
	1027
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Michael', 'Mackenzie'),
	tp_phone_nested(
		tp_phone('home', '01875753376'),
		tp_phone('mobile','07551423419'),
		tp_phone('mobile', '07732062333')),
	tp_address('13D Riverside Drive', 'Haddington', 'EH413QS'),
	'PC790407D',
	1028
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Darren', 'Smith'),
	tp_phone_nested(tp_phone('mobile','07464372182')),
	tp_address('13 cuthill', 'Prestonpans', 'EH32 9BG'),
	'PC691230C',
	1029
); 
/	
INSERT INTO customer_table VALUES (
	tp_name('Mrs', 'Martha', 'Smith'),
	tp_phone_nested(tp_phone('mobile','0748394948')),
	tp_address('13 cuthill', 'Prestonpans', 'EH32 9BG'),
	'PC345543C',
	1030
); 
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'George', 'Gray'),
	tp_phone_nested(tp_phone('mobile', '0823934848')),
	tp_address('9 Dalry Road', 'Edinburgh', 'EH5 7DB'),
	'PC764834Q',
	1031
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mrs', 'Shaunna', 'Gray'),
	tp_phone_nested(tp_phone('mobile', '07991637477')),
	tp_address('9 Dalry Road', 'Edinburgh', 'EH5 7DB'),
	'PC123321Q',
	1032
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mr', 'Steven', 'Smith'),
	tp_phone_nested(tp_phone('mobile', '07567567876')),
	tp_address('13 Dalry Road', 'Edinburgh', 'EH5 7DB'),
	'PC093748Q',
	1033
);
/
INSERT INTO customer_table VALUES (
	tp_name('Mrs', 'Annie', 'Smith'),
	tp_phone_nested(
		tp_phone('mobile', '07766848398'),
		tp_phone('mobile', '07507897543')),
	tp_address('13 Dalry Road', 'Edinburgh', 'EH5 7DB'),
	'PC777666Q',
	1034
);
/
---ACCOUNTS
INSERT INTO account_table VALUES (
	10000001,
	'Savings',
	2200,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	0.02,
	250,
	'14-dec-21'
);
/
INSERT INTO account_table VALUES (
	10000002,
	'standard',
	1500,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	0.02,
	1000,
	'18-Nov-2020'
);
/	
INSERT INTO account_table VALUES (
	10000003,
	'Savings',
	4200,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	0.04,
	300,
	'29-Apr-2021'
);
/	
INSERT INTO account_table VALUES (
	10000004,
	'standard',
	2800,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	0.025,
	800,
	'07-Sep-2019'
);
/	
INSERT INTO account_table VALUES (
	10000005,
	'Savings',
	5000,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 1),
	0.035,
	1000,
	'22-Mar-2020'
);
/
INSERT INTO account_table VALUES (
	10000006,
	'Savings',
	4000,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	0.03,
	600,
	'10-Oct-2021'
);
/
INSERT INTO account_table VALUES (
	10000007,
	'standard',
	2000,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	0.02,
	1200,
	'25-May-2020'
);
/
INSERT INTO account_table VALUES (
	10000008,
	'standard',
	4500,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	0.04,
	800,
	'15-Jul-2019'
);
/	
INSERT INTO account_table VALUES (
	10000009,
	'standard',
	3000,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	0.025,
	1000,
	'07-Feb-2020'
	);
/	
INSERT INTO account_table VALUES (
	10000010,
	'Savings',
	5500,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 2),
	0.035,
	1500,
	'30-Nov-2020'
);
/
INSERT INTO account_table VALUES (
	10000011,
	'Savings',
	3800,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	0.028,
	700,
	'14-Sep-2019'
);
/	
INSERT INTO account_table VALUES (
	10000012,
	'standard',
	2200,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	0.021,
	1300,
	'05-Apr-2020'
);
/	
INSERT INTO account_table VALUES (
	10000013,
	'Savings',
	4900,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	0.038,
	600,
	'22-Oct-2021'
);
/	
INSERT INTO account_table VALUES (
	10000014,
	'standard',
	3200,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	0.026,
	900,
	'09-Nov-2020'
);
/	
INSERT INTO account_table VALUES (
	10000015,
	'Savings',
	5800,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 3),
	0.045,
	1200,
	'17-Jul-2019'
);
/
INSERT INTO account_table VALUES (
	10000016,
	'Savings',
	4100,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 4),
	0.032,
	800,
	'03-Dec-2020'
);
/	
INSERT INTO account_table VALUES (
	10000017,
	'standard',
	2400,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 4),
	0.024,
	1100,
	'15-Aug-2019'
);
/	
INSERT INTO account_table VALUES (
	10000018,
	'Savings',
	4700,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 4),
	0.036,
	700,
	'28-Feb-2021'
);
/	
INSERT INTO account_table VALUES (
	10000019,
	'standard',
	3400,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 4),
	0.028,
	1000,
	'09-Oct-2020'
);
/
INSERT INTO account_table VALUES (
	10000020,
	'standard',
	6100,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 4),
	0.048,
	1300,
	'12-Jun-2019'
);
/
INSERT INTO account_table VALUES (
	10000021,
	'Savings',
	4300,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 5),
	0.034,
	900,
	'21-Nov-2021'
);
/	
INSERT INTO account_table VALUES (
	10000022,
	'standard',
	2600,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 5),
	0.027,
	1200,
	'04-Jul-2020'
);
/	
INSERT INTO account_table VALUES (
	10000023,
	'Savings',
	5000,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 5),
	0.04,
	600,
	'13-Mar-2019'
);
/	
INSERT INTO account_table VALUES (
	10000024,
	'standard',
	3600,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 5),
	0.03,
	1100,
	'27-Sep-2020'
);
/	
INSERT INTO account_table VALUES (
	10000025,
	'Savings',
	6300,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 5),
	0.05,
	1400,
	'09-Jan-2021'
);
/
INSERT INTO account_table VALUES (
	10000026,
	'Savings',
	4500,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 6),
	0.036,
	950,
	'08-Oct-2021'
);
/	
INSERT INTO account_table VALUES (
	10000027,
	'standard',
	2800,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 6),
	0.029,
	1300,
	'12-Apr-2020'
);
/	
INSERT INTO account_table VALUES (
	10000028,
	'Savings',
	5200,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 6),
	0.042,
	700,
	'24-Feb-2019'
);
/	
INSERT INTO account_table VALUES (
	10000029,
	'standard',
	3800,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 6),
	0.032,
	1200,
	'19-Nov-2020'
);
/	
INSERT INTO account_table VALUES (
	10000030,
	'Savings',
	6700,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 6),
	0.052,
	1500,
	'07-Jun-2019'
	);
/
INSERT INTO account_table VALUES (
	10000031,
	'Savings',
	4700,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 7),
	0.038,
	1000,
	'15-Sep-2021'
);
/	
INSERT INTO account_table VALUES (
	10000032,
	'Savings',
	2900,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 7),
	0.03,
	1400,
	'20-May-2020'
);
/	
INSERT INTO account_table VALUES (
	10000033,
	'Savings',
	5400,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 7),
	0.044,
	800,
	'03-Jan-2019'
);
/
INSERT INTO account_table VALUES (
	10000034,
	'Savings',
	4000,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 7),
	0.034,
	1300,
	'28-Oct-2020'
);
/	
INSERT INTO account_table VALUES (
	10000035,
	'Savings',
	7100,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 7),
	0.056,
	1600,
	'11-Mar-2019'
);
/
INSERT INTO account_table VALUES (
	10000036,
	'Savings',
	4900,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 8),
	0.04,
	1050,
	'20-Aug-2021'
);
/	
INSERT INTO account_table VALUES (
	10000037,
	'standard',
	3000,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 8),
	0.031,
	1500,
	'05-Apr-2020'
);
/	
INSERT INTO account_table VALUES (
	10000038,
	'Savings',
	5600,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 8),
	0.046,
	850,
	'17-Feb-2019'
);
/	
INSERT INTO account_table VALUES (
	10000039,
	'standard',
	4200,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 8),
	0.036,
	1400,
	'12-Nov-2020'
);
/	
INSERT INTO account_table VALUES (
	10000040,
	'Savings',
	7500,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 8),
	0.06,
	1700,
	'25-Jun-2019'
);
/
INSERT INTO account_table VALUES (
	10000041,
	'Savings',
	5100,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 9),
	0.042,
	1100,
	'05-Oct-2021'
);
/	
INSERT INTO account_table VALUES (
	10000042,
	'standard',
	3200,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 9),
	0.033,
	1600,
	'10-Mar-2020'
);
/	
INSERT INTO account_table VALUES (
	10000043,
	'Savings',
	5800,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 9),
	0.048,
	900,
	'22-Jan-2019'
);
/	
INSERT INTO account_table VALUES (
	10000044,
	'standard',
	4400,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 9),
	0.038,
	1500,
	'16-Oct-2020'
);
/	
INSERT INTO account_table VALUES (
	10000045,
	'Savings',
	7900,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 9),
	0.062,
	1800,
	'29-May-2019'
);
/
INSERT INTO account_table VALUES (
	10000046,
	'Savings',
	5300,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 10),
	0.044,
	1150,
	'10-Sep-2021'
);
/	
INSERT INTO account_table VALUES (
	10000047,
	'standard',
	3400,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 10),
	0.035,
	1650,
	'15-Feb-2020'
);
/	
INSERT INTO account_table VALUES (
	10000048,
	'Savings',
	6100,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 10),
	0.05,
	950,
	'27-Dec-2018'
);
/	
INSERT INTO account_table VALUES (
	10000049,
	'standard',
	4600,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 10),
	0.04,
	1550,
	'22-Sep-2020'
);
/	
INSERT INTO account_table VALUES (
	10000050,
	'Savings',
	8300,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 10),
	0.066,
	1900,
	'05-Jun-2019'
);
/
INSERT INTO account_table VALUES (
	10000051,
	'Savings',
	5500,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 11),
	0.046,
	1200,
	'15-Aug-2021'
);
/	
INSERT INTO account_table VALUES (
	10000052,
	'standard',
	3600,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 11),
	0.037,
	1700,
	'20-Jan-2020'
);
/	
INSERT INTO account_table VALUES (
	10000053,
	'Savings',
	6400,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 11),
	0.052,
	1000,
	'02-Nov-2018'
);
/	
INSERT INTO account_table VALUES (
	10000054,
	'standard',
	4800,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 11),
	0.041,
	1600,
	'17-Oct-2020'
);
/	
INSERT INTO account_table VALUES (
	10000055,
	'Savings',
	8700,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 11),
	0.07,
	2000,
	'10-Apr-2019'
	);
/
INSERT INTO account_table VALUES (
	10000056,
	'Savings',
	5700,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 12),
	0.048,
	1250,
	'20-Jul-2021'
);
/	
INSERT INTO account_table VALUES (
	10000057,
	'standard',
	3800,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 12),
	0.039,
	1750,
	'25-Nov-2020'
);
/	
INSERT INTO account_table VALUES (
	10000058,
	'Savings',
	6700,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 12),
	0.054,
	1050,
	'08-Mar-2019'
);
/	
INSERT INTO account_table VALUES (
	10000059,
	'standard',
	5000,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 12),
	0.043,
	1650,
	'12-Oct-2020'
);
/	
INSERT INTO account_table VALUES (
	10000060,
	'Savings',
	9100,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 12),
	0.073,
	2100,
	'15-May-2019'
);
/
INSERT INTO account_table VALUES (
	10000061,
	'Savings',
	5900,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 13),
	0.05,
	1300,
	'18-Jun-2021'
);
/	
INSERT INTO account_table VALUES (
	10000062,
	'standard',
	4000,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 13),
	0.041,
	1800,
	'22-Oct-2020'
);
/	
INSERT INTO account_table VALUES (
	10000063,
	'Savings',
	6900,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 13),
	0.056,
	1100,
	'02-Feb-2019'
);
/	
INSERT INTO account_table VALUES (
	10000064,
	'standard',
	5200,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 13),
	0.045,
	1700,
	'05-Sep-2020'
);
/	
INSERT INTO account_table VALUES (
	10000065,
	'Savings',
	9500,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 13),
	0.076,
	2200,
	'18-Apr-2019'
);
/
INSERT INTO account_table VALUES (
	10000066,
	'Savings',
	6100,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 14),
	0.052,
	1350,
	'25-May-2021'
);
/	
INSERT INTO account_table VALUES (
	10000067,
	'standard',
	4200,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 14),
	0.043,
	1850,
	'29-Sep-2020'
);
/	
INSERT INTO account_table VALUES (
	10000068,
	'Savings',
	7100,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 14),
	0.058,
	1150,
	'11-Jan-2019'
);
/	
INSERT INTO account_table VALUES (
	10000069,
	'standard',
	5400,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 14),
	0.047,
	1750,
	'15-Aug-2020'
);
/	
INSERT INTO account_table VALUES (
	10000070,
	'Savings',
	9900,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 14),
	0.079,
	2300,
	'28-Mar-2019'
);
/
INSERT INTO account_table VALUES (
	10000071,
	'standard',
	6300,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 15),
	0.054,
	1400,
	'30-Apr-2021'
);
/	
INSERT INTO account_table VALUES (
	10000072,
	'standard',
	4400,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 15),
	0.045,
	1900,
	'04-Nov-2020'
);
/	
INSERT INTO account_table VALUES (
	10000073,
	'standard',
	7300,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 15),
	0.06,
	1200,
	'16-Feb-2019'
);
/	
INSERT INTO account_table VALUES (
	10000074,
	'standard',
	5600,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 15),
	0.049,
	1800,
	'20-Sep-2020'
);
/	
INSERT INTO account_table VALUES (
	10000075,
	'Savings',
	10300,
	(SELECT ref(b) FROM branch_table b WHERE b.bID = 15),
	0.082,
	2400,
	'03-Jun-2019'
);
/
---CustomerAccounts
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1001),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000001)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1002),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000006)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1003),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000002)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1004),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000003)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1005),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000004)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1006),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000011)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1007),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000012)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1008),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000013)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1009),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000014)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1010),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000015)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1011),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000016)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1012),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000017)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1013),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000018)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1014),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000019)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1015),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000020)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1016),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000021)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1017),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000041)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1018),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000042)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1019),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000043)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1020),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000044)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1021),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000045)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1022),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000066)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1023),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000067)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1024),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000068)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1025),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000069)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1026),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000070)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1027),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000071)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1028),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000031)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1029),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000026)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1030),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000026)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1031),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000072)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1032),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000072)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1033),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000073)
	);
/
INSERT INTO CustomerAccount VALUES (
	(SELECT ref(c) FROM customer_table c WHERE c.custID = 1034),
	(SELECT ref(a) FROM account_table a WHERE a.accNum = 10000073)
	);
/