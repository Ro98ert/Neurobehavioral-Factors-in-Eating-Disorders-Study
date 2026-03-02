#	Neurobehavioral Factors in Eating Disorders (NFED)

##	Overview

This repository contains an end-to-end case study analyzing neurobehavioral factors associated with **self-perceived eating disorder status** among **university students in Bangladesh (n = 550)**. The primary outcome is:

*	`perception_eating_disorder` (binary; `0 = No`, `1 = Yes`)

The analysis builds composite domain scores (e.g., emotional eating, cognitive restraint) and evaluates associations using bivariate testing and logistic regression, prioritizing **interpretability** and **out-of-sample performance**.

##	Case study framework

Work is organized using the standard case study roadmap phases (**Ask → Prepare → Process → Analyze → Share → Act**) and portfolio-ready deliverables. 

#	Business task (Ask)

**Goal:** Identify the primary neurobehavioral drivers most strongly associated with **self-perceived eating disorder status** in the sample, and assess whether a simple, interpretable model can predict ED perception well enough to support screening-oriented decision support (not diagnosis).

**Primary stakeholders:** University administration, student health services, mental health researchers.

**Success metrics:**

*	Association strength and statistical significance of neurobehavioral domains
*	Predictive discrimination on a holdout test set (AUC)
*	Threshold-based classification metrics (accuracy, sensitivity, specificity, precision)

#	Data (Prepare)

**Dataset:** Survey responses from 550 university students in Bangladesh.

**Data files**

*	Raw dataset (immutable): [data](https://github.com/Ro98ert/Neurobehavioral-Factors-in-Eating-Disorders-Study/blob/0bf18461e06e270f9ea86c7d9cad75b0cb28b535/data/raw/neurobehavioral_factors_in_eating_disorders_raw.csv)
*	Cleaned dataset (analysis-ready): [data](https://github.com/Ro98ert/Neurobehavioral-Factors-in-Eating-Disorders-Study/blob/0bf18461e06e270f9ea86c7d9cad75b0cb28b535/data/clean/neurobehavioral_factors_in_eating_disorders_clean.csv)

**Ethics / privacy**

*	Dataset should contain no personally identifiable information (PII). Validate before sharing or publishing.
*	Outcome is self-perceived ED status; results support association and screening-oriented prioritization only.

**ROCCC notes (high-level)**

*	**Reliable:** Self-report bias possible; sample size adequate for exploratory modeling.
*	**Original / Cited:** Source attribution should be recorded in [path]/data/README_data_source.md (or equivalent).
*	**Current:** Data collection period noted in the project narrative (Aug–Nov 2024).

#	Cleaning and feature construction (Process)

**Tools**

*	Excel / Google Sheets for initial recoding and integrity checks
*	R for reproducible scoring, modeling, validation, and reporting

**Key processing steps**

1.	Standardize column names (`janitor::clean_names()`).
2.	Convert categorical survey responses to numeric codes (frequency-scale items).
3.	Build composite domain scores using row-wise means:

*	`score_cognitive_control`
*	`score_affective`
*	`score_salience`
*	`score_habit`
*	`score_body_image`

4.	Reverse-code body-image composite to enforce consistent interpretation (higher = worse distress):

*	`score_body_image_rev`

#	Analysis and modeling (Analyze)

**Core question:** Which neurobehavioral domains are most strongly associated with ED perception, and how well can a simple model predict ED perception?

**Analytic sequence**

1.	Outcome distribution validation (`0/1`)
2.	Distribution checks for composite scores (histograms, summaries)
3.	Group comparisons (t-tests): ED=0 vs ED=1
4.	Logistic regression (multivariable), simplified for interpretability
5.	Train/test validation with stratified split
6.	ROC/AUC and threshold-based classification metrics
7.	Risk summaries (quartiles) for stakeholder interpretability

**Final interpretable model (logistic regression)**

Predictors:

*	`score_affective` (emotional eating)
*	`score_cognitive_control` (restriction/control)
*	`score_body_image_rev` (body image distress; higher = worse)

#	Communication artifacts (Share)

Stakeholder-facing outputs include:

*	Outcome distribution table
*	Domain score comparisons (boxplots)
*	Odds ratio table and OR plot
*	ROC curve + AUC
*	Confusion matrix and metrics at threshold 0.50
*	Risk gradient visualization (quartiles)

Report source:

*	R Markdown report: [path]/reports/NFED_case_study.Rmd

Rendered outputs:

*	PDF report: [path]/reports/NFED_case_study.pdf
*	HTML report: [path]/reports/NFED_case_study.html

Figures directory:

*	[path]/figures/

Tables directory:

*	[path]/tables/

#	Recommendations (Act)

Evidence-supported program directions based on model results:

1.	Target emotional eating / affect regulation (highest association signal)
2.	Address restrictive eating and dieting cycles
3.	Offer body image support programming
4.	Treat model outputs as screening-oriented decision support, not diagnosis
5.	Validate externally (new cohort / new university) before operational use

##	Limitations

*	Cross-sectional survey: association ≠ causation
*	Self-report bias likely
*	Single-university sample limits generalizability
*	Screening support only; not a diagnostic instrument

##	Author

*	**Name:** Amartisoaei Robert
*	**Contact / portfolio: [path] (e.g., LinkedIn URL or portfolio site)
