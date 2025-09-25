Use creditRisk;

Create TABLE Customers (
	customer_id varchar(20) Primary key, 
    business_name varchar(200),
    business_type varchar(50),
    country varchar(5),
    province_state varchar(5),
    city varchar(100),
    onboard_method varchar(20),
    created_date Datetime);
    
    
CREATE TABLE accounts (
  account_id   VARCHAR(20) PRIMARY KEY,
  customer_id  VARCHAR(20),
  account_type VARCHAR(20),
  opened_at    DATETIME,
  is_active    TINYINT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE devices (
  device_id          VARCHAR(20) PRIMARY KEY,
  customer_id        VARCHAR(20),
  device_os          VARCHAR(20),
  device_type        VARCHAR(20),
  last_known_country VARCHAR(5),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
  transaction_id  VARCHAR(20) PRIMARY KEY,
  account_id      VARCHAR(20),
  customer_id     VARCHAR(20),
  timestamp       DATETIME,
  channel         VARCHAR(20),
  mcc             VARCHAR(40),
  business_type   VARCHAR(50),
  country         VARCHAR(5),
  txn_country     VARCHAR(5),
  device_id       VARCHAR(20),
  amount          DECIMAL(14,2),
  hour            INT,
  dayofweek       INT,
  is_weekend      TINYINT,
  is_fraud        TINYINT,
  fraud_type      VARCHAR(40),
  FOREIGN KEY (account_id)  REFERENCES accounts(account_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (device_id)   REFERENCES devices(device_id)
);

SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

select * from customers; 