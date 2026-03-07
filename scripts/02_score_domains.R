source(here::here("scripts", "00_config.R"))

df_clean <- readRDS(file.path(path_derived, "df_clean.rds"))

# Explicit item groups
cognitive_items <- c(
  "eat_less_on_weight_gain",
  "eat_less_at_mealtime",
  "refuse_food_weight_concern",
  "monitor_food",
  "eat_slimming_foods",
  "eat_less_after_overeating",
  "eat_less_to_prevent_weight_gain",
  "avoid_snacks_between_meals_for_weight_concern",
  "avoid_evening_eating_for_weight_concern",
  "consider_weight_when_eating"
)

affective_items <- c(
  "eat_when_unoccupied",
  "eat_when_irritated",
  "eat_when_depressed_or_discouraged",
  "eat_when_lonely",
  "eat_when_someone_let_you_down",
  "eat_when_angry",
  "eat_when_expecting_bad",
  "eat_when_anxious",
  "eat_when_things_go_wrong",
  "eat_when_frightened",
  "eat_when_disappointed",
  "eat_when_emotionally_upset",
  "eat_when_bored_or_restless"
)

salience_items <- c(
  "eat_more_if_food_tasty",
  "eat_more_if_food_smells_or_looks_good",
  "eat_when_see_delicious_food",
  "eat_delicious_food_immediately",
  "desire_to_buy_from_bakery",
  "desire_to_buy_from_snack_bar_or_cafe",
  "desire_to_eat_when_see_others_eating",
  "resist_delicious_food",
  "eat_more_when_see_others_eating",
  "eat_when_preparing_meal"
)

habit_items <- c(
  "eat_specific_foods_habitually",
  "location_triggers_habitual_eating",
  "automatic_eating_when_experiencing_strong_emotion",
  "realize_after_eating_out_of_habit"
)

body_image_items <- c(
  "days_desire_for_flat_stomach",
  "days_felt_fat",
  "days_weight_affected_self_judgment",
  "days_shape_affected_self_judgment",
  "days_dissatisfied_with_weight",
  "days_dissatisfied_with_shape",
  "days_uncomfortable_to_see_own_body",
  "days_uncomfortable_others_seeing_your_shape",
  "days_tried_limit_food_to_control_shape_or_weight",
  "days_fasted_to_control_shape_or_weight",
  "days_excluded_food_to_control_shape_or_weight",
  "days_followed_rules_to_control_shape_or_weight",
  "days_fear_losing_control_over_eating"
)

required_items <- c(
  cognitive_items,
  affective_items,
  salience_items,
  habit_items,
  body_image_items
)

stopifnot(all(required_items %in% names(df_clean)))

# Build domain scores
df_scored <- df_clean %>%
  mutate(
    score_cognitive_control = rowMeans(select(., all_of(cognitive_items)), na.rm = TRUE),
    score_affective         = rowMeans(select(., all_of(affective_items)), na.rm = TRUE),
    score_salience          = rowMeans(select(., all_of(salience_items)), na.rm = TRUE),
    score_habit             = rowMeans(select(., all_of(habit_items)), na.rm = TRUE),
    score_body_image        = rowMeans(select(., all_of(body_image_items)), na.rm = TRUE)
  )

# Reverse code body-image score
days_max <- max(unlist(df_clean[body_image_items]), na.rm = TRUE)

df_scored <- df_scored %>%
  mutate(score_body_image_rev = days_max - score_body_image)

# Final analysis score list
score_vars <- c(
  "score_cognitive_control",
  "score_affective",
  "score_salience",
  "score_habit",
  "score_body_image_rev"
)

stopifnot(all(score_vars %in% names(df_scored)))

# Modeling dataset
df_analysis <- df_scored %>%
  mutate(
    perception_eating_disorder = as.integer(as.character(perception_eating_disorder))
  )

stopifnot(all(na.omit(df_analysis$perception_eating_disorder) %in% c(0, 1)))

# Grouped dataset for plots and tests
df_grouped <- df_analysis %>%
  mutate(
    ed_group = factor(
      perception_eating_disorder,
      levels = c(0, 1),
      labels = c("No", "Yes")
    )
  )

# Save reusable objects
saveRDS(df_scored,    file = file.path(path_derived, "df_scored.rds"))
saveRDS(df_analysis,  file = file.path(path_derived, "df_analysis.rds"))
saveRDS(df_grouped,   file = file.path(path_derived, "df_grouped.rds"))
saveRDS(score_vars,   file = file.path(path_derived, "score_vars.rds"))

score_spec <- list(
  cognitive_items = cognitive_items,
  affective_items = affective_items,
  salience_items = salience_items,
  habit_items = habit_items,
  body_image_items = body_image_items,
  score_vars = score_vars
)

saveRDS(score_spec, file = file.path(path_derived, "score_spec.rds"))