create database banking;
use banking;

-- customers table
CREATE TABLE customers (
 customer_id INT PRIMARY KEY,
 name VARCHAR(100),
 city VARCHAR(50),
 phone VARCHAR(15)
);

insert into customers values
(1,'Arun Kumar','Chennai','9876543210'),
(2,'Priya Sharma','Bangalore','9845012345'),
(3,'Rahul Verma','Mumbai','9823456789'),
(4,'Sneha Reddy','Hyderabad','9811122233'),
(5,'Karthik Raj','Coimbatore','9798765432'),
(6,'Divya Nair','Kochi','9789012345'),
(7,'Vikram Singh','Delhi','9778899001'),
(8,'Meena Iyer','Madurai','9765544332'),
(9,'Ajay Patel','Ahmedabad','9756677889'),
(10,'Pooja Gupta','Pune','9743344556'),

(11,'Sanjay Das','Kolkata','9732211445'),
(12,'Nisha Kapoor','Chandigarh','9729988776'),
(13,'Ravi Teja','Vijayawada','9712345678'),
(14,'Lakshmi Devi','Trichy','9701122334'),
(15,'Manoj Yadav','Lucknow','9698877665'),
(16,'Anita Joseph','Thiruvananthapuram','9687766554'),
(17,'Deepak Choudhary','Jaipur','9676655443'),
(18,'Kavya N','Mysore','9665544331'),
(19,'Harish Babu','Salem','9654433221'),
(20,'Shalini Menon','Kozhikode','9643322110'),

(21,'Prakash Jha','Patna','9632211009'),
(22,'Reshma Khan','Bhopal','9621100998'),
(23,'Gokul Krishna','Erode','9610099887'),
(24,'Farhan Ali','Nagpur','9609988776'),
(25,'Bhavya Shah','Surat','9598877665'),
(26,'Naveen Kumar','Tirunelveli','9587766554'),
(27,'Swathi S','Vellore','9576655443'),
(28,'Amit Tiwari','Kanpur','9565544332'),
(29,'Keerthi R','Kanchipuram','9554433221'),
(30,'Rohit Mehta','Indore','9543322110'),

(31,'Sathish Kumar','Karur','9532211009'),
(32,'Neha Agarwal','Noida','9521100998'),
(33,'Bharath Kumar','Hosur','9510099887'),
(34,'Tasneem B','Mangalore','9509988776'),
(35,'Dinesh Kumar','Namakkal','9498877665'),
(36,'Preethi S','Thoothukudi','9487766554'),
(37,'Yogesh Patil','Nashik','9476655443'),
(38,'Aarthi Ravi','Cuddalore','9465544332'),
(39,'Imran Sheikh','Aurangabad','9454433221'),
(40,'Varun Shetty','Udupi','9443322110');

