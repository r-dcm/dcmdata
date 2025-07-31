#' MacReady & Dayton multiplication data (MDM)
#'
#' This is a small data set of multiplication item responses. This data contains
#' responses to 4 items from 142 respondents, which ask respondents to complete
#' an integer multiplication problem.
#'
#' @format `mdm_data` is a [tibble][tibble::tibble-package] containing responses
#' to multiplication items, as described in MacReady and Dayton (1977). There
#' are 142 rows and 5 variables.
#' * `respondent`: Respondent identifier.
#' * `mdm1`-`mdm4`: Dichotomous item responses to the 4 multiplication items.
#'
#' @concept Dayton
#'
#' @references MacReady, G. B., & Dayton, C. M. (1977). The use of probabilistic
#'   models in the assessment of mastery. *Journal of Educational Statistics,
#'   2*(2), 99-120. \doi{10.2307/1164802}
#' @rdname mdm
#' @aliases mdm
"mdm_data"

#' @format `mdm_qmatrix` is a [tibble][tibble::tibble-package] that identifies
#' which skills are measured by each MDM item. This MDM data contains 4 items,
#' all of which measure the skill of multiplication. The `mdm_qmatrix`
#' correspondingly is made up of 4 rows and 2 variables.
#' * `item`: Item identifier, corresponds to `mdm1`-`mdm4` in `mdm_data`.
#' * `multiplication`: Dichotomous indicator for whether or not the
#'   multiplication skill is measured by each item. A value of `1` indicates the
#'   skill is measured by the item and a value of `0` indicates the skill is not
#'   measured by the item.
#' @rdname mdm
"mdm_qmatrix"
