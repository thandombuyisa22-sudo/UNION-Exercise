-- Databricks notebook source

INSERT INTO branch_sandton_accounts(
    account_id,
    account_holder
);

SELECT * FROM branch_sandton_account;

INSERT INTO branch_rosebank_account(
    account_id,
    account_holder
);

SELECT * FROM branch_rosebank_account;



SELECT account_id,
       account_holder,
       'Sandton' AS city
FROM branch_sandton_accounts

UNION

SELECT account_id,
       account_holder,
       'Rosebank' AS city
FROM branch_rosebank_accounts;


INSERT INTO savings_products(
    product_code,
    product_name
);



SELECT * FROM savings_products;


INSERT INTO current_products(
    product_code,
    product_name
);


SELECT * FROM current_products;


SELECT product_code,
       product_name,
       'Savings' AS product_type
FROM savings_products

UNION

SELECT product_code,
       product_name,
       'Current' AS product_type
FROM current_products;


INSERT INTO retail_banking_staff(
    staff_id,
    staff_name
);


SELECT * FROM retail_banking_staff;



INSERT INTO corporate_banking_staff(
    staff_id,
    staff_name
);


SELECT * FROM corporate_banking_staff;



SELECT staff_id,
       staff_name,
       'staff@nexbank.co.za' AS email
FROM retail_banking_staff

UNION

SELECT staff_id,
       staff_name,
       'staff@nexbank.co.za' AS email
FROM corporate_banking_staff;



INSERT INTO mobile_branch_cities(
    city_code,
    city_name
);


SELECT * FROM mobile_branch_cities;



INSERT INTO digital_branch_cities(
    city_code,
    city_name
);


SELECT * FROM digital_branch_cities;



SELECT city_code,
       city_name,
       'South Africa' AS region
FROM mobile_branch_cities

UNION

SELECT city_code,
       city_name,
       'South Africa' AS region
FROM digital_branch_cities;


INSERT INTO push_notification_targets(
    customer_id,
    customer_name
);



SELECT * FROM push_notification_targets;



INSERT INTO inapp_banner_targets(
    customer_id,
    customer_name
);


SELECT * FROM inapp_banner_targets;



SELECT customer_id,
       customer_name,
       'Marketing' AS segment
FROM push_notification_targets

UNION

SELECT customer_id,
       customer_name,
       'Marketing' AS segment
FROM inapp_banner_targets;


INSERT INTO atm01_transactions(
    txn_id,
    account_id,
    amount

);


SELECT* FROM atm01_transactions;



INSERT INTO atm02_transactions(
    txn_id,
    account_id,
    amount
);


SELECT * FROM atm02_transactions;



SELECT txn_id AS transaction_id,
       account_id,
       amount,
       CURRENT_DATE AS transaction_date
FROM atm01_transactions

UNION ALL

SELECT txn_id AS transaction_id,
       account_id,
       amount,
       CURRENT_DATE AS transaction_date
FROM atm02_transactions;



INSERT INTO gauteng_loan_applications(
    app_id,
    customer_id,
    loan_type
);


SELECT * FROM gauteng_loan_applications;



INSERT INTO western_cape_loan_applications(
    app_id,
    customer_id
    loan_type
);




SELECT app_id AS application_id,
       customer_id,
       loan_type,
       NULL AS amount_requested
FROM gauteng_loan_applications

UNION ALL

SELECT app_id AS application_id,
       customer_id,
       loan_type,
       NULL AS amount_requested
FROM western_cape_loan_applications;




INSERT INTO email_complaints(
    complaint_id,
    customer_id
);


SELECT * FROM email_complaints;




INSERT INTO app_complaints(
    complaint_id,
    customer_id
);


SELECT * FROM app_complaints;


SELECT complaint_id,
       customer_id,
       'Email' AS category,
       CURRENT_DATE AS logged_date
FROM email_complaints

UNION ALL

SELECT complaint_id,
       customer_id,
       'App' AS category,
       CURRENT_DATE AS logged_date
FROM app_complaints;



INSERT INTO april_payments(
    payment_id,
    account_id,
    amount
);


SELECT * FROM april_payments;


INSERT INTO may_payments(
    payment_id,
    account_id,
    amount
);


SELECT * FROM may_payments;



SELECT payment_id,
       account_id,
       amount,
       '2025-04-01' AS payment_date
FROM april_payments

UNION ALL

SELECT payment_id,
       account_id,
       amount,
       '2025-05-01' AS payment_date
FROM may_payments;



INSERT INTO debit_entries(
    entry_id,
    account_id,
    entry_type
);


SELECT * FROM debit_entries;


INSERT INTO credit_entries(
    entry_id,
    account_id,
    entry_date
);


SEWLECT * FROM credit_entries;




SELECT entry_id,
       account_id,
       entry_type,
       NULL AS amount,
       CURRENT_DATE AS entry_date
FROM debit_entries

UNION ALL

SELECT entry_id,
       account_id,
       entry_type,
       NULL AS amount,
       CURRENT_DATE AS entry_date
FROM credit_entries;



1.I used UNION because the fraud analyst wants a unique list of customers from both watch lists. If a customer appears in both January and February, they should appear only once.

2.I Use UNION ALL because the auditing team wants to count every transaction. Duplicate transactions must remain in the result so that no records are lost.

3.The query fails because the first SELECT returns 2 columns while the second SELECT returns 3 columns. UNION requires both SELECT statements to return the same number of columns. The fix is to make both SELECT statements return


example fix

SELECT account_id,
       account_holder,
       city
FROM branch_sandton_accounts

UNION

SELECT account_id,
       account_holder,
       city
FROM branch_rosebank_accounts;

