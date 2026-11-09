# Neurobehavioral Factors in Eating Disorders (NFED)

## Project Summary

This project analyzes neurobehavioral factors associated with self-perceived eating disorder (ED) status among 550 university students in Bangladesh. It builds composite domain scores (emotional eating, cognitive restraint, body image distress) and tests whether an interpretable logistic regression model can support screening-oriented decision support.

## Business Question

Which neurobehavioral domains are most strongly associated with self-perceived ED status, and how well can a simple, interpretable model predict it?

**Primary stakeholders:** University administration, student health services, mental health researchers.

**Success metrics:** association strength/significance of neurobehavioral domains, predictive discrimination on a holdout test set (AUC), threshold-based classification metrics (accuracy, sensitivity, specificity, precision).

## Tools Used

- Excel / Google Sheets: initial recoding and integrity checks
- R (Tidyverse, janitor): scoring, modeling, validation, and reporting

## Workflow

This project follows the standard case study roadmap (**Ask → Prepare → Process → Analyze → Share → Act**):

- **Ask:** define the outcome (`perception_eating_disorder`) and success metrics
- **Prepare:** source and validate 550 survey responses; dataset should contain no PII
- **Process:** standardize columns, recode categorical items, build composite domain scores (`score_cognitive_control`, `score_affective`, `score_salience`, `score_habit`, `score_body_image_rev`)
- **Analyze:** bivariate group comparisons, multivariable logistic regression, stratified train/test split, ROC/AUC, risk quartiles
- **Share:** stakeholder-facing tables and figures (odds ratio plot, ROC curve, confusion matrix, risk gradient)
- **Act:** translate model findings into program recommendations

## Repository Contents

### 1. Data

**Location:** [`data/`](./data/)

- [`raw/neurobehavioral_factors_in_eating_disorders_raw.csv`](./data/raw/neurobehavioral_factors_in_eating_disorders_raw.csv): raw survey data, kept unchanged
- [`clean/neurobehavioral_factors_in_eating_disorders_clean.csv`](./data/clean/neurobehavioral_factors_in_eating_disorders_clean.csv): analysis-ready dataset

### 2. R Scripts

**Location:** [`scripts/`](./scripts/)

The pipeline is planned as numbered stages. Right now only stages 00 to 02 contain code. Scripts 03 to 08 and [`run_all.R`](./scripts/run_all.R) are empty placeholders, so the repository cannot yet reproduce the model end to end. The model results, tables and figures below come from the analysis written up in the [PDF report](./reports/Neurobehavioral_Factors_in_E._D._Markdown.pdf).

- [`00_config.R`](./scripts/00_config.R)
- [`01_import_and_clean.R`](./scripts/01_import_and_clean.R)
- [`02_score_domains.R`](./scripts/02_score_domains.R)
- [`03_eda_and_bivariate_tests.R`](./scripts/03_eda_and_bivariate_tests.R) (placeholder, empty)
- [`04_model_training_and_validation.R`](./scripts/04_model_training_and_validation.R) (placeholder, empty)
- [`05_risk_summary_and_thresholds.R`](./scripts/05_risk_summary_and_thresholds.R) (placeholder, empty)
- [`06_export_tables_and_figures.R`](./scripts/06_export_tables_and_figures.R) (placeholder, empty)
- [`07_save_models_and_results.R`](./scripts/07_save_models_and_results.R) (placeholder, empty)
- [`08_render_report.R`](./scripts/08_render_report.R) (placeholder, empty)

### 3. Models

**Location:** [`models/`](./models/)

- [`final_logistic_model.rds`](./models/final_logistic_model.rds)
- [`final_model_roc.rds`](./models/final_model_roc.rds)
- [`results_summary.rds`](./models/results_summary.rds)

### 4. Tables

**Location:** [`tables/`](./tables/)

- [`descriptive_scores.csv`](./tables/descriptive_scores.csv)
- [`final_model_odds_ratios.csv`](./tables/final_model_odds_ratios.csv)
- [`final_model_test_metrics.csv`](./tables/final_model_test_metrics.csv)
- [`risk_by_quartile.csv`](./tables/risk_by_quartile.csv)

### 5. Figures

**Location:** [`figures/`](./figures/)

- [`distribution_of_composite_domain_scores.png`](./figures/distribution_of_composite_domain_scores.png)
- [`domain_scores_by_ed_perception_group.png`](./figures/domain_scores_by_ed_perception_group.png)
- [`odds_ratio_plot.png`](./figures/odds_ratio_plot.png)
- [`predicted_ed_risk_by_emotional_eating_quartile.png`](./figures/predicted_ed_risk_by_emotional_eating_quartile.png)
- [`roc_curve_final.png`](./figures/roc_curve_final.png)
- [`roc_curve_test.png`](./figures/roc_curve_test.png)

### 6. Reports

**Location:** [`reports/`](./reports/)

- [`Neurobehavioral_Factors_in_E._D._Markdown.pdf`](./reports/Neurobehavioral_Factors_in_E._D._Markdown.pdf)

## Key Findings

- Emotional eating (`score_affective`) shows the strongest association with ED perception
- Cognitive restraint and body image distress are also significant predictors
- Final logistic model on the holdout test set: 76.5% accuracy, 78.7% sensitivity, 74.0% specificity, 77.8% precision at threshold 0.50
- For comparison, 296 of the 550 students (53.8%) report ED perception, so always predicting the larger class would score about 54% accuracy. This baseline is computed from the clean dataset, not from the test split, and the test-set metrics imply a similar share (about 54%).
- Predicted risk increases consistently across emotional-eating quartiles

Recommended program directions based on model results:

1. Target emotional eating / affect regulation (highest association signal)
2. Address restrictive eating and dieting cycles
3. Offer body image support programming
4. Treat model outputs as screening-oriented decision support, not diagnosis
5. Validate externally (new cohort / new university) before operational use

## Data Source

Dataset: [Neurobehavioral Factors in Eating Disorders Study (Kaggle)](https://www.kaggle.com/datasets/jocelyndumlao/neurobehavioral-factors-in-eating-disorders-study)

Survey responses from 550 university students in Bangladesh, collected August to November 2024. Dataset should contain no personally identifiable information (PII); validated before publishing.

## Limitations

- Cross-sectional survey: association ≠ causation
- Self-report bias likely
- Single-university sample limits generalizability
- Screening support only; not a diagnostic instrument

## Notes

AI tools were used selectively for brainstorming, editing, and improving documentation clarity. All analysis logic, R workflows, interpretation, and final conclusions were reviewed and validated by me.
