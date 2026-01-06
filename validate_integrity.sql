/* VALIDATION SCRIPT
   Run Part A on MySQL (Source)
   Run Part B on PostgreSQL (Destination)
   Compare the results.
*/

-- ==========================================
-- PART A: RUN ON MYSQL (SOURCE)
-- ==========================================

-- 1. Check Total Row Counts per Table
SELECT table_name, table_rows 
FROM information_schema.tables 
WHERE table_schema = 'your_source_db_name';

-- 2. Check Sum of IDs (To ensure no ID shift)
-- Replace 'users' and 'id' with your actual table/primary key
SELECT 'users' AS table_name, SUM(id) AS id_checksum FROM users;


-- ==========================================
-- PART B: RUN ON POSTGRESQL (DESTINATION)
-- ==========================================

-- 1. Check Total Row Counts per Table
SELECT relname AS table_name, n_live_tup AS table_rows 
FROM pg_stat_user_tables;

-- 2. Check Sum of IDs
SELECT 'users' AS table_name, SUM(id) AS id_checksum FROM users;

/* PASS CRITERIA:
   1. The 'table_rows' must match exactly for all tables.
   2. The 'id_checksum' must be identical.
*/
