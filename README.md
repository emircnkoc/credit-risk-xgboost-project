# credit-risk-xgboost-project
End-to-end credit risk modeling with SQL feature engineering and XGBoost
# Credit Risk Modeling with XGBoost

This project implements an end-to-end credit risk scoring system using:

- SQL for data aggregation and feature engineering
- XGBoost for probability of default (PD) prediction
- Threshold optimization for credit approval decisions
- Risk segmentation (LOW / MEDIUM / HIGH)

## Workflow

1. Raw application and bureau data processed in SQL
2. Feature engineering with financial ratios and risk flags
3. XGBoost model training in Python
4. Class imbalance handling
5. Cut-off optimization
6. Risk band segmentation

## Key Features

- Debt-to-income ratios
- Payment burden metrics
- Credit bureau aggregation
- Overdue risk flags

## Model Performance

- ROC-AUC ~ 0.70
- Clear risk separation across segments

## Tools

- MySQL
- Python (pandas, scikit-learn, xgboost)
## Results

Key outputs are available in the results/ folder:

- feature_importance.csv : XGBoost feature importance
- threshold_analysis.csv : Cut-off vs approval and recall tradeoff
- risk_band_summary.csv : Default rates by risk segment

