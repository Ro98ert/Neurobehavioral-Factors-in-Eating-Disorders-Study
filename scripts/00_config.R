library(here)
library(tidyverse)
library(janitor)
library(knitr)
library(kableExtra)
library(rsample)
library(broom)
library(pROC)
library(yardstick)

set.seed(123)

# Canonical paths
path_data_raw   <- here::here("data", "raw", "neurobehavioral_factors_in_eating_disorders_raw.csv")
path_data_clean <- here::here("data", "clean", "neurobehavioral_factors_in_eating_disorders_clean.csv")

path_tables  <- here::here("tables")
path_figures <- here::here("figures")
path_models  <- here::here("models")
path_reports <- here::here("reports")

# Optional: create output folders if missing
dir.create(path_tables,  showWarnings = FALSE, recursive = TRUE)
dir.create(path_figures, showWarnings = FALSE, recursive = TRUE)
dir.create(path_models,  showWarnings = FALSE, recursive = TRUE)
dir.create(path_reports, showWarnings = FALSE, recursive = TRUE)

# Common score labels
score_labels <- c(
  score_cognitive_control = "Cognitive Control",
  score_affective = "Affective / Emotional Eating",
  score_salience = "Salience / Food Cue Responsiveness",
  score_habit = "Habit / Automatic Eating",
  score_body_image_rev = "Body Image Distress"
)

path_derived <- here::here("data", "derived")
dir.create(path_derived, showWarnings = FALSE, recursive = TRUE)