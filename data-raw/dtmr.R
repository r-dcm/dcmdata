library(tidyverse)
library(readxl)
library(here)
library(modelr)
library(janitor)

devtools::load_all()

dtmr_item <- read_xlsx(here("data-raw", "data-files", "dtmr.xlsx"),
                       sheet = "item-params")
dtmr_strc <- read_xlsx(here("data-raw", "data-files", "dtmr.xlsx"),
                       sheet = "strc-params")
dtmr_qmat <- read_xlsx(here("data-raw", "data-files", "dtmr.xlsx"),
                       sheet = "q-matrix")

set.seed(121389)

# Simulate data ----------------------------------------------------------------
true_profiles <- dtmr_strc |>
  slice_sample(n = 990, replace = TRUE, weight_by = prob) |>
  select(-prob) |>
  mutate(id = generate_ids(n = n(), characters = 6),
         .before = 1)

item_params <- dtmr_qmat |>
  select(-item) |>
  model_matrix(~ ru * pi + app + mc) |>
  clean_names() |>
  mutate(item = dtmr_qmat$item, .before = 1) |>
  pivot_longer(cols = -item, names_to = "parameter", values_to = "needed") |>
  filter(needed == 1) |>
  left_join(dtmr_item |>
              pivot_longer(cols = -item, names_to = "parameter"),
            by = join_by(item, parameter),
            relationship = "one-to-one") |>
  mutate(value = replace_na(value, 0))

dtmr_data <- crossing(id = true_profiles$id, item = unique(item_params$item)) |>
  left_join(true_profiles, by = join_by(id), relationship = "many-to-one") |>
  mutate(intercept = 1, .before = ru) |>
  mutate(ru_pi = ru * pi) |>
  pivot_longer(cols = -c(id, item),
               names_to = "parameter", values_to = "available") |>
  left_join(item_params, by = join_by(item, parameter),
            relationship = "many-to-one") |>
  filter(!is.na(needed)) |>
  mutate(final_value = value * available) |>
  summarize(log_odds = sum(final_value), .by = c(id, item)) |>
  mutate(prob = map_dbl(log_odds, inv_logit),
         rand = runif(n = n()),
         score = as.integer(rand < prob)) |>
  select(id, item, score) |>
  pivot_wider(names_from = item, values_from = score) |>
  select(id, all_of(dtmr_item$item))

dtmr_qmatrix <- dtmr_qmat |>
  rename(referent_units = ru,
         partitioning_iterating = pi,
         appropriateness = app,
         multiplicative_comparision = mc)

# True values ------------------------------------------------------------------
dtmr_true_items <- dtmr_item |>
  rename(referent_units = ru,
         partitioning_iterating = pi,
         appropriateness = app,
         multiplicative_comparision = mc,
         referent_units__partitioning_iterating = ru_pi)

dtmr_true_structural <- dtmr_strc |>
  rename(referent_units = ru,
         partitioning_iterating = pi,
         appropriateness = app,
         multiplicative_comparision = mc,
         class_probability = prob)

dtmr_true_profiles <- true_profiles |>
  rename(referent_units = ru,
         partitioning_iterating = pi,
         appropriateness = app,
         multiplicative_comparision = mc)

use_data(dtmr_data, dtmr_qmatrix,
         dtmr_true_items, dtmr_true_structural, dtmr_true_profiles,
         overwrite = TRUE)
