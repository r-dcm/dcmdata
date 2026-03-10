library(tidyverse)
library(here)

# format original data----------------------------------------------------------
library(glue)
devtools::load_all()

data_dir <- "/Volumes/aai_general/Projects/PIE Secure/dcmdata_package"

ft <- read_rds(glue("{data_dir}/pie_2024_FT_data_dcmdata.rds"))
pilot <- read_rds(glue("{data_dir}/pie_2025_Pilot_data_dcmdata.rds"))

ft <- ft |>
  select(student = id, pathway_level, task = externaltaskid, score) |>
  distinct() |>
  select(student, task, pathway_level, score) |>
  mutate(time = "ft", .before = pathway_level)
pilot <- pilot |>
  select(
    student = id,
    pathway_level,
    task = externaltaskid,
    time = assessment,
    score
  ) |>
  distinct() |>
  select(student, task, time, pathway_level, score)
pie <- bind_rows(ft, pilot)

## save csv for posterity -----
set.seed(121389)
students <- pie |>
  distinct(student) |>
  mutate(new_stu_id = generate_ids(n = n(), characters = 7))
tasks <- pie |>
  distinct(task) |>
  mutate(new_task_id = generate_ids(n = n(), characters = 5))

pie |>
  left_join(students, join_by(student), relationship = "many-to-one") |>
  left_join(tasks, join_by(task), relationship = "many-to-one") |>
  select(-c(student, task)) |>
  rename(student = new_stu_id, task = new_task_id) |>
  relocate(student, task, .before = 1) |>
  write_csv(here("data-raw", "data-files", "pie.csv"))

# create data-------------------------------------------------------------------
pie <- read_csv(here("data-raw", "data-files", "pie.csv")) |>
  mutate(
    time = factor(time, levels = c("ft", "baseline", "midway", "end_of_unit")),
    pathway_level = factor(pathway_level, levels = c("L1", "L2", "L3")),
  ) |>
  arrange(time, pathway_level, task)

ft <- pie |>
  filter(time == "ft") |>
  select(-time)
pilot <- pie |>
  filter(time != "ft")

## check item status -----
full_join(
  ft |>
    distinct(task, pathway_level) |>
    mutate(ft = TRUE),
  pilot |>
    distinct(task, time, pathway_level) |>
    mutate(pilot = TRUE),
  join_by(task, pathway_level)
) |>
  arrange(pathway_level, task) |>
  select(task, pathway_level, time, ft, pilot)

#' In FT, not pilot:
#'   * Held in reserve: 64967
#'   * Used for end-of-year component: 81175, 88063
#' In pilot, not FT. These are new item twins of FT items
#'   * 33008 (twin of 64967)
#'   * 96568 (twin of 56400)
#'   * 49531 (twin of 14415)
#'   * 38641 (twin of 06238)
#'   * 97673 (twin of 54596)
#' In addition, one item twin was included in the FT:
#'   * 10231 (twin of 97634)

pie_ft_data <- ft |>
  select(student, task, score) |>
  pivot_wider(names_from = task, values_from = score) |>
  mutate(across(-student, as.integer))
pie_ft_qmatrix <- ft |>
  distinct(task, pathway_level) |>
  mutate(
    pathway_level = factor(pathway_level, levels = c("L1", "L2", "L3")),
    measured = 1L
  ) |>
  pivot_wider(
    names_from = pathway_level,
    names_sort = TRUE,
    values_from = measured,
    values_fill = 0L
  )


pie_pilot_data <- pilot |>
  select(student, time, task, score) |>
  pivot_wider(names_from = task, values_from = score)
pie_pilot_qmatrix <- pilot |>
  distinct(task, pathway_level) |>
  mutate(measured = 1L) |>
  pivot_wider(
    names_from = pathway_level,
    names_sort = TRUE,
    values_from = measured,
    values_fill = 0L
  )

use_data(
  pie_ft_data,
  pie_ft_qmatrix,
  pie_pilot_data,
  pie_pilot_qmatrix,
  overwrite = TRUE
)
