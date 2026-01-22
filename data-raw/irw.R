library(tidyverse)

# to install: install_github("itemresponsewarehouse/Rpkg")
library(irw)

irw_filter(n_categories = 2, var = "Qmatrix_")

# data sets:
# cdm_timss03, cdm_timss07
# frac20, mcmi_mokken, roar_gijbels2024

# TIMSS 03 ---------------------------------------------------------------------
timss03 <- irw_fetch("cdm_timss03")

timss03_data <- timss03 |>
  select(item, id, resp) |>
  pivot_wider(names_from = item, values_from = resp)

timss03_qmatrix <- timss03 |>
  select(item, starts_with("Qmatrix_")) |>
  distinct() |>
  rename_with(\(x) str_replace_all(x, "Qmatrix__", "")) |>
  rename(
    understand_ratio = S1,
    use_ratio = S2,
    compute_fluently = S3,
    rational_numbers = S4,
    algebraic_expressions = S5,
    one_variable_equations = S6,
    recognize_proportional_relationships = S7,
    use_proportional_relationships = S8,
    asmd_rational_numbers = S9,
    expressions_equations = S11,
    compare_fractions = S13,
    multistep_problems = S14,
    equivalent_fractions = S15
  )

use_data(timss03_data, timss03_qmatrix, overwrite = TRUE)

# TIMSS 07 ---------------------------------------------------------------------
timss07 <- irw_fetch("cdm_timss07")

timss07_data <- timss07 |>
  select(item, id, resp) |>
  pivot_wider(names_from = item, values_from = resp)

timss07_skill_qmatrix <- timss07 |>
  select(item, starts_with("Qmatrix__")) |>
  distinct() |>
  rename_with(\(x) str_replace_all(x, "Qmatrix__", "")) |>
  rename(
    n_wn_represent = NWN01,
    n_wn_compute = NWN02,
    n_wn_solve = NWN03,
    n_wn_proportions = NWN04,
    n_fd_parts = NFD05,
    n_fd_solve = NFD06,
    n_ns_model = NNS07,
    n_pr_describe = NPR08,
    gm_la_properties = GLA09,
    gm_tt_figures = GTT10,
    gm_tt_calculate = GTT11,
    gm_lm_locate = GLM12,
    dd_ri_read = DRI13,
    dd_ri_information = DRI14,
    dd_or_data = DOR15
  )

timss07_topic_qmatrix <- timss07_skill_qmatrix |>
  pivot_longer(cols = -item, names_to = "skill", values_to = "measured") |>
  separate_wider_delim(
    cols = skill,
    delim = "_",
    names = c("domain", "topic", "skill")
  ) |>
  mutate(
    topic = case_when(
      domain == "n" & topic == "ns" ~ "nspr",
      domain == "n" & topic == "pr" ~ "nspr",
      domain == "dd" & topic == "ri" ~ "rior",
      domain == "dd" & topic == "or" ~ "rior",
      .default = topic
    )
  ) |>
  summarize(measured = max(measured), .by = c(item, domain, topic)) |>
  pivot_wider(
    names_from = c(domain, topic),
    values_from = measured,
    names_sep = "_"
  )

timss07_domain_qmatrix <- timss07_topic_qmatrix |>
  pivot_longer(cols = -item, names_to = "topic", values_to = "measured") |>
  separate_wider_delim(
    cols = topic,
    delim = "_",
    names = c("domain", "topic")
  ) |>
  summarize(measured = max(measured), .by = c(item, domain)) |>
  pivot_wider(names_from = domain, values_from = measured)

use_data(
  timss07_data,
  timss07_skill_qmatrix,
  timss07_topic_qmatrix,
  timss07_domain_qmatrix,
  overwrite = TRUE
)

# Fraction Subtraction ---------------------------------------------------------
frac20 <- irw_fetch("frac20")

fraction_data <- frac20 |>
  select(item, id, resp) |>
  pivot_wider(names_from = item, values_from = resp)

fraction_qmatrix <- frac20 |>
  select(item, starts_with("Qmatrix_")) |>
  distinct() |>
  rename_with(\(x) str_replace_all(x, "Qmatrix__", "")) |>
  rename(
    convert = `1`,
    separate = `2`,
    simplify = `3`,
    common = `4`,
    borrow_whole = `5`,
    borrow_numerator = `6`,
    subtract = `7`,
    reduce = `8`,
  )

use_data(fraction_data, fraction_qmatrix, overwrite = TRUE)

# MCMI -------------------------------------------------------------------------
mcmi_mokken <- irw_fetch("mcmi_mokken")

mcmi_data <- mcmi_mokken |>
  select(item, id, resp) |>
  pivot_wider(names_from = item, values_from = resp)

mcmi_qmatrix <- mcmi_mokken |>
  select(item, starts_with("Qmatrix_")) |>
  distinct() |>
  rename_with(\(x) str_replace_all(x, "Qmatrix__", "")) |>
  rename(
    anxiety = A,
    somatoform = H,
    thought_disorder = SS,
    major_depression = CC
  )

use_data(mcmi_data, mcmi_qmatrix, overwrite = TRUE)

# ROAR -------------------------------------------------------------------------
roar_pa <- irw_fetch("roar_gijbels2024")

roarpa_data <- roar_pa |>
  select(item, id, resp) |>
  separate_wider_delim(cols = item, delim = "_", names = c("subtest", "num")) |>
  mutate(
    subtest = str_to_lower(subtest),
    num = str_pad(num, width = 2, pad = "0"),
    subtest = factor(subtest, levels = c("fsm", "lsm", "del"))
  ) |>
  arrange(subtest, num) |>
  unite(col = "item", subtest, num, sep = "_") |>
  pivot_wider(names_from = item, values_from = resp)

roarpa_qmatrix <- roar_pa |>
  select(item, starts_with("Qmatrix_")) |>
  distinct() |>
  separate_wider_delim(cols = item, delim = "_", names = c("subtest", "num")) |>
  mutate(
    subtest = str_to_lower(subtest),
    num = str_pad(num, width = 2, pad = "0"),
    subtest = factor(subtest, levels = c("fsm", "lsm", "del"))
  ) |>
  arrange(subtest, num) |>
  unite(col = "item", subtest, num, sep = "_") |>
  rename_with(\(x) str_replace_all(x, "Qmatrix_", "")) |>
  rename(
    lsm = skill1,
    del = skill2,
    fsm = skill3
  )

use_data(roarpa_data, roarpa_qmatrix, overwrite = TRUE)
