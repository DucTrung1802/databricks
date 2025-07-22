-- Databricks notebook source
-- MAGIC %md
-- MAGIC #### Create Bronze Tables
-- MAGIC 1. driver.json
-- MAGIC 1. results.json
-- MAGIC
-- MAGIC Bronze folder path: `abfss://bronze@formula1datalake1802.dfs.core.windows.net/`

-- COMMAND ----------

DROP TABLE IF EXISTS formula1_dev.bronze.drivers;

CREATE TABLE IF NOT EXISTS formula1_dev.bronze.drivers
(
  driverId INT,
  driverRef STRING,
  number INT,
  code STRING,
  name STRUCT<forename: STRING, surname: STRING>,
  dob DATE,
  nationality STRING,
  url STRING
)
USING JSON
OPTIONS (path "abfss://bronze@formula1datalake1802.dfs.core.windows.net/drivers.json");

-- COMMAND ----------

SELECT name.forename FROM formula1_dev.bronze.drivers
LIMIT 20

-- COMMAND ----------

DROP TABLE IF EXISTS formula1_dev.bronze.results;

CREATE TABLE IF NOT EXISTS formula1_dev.bronze.results
(
    resultId INT NOT NULL,
    raceId INT,
    driverId INT,
    constructorId INT,
    number INT,
    grid INT,
    position INT,
    positionText STRING,
    positionOrder INT,
    points FLOAT,
    laps INT,
    time STRING,
    milliseconds INT,
    fastestLap INT,
    rank INT,
    fastestLapTime STRING,
    fastestLapSpeed FLOAT,
    statusId STRING
)
USING JSON
OPTIONS (path "abfss://bronze@formula1datalake1802.dfs.core.windows.net/results.json");

-- COMMAND ----------

SELECT * FROM formula1_dev.bronze.results
LIMIT 20