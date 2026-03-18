-- MySQL Function
------------------------------------------------------------------------------
-- 21 – Full Customer Name
-- Create a function to return customer name using customer_id.
------------------------------------------------------------------------------
delimiter //

create function Customer_name( cust_id int)
returns varchar(30)
deterministic
begin
declare cust_name varchar(30);

select name 
into cust_name from customers 
where customer_id = cust_id;

return cust_name;
end //

delimiter ;

-- Function execution example
select customer_name(5);

------------------------------------------------------------------------------
-- 22 – Account Balance
-- Create a function to return balance of a given account.
------------------------------------------------------------------------------
delimiter //

create function account_balance (acc_id int)
returns decimal(10,2)
deterministic
begin
declare acc_balance decimal (10,2);

select balance into acc_balance
from accounts
where account_id = acc_id;

return acc_balance;
end //

delimiter ;

-- Function execution example
select account_balance(250);

------------------------------------------------------------------------------
-- 23 – Total Transactions
-- Create a function to return total number of transactions for an account.
------------------------------------------------------------------------------
delimiter //

create function Total_transaction (acc_id int)
returns int
deterministic
begin
declare total_transactions int;

select count(*) into Total_transactions
from transactions 
where account_id = acc_id;

return Total_transactions;
end //

delimiter ;

-- Function execution example
select Total_transaction (205);

------------------------------------------------------------------------------
-- 24 – Total Deposits
-- Create a function to calculate total deposited amount for an account.
------------------------------------------------------------------------------
delimiter //

create function Total_deposits (acc_id int)
returns decimal(10,2)
deterministic
begin
declare Total_dep decimal(10,2);

select sum(amount) into Total_dep
from transactions
where account_id = acc_id
and transaction_type = 'deposit';

return Total_dep;
end //

delimiter ;

-- Function execution example
select Total_deposits(218);

------------------------------------------------------------------------------
-- 25 – Total Withdrawals
-- Create a function to calculate total withdrawn amount for an account.
------------------------------------------------------------------------------
delimiter //

create function Total_withdrawal (acc_id int)
returns decimal (10,2)
deterministic
begin
declare Total_withdraw decimal(10,2);

select sum(amount) into Total_withdraw
from transactions
where account_id = acc_id and
transaction_type = 'withdrawal';

return Total_withdraw;
end //

delimiter ;

-- Function execution example
select Total_withdrawal (232);

------------------------------------------------------------------------------
-- 26 – Customer Total Balance
-- Create a function to calculate total balance across all accounts of a customer.
------------------------------------------------------------------------------
delimiter //

create function Total_balance(cust_id int)
returns decimal(10,2)
deterministic
begin
declare cust_balance decimal(10,2);

select balance into cust_balance from accounts
where customer_id = cust_id;

return cust_balance;
end //

delimiter ;

-- Function execution example
select Total_balance(15);

------------------------------------------------------------------------------
-- 27 – Average Transaction
-- Create a function to calculate average transaction amount of an account.
------------------------------------------------------------------------------
delimiter //

create function Avg_transaction(acc_id int)
returns decimal(10,2)
deterministic
begin
declare average_trans decimal(10,2);

select avg(amount) 
into average_trans from transactions
where account_id = acc_id;

return average_trans;
end //

delimiter ;

-- Function execution example
select Avg_transaction (220);

------------------------------------------------------------------------------
-- 28 – High Value Account Check
-- Create a function that returns TRUE if balance > ₹1,00,000.
------------------------------------------------------------------------------
delimiter //

create function High_value_check(acc_id int)
returns varchar(10)
deterministic
begin
declare bal decimal(10,2);
declare Value_check varchar(10);

select balance 
into bal from accounts
where account_id = acc_id;

if bal > 100000.00 then
set value_check = 'True';
else
set value_check = 'False';
end if;

return value_check;
end //

delimiter ;

-- Function execution example
select high_value_check (230);

------------------------------------------------------------------------------
-- 29 – Transaction Count Today
-- Create a function to return number of transactions made today.
------------------------------------------------------------------------------
delimiter //

create function Transaction_count_today(acc_id int)
returns int
deterministic
begin
declare Total_transaction int;

select count(*) 
into Total_transaction from transactions
where account_id = acc_id and date(transaction_type) = curdate();

return Total_transaction;
end //

delimiter ;

-- Function execution example
select transaction_count_today (250);

------------------------------------------------------------------------------
-- 30 – Account Age
-- Create a function to calculate how many years the account has been active.
------------------------------------------------------------------------------
delimiter //

create function account_age (acc_id int)
returns int
deterministic
begin
declare activation_years int;

select timestampdiff(year, open_date, curdate())
into activation_years
from accounts
where account_id = acc_id;

return activation_years;
end //

delimiter ;

-- Function execution example
select account_age (205);