-- Accounts table
CREATE TABLE accounts (
 account_id INT PRIMARY KEY,
 customer_id INT,
 account_type VARCHAR(20),
 balance DECIMAL(12,2),
 open_date DATE,
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

insert into accounts values
(201,35,'Savings',45230.75,'2021-03-15'),
(202,1,'Current',125000.00,'2020-11-20'),
(203,40,'Savings',78540.50,'2022-01-10'),
(204,12,'Fixed Deposit',250000.00,'2019-07-05'),
(205,7,'Savings',16320.20,'2023-02-18'),

(206,28,'Savings',98210.90,'2021-09-12'),
(207,3,'Current',305600.00,'2018-12-01'),
(208,19,'Savings',27450.00,'2022-06-25'),
(209,33,'Fixed Deposit',500000.00,'2017-04-30'),
(210,5,'Savings',11200.75,'2023-05-09'),

(211,22,'Savings',68900.00,'2020-08-14'),
(212,14,'Current',94000.40,'2021-10-03'),
(213,39,'Savings',35670.60,'2022-03-21'),
(214,9,'Savings',47080.00,'2023-01-11'),
(215,31,'Fixed Deposit',150000.00,'2019-09-17'),

(216,18,'Savings',22340.55,'2022-12-08'),
(217,2,'Current',178900.75,'2020-02-27'),
(218,27,'Savings',90560.10,'2021-06-19'),
(219,11,'Savings',14875.30,'2023-07-22'),
(220,24,'Fixed Deposit',275000.00,'2018-05-13'),

(221,6,'Savings',55230.00,'2021-04-10'),
(222,37,'Current',88000.00,'2022-02-28'),
(223,15,'Savings',66540.45,'2020-06-16'),
(224,29,'Fixed Deposit',320000.00,'2019-03-08'),
(225,4,'Savings',19200.00,'2023-08-19'),

(226,26,'Savings',73500.75,'2021-12-01'),
(227,8,'Current',210450.20,'2018-10-25'),
(228,34,'Savings',28440.00,'2022-09-14'),
(229,10,'Fixed Deposit',410000.00,'2017-01-30'),
(230,21,'Savings',15400.80,'2023-06-05'),

(231,30,'Savings',60320.60,'2020-07-22'),
(232,13,'Current',134500.00,'2021-11-11'),
(233,38,'Savings',49870.35,'2022-04-18'),
(234,16,'Savings',26780.00,'2023-03-09'),
(235,25,'Fixed Deposit',190000.00,'2019-12-27'),

(236,17,'Savings',84500.00,'2021-05-06'),
(237,32,'Current',99000.90,'2020-01-15'),
(238,20,'Savings',37660.25,'2022-07-07'),
(239,36,'Savings',21890.00,'2023-09-12'),
(240,23,'Fixed Deposit',295000.00,'2018-08-03');

-- Transactions table
CREATE TABLE transactions (
 transaction_id INT PRIMARY KEY,
 account_id INT,
 transaction_type VARCHAR(20),
 amount DECIMAL(10,2),
 transaction_date DATETIME,
 FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

insert into transactions values
(1001,235,'Deposit',25000.00,'2023-01-15 10:30:00'),
(1002,201,'Withdrawal',5000.00,'2023-02-11 14:45:00'),
(1003,240,'Transfer',12000.50,'2023-03-05 09:20:00'),
(1004,212,'Deposit',45000.00,'2023-01-25 16:10:00'),
(1005,207,'Withdrawal',15000.75,'2023-04-18 11:05:00'),

(1006,228,'Deposit',32000.00,'2023-05-09 13:40:00'),
(1007,203,'Transfer',8700.00,'2023-02-27 10:00:00'),
(1008,219,'Withdrawal',6400.00,'2023-06-14 15:25:00'),
(1009,233,'Deposit',98000.00,'2023-07-01 12:50:00'),
(1010,205,'Transfer',7600.60,'2023-03-22 17:35:00'),

(1011,222,'Deposit',15000.00,'2023-01-30 09:15:00'),
(1012,214,'Withdrawal',8200.20,'2023-08-11 18:05:00'),
(1013,239,'Deposit',44000.00,'2023-09-02 11:45:00'),
(1014,209,'Transfer',22500.00,'2023-04-07 14:10:00'),
(1015,231,'Withdrawal',9100.00,'2023-02-19 16:55:00'),

(1016,218,'Deposit',37500.75,'2023-05-25 10:20:00'),
(1017,202,'Transfer',13200.00,'2023-06-30 13:05:00'),
(1018,227,'Withdrawal',5400.40,'2023-03-12 15:15:00'),
(1019,211,'Deposit',28500.00,'2023-07-19 09:40:00'),
(1020,224,'Transfer',64000.00,'2023-01-09 12:30:00'),

(1021,206,'Withdrawal',7300.00,'2023-08-21 17:20:00'),
(1022,237,'Deposit',52000.00,'2023-02-03 10:10:00'),
(1023,215,'Transfer',17800.00,'2023-03-28 11:55:00'),
(1024,229,'Deposit',89000.90,'2023-04-16 14:35:00'),
(1025,204,'Withdrawal',25000.00,'2023-05-07 16:45:00'),

(1026,236,'Deposit',41000.00,'2023-06-18 09:25:00'),
(1027,210,'Transfer',9600.00,'2023-07-23 12:15:00'),
(1028,232,'Withdrawal',8800.80,'2023-08-05 15:50:00'),
(1029,220,'Deposit',13400.00,'2023-09-10 11:35:00'),
(1030,213,'Transfer',22200.00,'2023-01-20 13:30:00'),

(1031,221,'Withdrawal',6700.00,'2023-02-14 17:10:00'),
(1032,238,'Deposit',30500.00,'2023-03-09 10:45:00'),
(1033,216,'Transfer',15800.75,'2023-04-26 12:05:00'),
(1034,230,'Deposit',72000.00,'2023-05-31 14:55:00'),
(1035,223,'Withdrawal',9300.00,'2023-06-12 16:20:00'),

(1036,208,'Deposit',26500.00,'2023-07-04 09:05:00'),
(1037,234,'Transfer',11800.00,'2023-08-29 11:15:00'),
(1038,217,'Withdrawal',14500.60,'2023-09-15 13:40:00'),
(1039,225,'Deposit',48000.00,'2023-02-22 15:30:00'),
(1040,226,'Transfer',19900.00,'2023-03-17 18:00:00');
