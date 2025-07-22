-- Databricks notebook source
-- MAGIC %md
-- MAGIC #### Create Catalogs and Schema requried for the project
-- MAGIC 1. Catalog - formula1_dev (without managed location)
-- MAGIC 1. Schemas - bronze, silver, gold (with managed location)

-- COMMAND ----------

CREATE CATALOG IF NOT EXISTS formula1_dev

-- COMMAND ----------

USE CATALOG formula1_dev

-- COMMAND ----------

CREATE SCHEMA IF NOT EXISTS bronze
MANAGED LOCATION "abfss://bronze@formula1datalake1802.dfs.core.windows.net/"

-- COMMAND ----------

CREATE SCHEMA IF NOT EXISTS silver
MANAGED LOCATION "abfss://silver@formula1datalake1802.dfs.core.windows.net/"

-- COMMAND ----------

CREATE SCHEMA IF NOT EXISTS gold
MANAGED LOCATION "abfss://gold@formula1datalake1802.dfs.core.windows.net/"