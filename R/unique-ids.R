#' Generate Unique Identifiers
#'
#' Create unique alphanumeric identifiers with a specified character length and
#' proportions of alpha and numeric characters.
#'
#' @param n The number of unique identifiers to generate.
#' @param characters The number of characters to be included in each identifier.
#' @param pct_numeric The percentage of `characters` that should be numeric.
#'   The default is `1` (i.e., all numbers). If less than 1, identifiers will
#'   also include lowercase and uppercase letters.
#' @param n_attempt The number of allowed attempts for generating the requested
#'   number of identifiers. See details for more information.
#'
#' When identifiers are long (e.g., `characters` >= 10), it is slow and
#' computationally intensive to find all possible permutations of the specified
#' number of alpha and numeric characters.
#' Therefore, identifiers are generated one at a time by sampling the required
#' number of characters.
#' This greatly increases efficiency, as we don't waste time generating multiple
#' millions of identifiers when we might only need a few hundred.
#' However, this means that it is possible we could generate duplicate
#' identifiers.
#' The `n_attempt` argument allows us to control how many identifiers we can
#' generate in order to achieve our desired `n` unique identifiers.
#' If we fail to find `n` unique identifiers after `n_attempt`, the function
#' will error.
#' For example, consider a request for 1,000 identifiers, each with 2 characters
#' and only using numbers.
#' With the number 0-9, there are only 100 possible two-character permutations.
#' Thus, after `n_attempt`, the function will fail as 1,000 unique identifiers
#' cannot be found.
#'
#' @returns A factor vector of length `n`.
#' @export
#'
#' @examples
#' generate_ids(n = 10, characters = 5)
#' generate_ids(n = 100, characters = 10, pct_numeric = 0.5)
generate_ids <- function(n, characters, pct_numeric = 1, n_attempt = n * 3) {
  check_number_whole(n)
  check_number_whole(characters)
  check_number_decimal(pct_numeric, min = 0, max = 1)
  check_number_whole(n_attempt)

  numbr <- round(characters * pct_numeric)
  alpha <- characters - numbr

  ids <- vector(mode = "character", length = n)
  iter <- 0
  for (i in seq_along(ids)) {
    good_id <- FALSE
    while(!good_id) {
      iter <- iter + 1
      test_id <- paste(
        sample(
          c(sample(0:9, size = numbr, replace = TRUE),
            sample(c(letters, LETTERS), size = alpha, replace = TRUE)),
          size = characters,
          replace = FALSE
        ),
        collapse = ""
      )

      if (!(test_id %in% ids)) {
        ids[i] <- test_id
        good_id <- TRUE
      } else if (iter >= n_attempt) {
        good_id <- TRUE
      }
    }

    if (iter >= n_attempt) break
  }

  if (any(vapply(ids, nchar, integer(1)) < characters)) {
    cli::cli_abort(
      message = paste("Not enough unqiue identifiers found for the {.val {n}}",
                      "that were requested"),
      footer = cli::format_message(
        c(i = "Try increasing the number of {.arg characters}.")
      ),
      call = rlang::caller_env()
    )
  }

  factor(ids)
}
