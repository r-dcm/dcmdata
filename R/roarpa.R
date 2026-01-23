#' Rapid online assessment of reading and phonological awareness (ROAR-PA)
#'
#' The ROAR-PA is an online assessment of phonological awareness, which is a
#' target for early intervention in order to improve reading development.
#' The ROAR-PA was developed, and data collected by, Gijbels et al. (2024), who
#' identified a 3-factor structure that both represents specific skills within
#' phonological awareness and is predictive of future reading development.
#' The data set was uploaded to the Item Response Warehouse
#' (Domingue et al., 2025) and is reformatted here.
#'
#' @details
#' The ROAR-PA assessment consists of 5 subtests, three of which are included
#' in this data set:
#'
#' * `fsm`: First sound matching
#' * `lsm`: Last sound matching
#' * `del`: Deletion
#'
#' @format `roarpa_data` is a [tibble][tibble::tibble-package] containing
#' response data with 272 rows and 58 variables:
#' * `id`: Respondent identifier.
#' * `del_10`-`lsm_05`: Dichotomous item responses to the 57 ROAR-PA items.
#'
#' @references Domingue, B., Braginsky, M., Caffrey-Maffei, L., Gilbert, J. B.,
#'   Kanopka, K., Kapoor, R., Lee, H., Liu, Y., Nadela, S., Pan, G., Zhang, L.,
#'   Zhang, S., & Frank, M. C. (2025). An introduction to the Item Response
#'   Warehouse (IRW): A resource for enhancing data usage in psychometrics.
#'   *Behavior Research Methods, 57*, Article 276.
#'   \doi{10.3758/s13428-025-02796-y}
#' @references Gijbels, L., Burkhardt, A., Ma, W. A., & Yeatman, J. D. (2024).
#'   Rapid online assessment of reading and phonological awareness (ROAR-PA).
#'   *Scientific Reports, 14*, Article 10249. \doi{10.1038/s41598-024-60834-9}
#' @rdname roarpa
#' @aliases roarpa
"roarpa_data"

#' @format `roarpa_qmatrix` is a [tibble][tibble::tibble-package] that
#' identifies which ROAR-PA subtest is measured by each item. This data set
#' contains 57 items measuring 3 attributes. The `roarpa_qmatrix` therefore has
#' 57 rows and 4 variables:
#' * `item`: Item identifier, corresponds to item response columns in
#'   `roarpa_data`.
#' * Attribute columns: 3 columns, one for each attribute. Each is a dichotomous
#'   indicator for whether or not the attribute is measured by each item. A
#'   values of `1` indicates the attribute is measured by the item and a value
#'   of `0` indicates the attribute is not measured by the item.
#' @rdname roarpa
"roarpa_qmatrix"
