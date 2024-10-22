#' Log-odds Transformation
#'
#' These functions implement the log-odds (or logit) transformation. This is a
#' common transformation for psychometric models that is used to put
#' probabilities on a continuous scale.
#'
#' @param x A number to be transformed
#'
#' @return A transformed double
#'
#' @examples
#' logit(0.6)
#' logit(0.5)
#'
#' inv_logit(3.5)
#' inv_logit(0)
#'
#' @name log_odds
NULL

#' @rdname log_odds
#' @export
logit <- function(x) {
  check_number_decimal(x, min = 0, max = 1)
  log(x / (1 - x))
}

#' @rdname log_odds
#' @export
inv_logit <- function(x) {
  check_number_decimal(x)
  exp(x) / (1 + exp(x))
}
