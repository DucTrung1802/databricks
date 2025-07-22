-- Databricks notebook source
-- MAGIC %md
-- MAGIC #### Create the external locations required for this project
-- MAGIC 1. Bronze
-- MAGIC 1. Silver
-- MAGIC 1. Gold

-- COMMAND ----------

CREATE EXTERNAL LOCATION IF NOT EXISTS formula1datalake1802_bronze URL
'abfss://bronze@formula1datalake1802.dfs.core.windows.net/' WITH (
  STORAGE CREDENTIAL databricks_course_external_storage_credential
) COMMENT 'Default source for Azure exernal data';

-- COMMAND ----------

DESC EXTERNAL LOCATION formula1datalake1802_bronze

-- COMMAND ----------

-- MAGIC %fs
-- MAGIC ls "abfss://bronze@formula1datalake1802.dfs.core.windows.net/"

-- COMMAND ----------

CREATE EXTERNAL LOCATION IF NOT EXISTS formula1datalake1802_silver URL
'abfss://silver@formula1datalake1802.dfs.core.windows.net/' WITH (
  STORAGE CREDENTIAL databricks_course_external_storage_credential
) COMMENT 'Default source for Azure exernal data';

-- COMMAND ----------

CREATE EXTERNAL LOCATION IF NOT EXISTS formula1datalake1802_gold URL
'abfss://gold@formula1datalake1802.dfs.core.windows.net/' WITH (
  STORAGE CREDENTIAL databricks_course_external_storage_credential
) COMMENT 'Default source for Azure exernal data';