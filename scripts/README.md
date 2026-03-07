# Scripts overview

## Execution order
1. 00_config.R
2. 01_import_and_clean.R
3. 02_score_domains.R
4. 03_eda_and_bivariate_tests.R
5. 04_model_training_and_validation.R
6. 05_risk_summary_and_thresholds.R
7. 06_export_tables_and_figures.R
8. 07_save_models_and_results.R
9. 08_render_report.R

## Purpose
These scripts split the project into reproducible stages:
- configuration
- data import
- domain scoring
- exploratory analysis
- model training and validation
- export of results
- report rendering

## Path convention
All scripts use project-relative paths through `here::here()`.