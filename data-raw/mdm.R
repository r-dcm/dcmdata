library(tidyverse)
library(here)
library(glue)

devtools::load_all()
set.seed(121389)

mdm_data <- read_csv(here("data-raw", "data-files", "mdm-data.csv"),
                     col_types = cols(.default =  col_integer()),
                     col_names = FALSE) |>
  rename(mdm1 = X1, mdm2 = X2, mdm3 = X3, mdm4 = X4) |>
  mutate(respondent = generate_ids(n(), characters = 5, prop_numeric = 0.2),
         .before = 1)

mdm_qmatrix <- tibble(item = paste0("mdm", 1:4),
                      multiplication = 1L)

use_data(mdm_data, mdm_qmatrix, overwrite = TRUE)
