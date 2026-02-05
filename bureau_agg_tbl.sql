CREATE TABLE bureau_agg_tbl AS
SELECT
    SK_ID_CURR,
    COUNT(*) AS total_bureau_loans,
    SUM(CASE WHEN CREDIT_ACTIVE = 'Active' THEN 1 ELSE 0 END) AS active_loans,
    MAX(CREDIT_DAY_OVERDUE) AS max_overdue_days,
    SUM(COALESCE(AMT_CREDIT_SUM_DEBT, 0)) AS total_debt
FROM bureau_raw
GROUP BY SK_ID_CURR;
ALTER TABLE bureau_agg_tbl
ADD PRIMARY KEY (SK_ID_CURR);