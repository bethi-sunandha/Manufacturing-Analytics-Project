CREATE DATABASE IF NOT EXISTS production_db;
USE production_db;

CREATE TABLE IF NOT EXISTS production_data (
  record_id INT AUTO_INCREMENT PRIMARY KEY,
  production_date DATE,
  department_name VARCHAR(200),
  employee_name VARCHAR(200),
  machine_name VARCHAR(200),
  manufacture_qty INT,
  rejected_qty INT,
  processed_qty INT,
  wastage_qty INT
);

-- Update the path to where you saved the cleaned CSV on your PC:
LOAD DATA LOCAL INFILE 'C:/Users/aswan/Downloads/cleaned_tab.csv'
INTO TABLE production_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(production_date, department_name, employee_name, machine_name, manufacture_qty, rejected_qty, processed_qty, wastage_qty);
SELECT COUNT(*) FROM production_data;            -- total rows
SELECT COUNT(manufacture_qty), COUNT(rejected_qty), COUNT(processed_qty), COUNT(wastage_qty) FROM production_data;
SELECT SUM(manufacture_qty) AS total_manufactured, SUM(rejected_qty) AS total_rejected FROM production_data;
SELECT manufacture_qty, rejected_qty, processed_qty, wastage_qty FROM production_data LIMIT 10;
SELECT * FROM production_data;
SELECT SUM(manufacture_qty) AS total_manufactured FROM production_data;
SELECT SUM(rejected_qty) AS total_rejected FROM production_data;
SELECT SUM(processed_qty) AS total_processed FROM production_data;
SELECT SUM(wastage_qty) AS total_wastage FROM production_data;
SELECT employee_name, SUM(rejected_qty) AS rejected
FROM production_data
GROUP BY employee_name;
SELECT machine_id, SUM(rejected_qty) AS rejected
FROM production_data
GROUP BY machine_name;
SELECT production_date, 
       SUM(manufacture_qty) AS manufactured,
       SUM(rejected_qty) AS rejected,
       SUM(processed_qty) AS processed
FROM production_data
GROUP BY production_date
ORDER BY production_date;
SELECT SUM(manufacture_qty) AS manufactured,
       SUM(rejected_qty) AS rejected
FROM production_data;
SELECT department_name,
       SUM(manufacture_qty) AS manufactured,
       SUM(rejected_qty) AS rejected
FROM production_data
GROUP BY department_name;

SELECT *
FROM production_data;