CREATE TABLE model_dataset_tbl AS
SELECT
    a.*,
    COALESCE(b.total_bureau_loans, 0) AS total_bureau_loans,
    COALESCE(b.active_loans, 0) AS active_loans,
    COALESCE(b.max_overdue_days, 0) AS max_overdue_days,
    COALESCE(b.total_debt, 0) AS total_debt
FROM applications_raw a
LEFT JOIN bureau_agg_tbl b
ON a.SK_ID_CURR = b.SK_ID_CURR;

ALTER TABLE model_dataset_tbl
ADD PRIMARY KEY (SK_ID_CURR);