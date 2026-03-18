-- Subquery
-- 1. Find customers whose account balance is greater than the average balance of all accounts
select * from customers where customer_id in ( 
    select customer_id from accounts where balance > (
          select avg(balance) from accounts)
);

-- 2. Find the customer who has the highest account balance.
select * from customers where customer_id in(
     select customer_id from accounts where balance = (
       select max(balance) from accounts)
);

-- 3. Find customers who have more than one bank account.
select * from customers where customer_id in(
     select customer_id from accounts group by customer_id having count(account_id) > 1 );
     
-- 4. Find accounts whose balance is below the average balance of savings accounts.
select * from accounts where balance < ( 
 select avg(balance) from accounts where account_type = 'savings');

-- 5. Find customers who made a transaction greater than ₹50,000.
select distinct customer_id from accounts where account_id in(
  select account_id from transactions where amount > 50000.00);
  
-- 6. Find customers who never made any transaction.
select distinct customer_id from accounts where account_id not in (
  select account_id from transactions);
  
-- 7. Find the second highest account balance.
select * from accounts where balance = (
  select max(balance) from accounts where balance < (
      select max(balance) from accounts));
      
-- 8. Find accounts that have transactions above the average transaction amount.
select * from accounts where account_id in (
    select account_id from transactions where amount > (
        select avg(amount) from transactions));
        
-- 9. Find customers who made transactions on the latest transaction date.
select distinct customer_id from accounts where account_id in (
    select account_id from transactions where transaction_date = (
        select max(transaction_date) from transactions));
        
-- 10. Find customers whose balance is higher than their city’s average balance.
select customer_id from accounts where balance > (
    select city, avg(balance) as cities_balance from accounts group by city);
