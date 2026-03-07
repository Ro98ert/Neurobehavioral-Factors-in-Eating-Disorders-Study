source(here::here("scripts", "00_config.R"))

stopifnot(file.exists(path_data_clean))

df_clean <- readr::read_csv(path_data_clean, show_col_types = FALSE) %>%
  janitor::clean_names()

# Optional type standardization for key demographic variables if present
factor_vars <- c(
  "gender",
  "employment_status",
  "marital_status",
  "age_range",
  "education",
  "division"
)

existing_factor_vars <- intersect(factor_vars, names(df_clean))

if (length(existing_factor_vars) > 0) {
  df_clean <- df_clean %>%
    mutate(across(all_of(existing_factor_vars), as.factor))
}

# Standardize outcome if present
if ("perception_eating_disorder" %in% names(df_clean)) {
  df_clean <- df_clean %>%
    mutate(
      perception_eating_disorder = as.integer(as.character(perception_eating_disorder))
    )
}

# Basic validation
stopifnot("perception_eating_disorder" %in% names(df_clean))
stopifnot(all(na.omit(df_clean$perception_eating_disorder) %in% c(0, 1)))

saveRDS(df_clean, file = file.path(path_derived, "df_clean.rds"))