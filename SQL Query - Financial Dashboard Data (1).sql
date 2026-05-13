/*
SQL Project: Credit Card Financial Dashboard Data Import
Description: This script creates the database schema and imports transaction
             and customer data from CSV files for financial analysis.
*/

-- 0. Create the Database
-- Execute this line first, then connect to 'ccdb' before running the rest.
CREATE DATABASE ccdb;

-- 1. Create cc_detail table
CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

-- 2. Create cust_detail table
CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

-- 3. Set DateStyle for Import
-- Ensures DD-MM-YYYY formats are parsed correctly during COPY commands.
SET datestyle TO 'ISO, DMY';

-- 4. Import Initial CSV Data
-- REPLACE '<PASTE_YOUR_LOCAL_PATH>' with your actual folder path (e.g., 'C:/Data/')

-- Import Credit Card Details
COPY cc_detail
FROM '<PASTE_YOUR_LOCAL_PATH>/credit_card.csv'
DELIMITER ','
CSV HEADER;

-- Import Customer Details
COPY cust_detail
FROM '<PASTE_YOUR_LOCAL_PATH>/customer.csv'
DELIMITER ','
CSV HEADER;

-- 5. Import Supplemental Data (Week-53)
-- This ensures the dashboard includes the most recent transaction updates.

COPY cc_detail
FROM '<PASTE_YOUR_LOCAL_PATH>/cc_add.csv'
DELIMITER ','
CSV HEADER;

COPY cust_detail
FROM '<PASTE_YOUR_LOCAL_PATH>/cust_add.csv'
DELIMITER ','
CSV HEADER;

-- 6. Verification
-- Run these to ensure data was imported successfully
SELECT COUNT(*) FROM cc_detail;
SELECT COUNT(*) FROM cust_detail;
