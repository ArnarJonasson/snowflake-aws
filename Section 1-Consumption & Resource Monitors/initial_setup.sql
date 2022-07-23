--CREATE CUSTOM WH WITH ONE MINUTE SHUT-OFF
ALTER WAREHOUSE "TRANSFORM_WH" SET WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 120 AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 2 SCALING_POLICY = 'STANDARD' COMMENT = '';


use role sysadmin ; 

create database if not exists ecommerce_db;

create schema if not exists ecommerce_liv;

use schema ecommerce_db.ecommerce_liv;

use warehouse compute_wh;

create or replace table LINEITEM cluster by (L_SHIPDATE) as select * from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1000"."LINEITEM" limit 2000000;

create or replace table ORDERS as select * from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1000"."ORDERS" ;