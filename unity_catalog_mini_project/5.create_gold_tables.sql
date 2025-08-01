-- Databricks notebook source
-- MAGIC %md
-- MAGIC #### Create managed table in the gold tables
-- MAGIC Join drivers and results to identify the number of wins per drivers

-- COMMAND ----------

DROP TABLE IF EXISTS formula1_dev.gold.drivers;

CREATE TABLE IF NOT EXISTS formula1_dev.gold.drivers AS
SELECT
  d.full_name, count(1) AS number_of_wins
FROM formula1_dev.silver.drivers d
JOIN formula1_dev.silver.results r
ON d.driver_id = r.driver_id
WHERE r.position = 1
GROUP BY d.full_name

-- COMMAND ----------

SELECT * FROM formula1_dev.gold.drivers ORDER BY number_of_wins DESC