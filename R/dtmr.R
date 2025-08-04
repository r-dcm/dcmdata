#' Diagnosing teachers' multiplicative reasoning (DTMR)
#'
#' This is a simulated data set modeled after the DTMR study described by
#' Bradshaw et al. (2014) and Izsák et al. (2019). The data was simulated from
#' the loglinear cognitive diagnostic model (LCDM), which is the model that was
#' used to analyze the data in the referenced articles. The data set consists of
#' 990 responses to the 27 items included in the final version of the DTMR data,
#' matching the sample that was collected by the original authors. Each
#' respondent was randomly assigned a mastery profile using the profile
#' proportions reported in Figure 10 of Izsák et al. (2019). Item responses were
#' then generated for each respondent using their assigned mastery profile and
#' the item parameters reported in Table 1 of Bradshaw et al. (2014).
#' Reproducible code for generating the simulated data is available in the
#' [GitHub repository](https://github.com/r-dcm/dcmdata) for this package.
#'
#' @details
#' The skills correspond to knowledge of:
#' 1. Referent units
#' 2. Partitioning and iterating
#' 3. Appropriateness
#' 4. Multiplicative comparisons
#'
#' @format `dtmr_data` is a [tibble][tibble::tibble-package] containing
#' simulated DTMR response data with 990 rows and 28 variables.
#' * `id`: Respondent identifier.
#' * `1`-`22`: Simulated dichotomous item responses to the 27 DTMR items.
#'
#' @references Bradshaw, L., Izsák, A., Templin, J., & Jacobson, E. (2014).
#'   Diagnosing teachers' understandings of rational numbers: Building a
#'   multidimensional test within the diagnostic classification framework.
#'   *Educational Measurement: Issues and Practice, 33*(1), 2-14.
#'   \doi{10.1111/emip.12020}
#' @references Izsák, A., Jacobson, E., & Bradshaw, L. (2019). Surveying
#'   middle-grades teachers' reasoning about fraction arithmetic in terms of
#'   measured quantities. *Journal for Research in Mathematics Education,
#'   50*(2), 156-209. \doi{10.5951/jresematheduc.50.2.0156}
#' @rdname dtmr
#' @aliases dtmr
"dtmr_data"

#' @format `dtmr_qmatrix` is a [tibble][tibble::tibble-package] that identifies
#' which skills are measured by each DTMR item, as reported in Bradshaw et al.
#' (2014). The DTMR assessment contains 27 items measuring 4 skills.
#' The `dtmr_qmatrix` correspondingly is made up of `r nrow(dtmr_qmatrix)` rows
#' and `r ncol(dtmr_qmatrix)` variables.
#' * `item`: Item identifier, corresponds to `1`-`22` in `dtmr_data`.
#' * `referent_units`, `partitioning_iterating`, `appropriateness`, and
#'   `multiplicative_comparison`: Dichotomous indicator for whether or not the
#'   skill is measured by each item. A value of `1` indicates the skill is
#'   measured by the item and a value of `0` indicates the skill is not measured
#'   by the item.
#' @rdname dtmr
"dtmr_qmatrix"

#' @format
#' ## Simulation values
#'
#' In addition to the simulated data sets, the true values used to simulate the
#' data are included for reference. This may be useful if, for example, you want
#' to estimate a model and then check how well the estimated parameters match
#' values that were used to create the data.
#'
#' To simulate the data, we first need `dtmr_true_structural`. This is a
#' [tibble][tibble::tibble-package] that contains the structural parameters
#' reported in Figure 10 of Izsák et al. (2019). The structural parameters
#' define the probability of observing each possible profile in the population
#' of respondents. Each row represents one possible mastery profile. Therefore,
#' there are `r nrow(dtmr_true_structural)` rows and
#' `r ncol(dtmr_true_structural)` variables.
#' * `referent_units`, `partitioning_iterating`, `appropriateness`,
#'   `multiplicative_comparison`: Integer values indicating whether each
#'   attribute has been mastered by respondents with the given profile.
#' * `class_probability`: The proportion of respondents estimated to demonstrate
#'   the given pattern of mastery.
#' @rdname dtmr
"dtmr_true_structural"

#' @format
#' Using the `dtmr_true_structural` values, we randomly sampled a mastery
#' profile for each of the 990 respondents. The true profiles for each
#' respondent are available in `dtmr_true_profiles`. There are a total of
#' `r nrow(dtmr_true_profiles)` rows and `r ncol(dtmr_true_profiles)` variables.
#' * `id`: Respondent identifier, corresponds to `id` in `dtmr_data`.
#' * `referent_units`, `partitioning_iterating`, `appropriateness`,
#'   `multiplicative_comparison`: Integer values indicating whether each
#'   attribute has been mastered by the respondent.
#' @rdname dtmr
"dtmr_true_profiles"

#' @format
#' We use the `dtmr_true_profiles` and the `dtmr_qmatrix` to identify whether
#' each respondent possess the attributes required by each item. Based on which
#' attributes are required and possessed, we use the `dtmr_true_items` to
#' calculate the log odds of each respondent providing a correct response to
#' each item. `dtmr_true_items` contains the estimated item parameters reported
#' in Table 1 of Bradshaw et al. (2014). This a [tibble][tibble::tibble-package]
#' with `r nrow(dtmr_true_items)` rows and `r ncol(dtmr_true_items)` columns.
#' * `item`: Item identifier, corresponds to `1`-`22` in `dtmr_data`.
#' * `intercept`: The LCDM intercept parameter for each item.
#' * `referent_units`: The LCDM main effect parameter for items measuring the
#'   referent units attribute.
#' * `partitioning_iterating`: The LCDM main effect parameter for items
#'   measuring the partitioning and iterating attribute.
#' * `appropriateness`: The LCDM main effect parameter for items measuring the
#'   appropriateness attribute.
#' * `multiplicative_comparison`: The LCDM main effect parameter for items
#'   measuring the multiplicative comparisons attribute.
#' * `referent_units__partitioning_iterating`: The LCDM interaction parameter
#'   for items measuring both referent units and partitioning and iterating
#'   attributes.
#'
#' Finally, we convert the log odds values to probabilities and draw a random
#' Bernoulli variable using the probabilities of a correct response. The drawn
#' Bernoulli values are the simulated item scores that make up the `dtmr_data`.
#' @rdname dtmr
"dtmr_true_items"
