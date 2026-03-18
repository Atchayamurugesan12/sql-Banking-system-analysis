-- Stored Procedure
------------------------------------------------------------------------------
-- 11 – Create Account
-- Create a stored procedure to open a new bank account for a customer.
------------------------------------------------------------------------------
delimiter //

create procedure create_account(
        in Cs_account_id int,
        in Cs_customer_id int, 
        in Cs_account_type varchar(50),
        in Cs_balance decimal(12,2),
        in Cs_open_date date
)
begin
insert into accounts (account_id, customer_id, account_type, balance, open_date)
values (Cs_account_id, Cs_customer_id, Cs_account_type, Cs_balance, Cs_open_date);
end //

delimiter ;
-- call procedure
call create_account (250, 30, 'Savings', 40000.00, curdate());

------------------------------------------------------------------------------
-- 12 – Deposit Money
-- Create a procedure to deposit money into an account.
------------------------------------------------------------------------------
delimiter //

create procedure deposit_money (
      in trans_id int,
      in D_account_id int,
      in D_trans_type varchar(20),
      in D_amount decimal (10,2),
      in D_trans_date datetime
)
begin
insert into transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
values (trans_id, D_account_id, D_trans_type, D_amount, now());
end //

delimiter ;

-- call procedure
call deposit_money (1041, 250, 'Deposit', 30000.00, now());

------------------------------------------------------------------------------
-- 13 – Withdraw Money
-- Create a procedure to withdraw money from an account.
------------------------------------------------------------------------------
delimiter //

create procedure withdraw_money (
       in trans_id int,
       in W_account_id int,
       in Trans_type varchar(20),
       in W_amount decimal (10,2),
       in trans_date datetime
)
begin 
insert into transactions( transaction_id, account_id, transaction_type, amount, transaction_date)
values( trans_id, W_account_id, trans_type, W_amount, now());
end //

delimiter ;

-- call procedure
call withdraw_money (1042, 210, 'Withdrawal', 20000.00, now());

------------------------------------------------------------------------------
-- 14 – Check Balance
-- Create a procedure to display account balance using account_id.
------------------------------------------------------------------------------
delimiter //

create procedure check_balance(in acc_id int)
begin
select balance from accounts where account_id = acc_id;
end //

delimiter ;

-- call procedure
call check_balance (220);

------------------------------------------------------------------------------
-- 15 – Transfer Money
-- Create a procedure to transfer money between two accounts.
------------------------------------------------------------------------------
delimiter //

create procedure money_transfer(
     in trans_id int,
     in Trans_account_id int,
     in trans_type varchar(20),
     in Trans_amount decimal(10,2),
     in Trans_date datetime
)
begin
insert into transactions( transaction_id, account_id, transaction_type, amount, transaction_date)
values ( trans_id, Trans_account_id, Trans_type, Trans_amount, now());
end //

delimiter ;

-- call procedure
call money_transfer (1045, 250, 'Transfer', 30000.00, now());

------------------------------------------------------------------------------
-- 16 – Transaction History
-- Create a procedure to show all transactions of an account.
------------------------------------------------------------------------------
delimiter // 

create procedure transaction_history()
begin
select * from Transactions;
end //

delimiter ;

-- call procedure
call transaction_history();

------------------------------------------------------------------------------
-- 17 – High Value Transactions
-- Create a procedure to display transactions above a given amount
------------------------------------------------------------------------------
delimiter //

create procedure High_transaction(in Given_amount decimal(10,2))
begin
select * from Transactions where amount > given_amount;
end //

delimiter ;

-- call procedure
call High_transaction(50000.00);

------------------------------------------------------------------------------
-- 18 – Accounts by Customer
-- Create a procedure to list all accounts belonging to a customer
------------------------------------------------------------------------------
Delimiter //
 
create procedure Accounts_by_customer ( in cust_id int)
begin
select * from accounts where customer_id = cust_id ;
end //

delimiter ;

-- call procedure
call Accounts_by_customer(40);

------------------------------------------------------------------------------
-- 19 – Delete Inactive Accounts
-- Create a procedure to delete accounts with zero balance and no transactions.
------------------------------------------------------------------------------
delimiter //

create procedure Inactive_accounts ()
begin
delete from accounts where balance = 0 and account_id not in (
         select account_id from Transactions);
end //

delimiter ;

-- call procedure
call Inactive_accounts();

------------------------------------------------------------------------------
-- 20 – Daily Transaction Report
-- Create a procedure to show total transactions done today.
------------------------------------------------------------------------------
Delimiter //

create procedure daily_transaction ()
begin
select count(*) from transactions where date(transaction_date) = curdate();
end //

delimiter ;

-- call procedure
call daily_transaction();
