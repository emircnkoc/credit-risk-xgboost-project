CREATE TABLE model_features_tbl AS
SELECT
    SK_ID_CURR,
    TARGET,

    -- Age (yıl)
    (-DAYS_BIRTH) / 365.25 AS age,

    AMT_INCOME_TOTAL,
    AMT_CREDIT,
    AMT_ANNUITY,
    AMT_GOODS_PRICE,

    -- Oranlar
    CASE WHEN AMT_INCOME_TOTAL > 0 THEN AMT_CREDIT / AMT_INCOME_TOTAL END AS credit_to_income,
    CASE WHEN AMT_INCOME_TOTAL > 0 THEN AMT_ANNUITY / AMT_INCOME_TOTAL END AS annuity_to_income,
    CASE WHEN AMT_CREDIT > 0 THEN AMT_ANNUITY / AMT_CREDIT END AS annuity_to_credit,

    -- Bureau özetleri
    total_bureau_loans,
    active_loans,
    max_overdue_days,
    total_debt,

    CASE WHEN AMT_INCOME_TOTAL > 0 THEN total_debt / AMT_INCOME_TOTAL END AS debt_to_income,

    -- Policy flag'ler
    CASE WHEN max_overdue_days >= 30 THEN 1 ELSE 0 END AS flag_dpd30,
    CASE WHEN max_overdue_days >= 60 THEN 1 ELSE 0 END AS flag_dpd60,
    CASE WHEN max_overdue_days >= 90 THEN 1 ELSE 0 END AS flag_dpd90,

    -- Basit stabilizasyon (çok faydalı)
    CASE WHEN AMT_ANNUITY IS NULL OR AMT_ANNUITY = 0 THEN 1 ELSE 0 END AS flag_missing_annuity,
    CASE WHEN AMT_INCOME_TOTAL IS NULL OR AMT_INCOME_TOTAL = 0 THEN 1 ELSE 0 END AS flag_missing_income

FROM model_dataset_tbl;