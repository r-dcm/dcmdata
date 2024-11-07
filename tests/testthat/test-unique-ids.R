test_that("correct number of ids generated", {
  expect_equal(length(unique(generate_ids(n = 500, characters = 5))), 500L)
  expect_equal(length(unique(generate_ids(n = 200, characters = 6))), 200L)
  expect_equal(length(unique(generate_ids(n = 100, characters = 7))), 100L)
  expect_equal(length(unique(generate_ids(n = 1000, characters = 8))), 1000L)
  expect_equal(length(unique(generate_ids(n = 5000, characters = 9))), 5000L)
})

test_that("ids are correct length", {
  expect_true(
    all(nchar(as.character(generate_ids(100, characters = 4))) == 4)
  )
  expect_true(
    all(nchar(as.character(generate_ids(100, characters = 10))) == 10)
  )
  expect_true(
    all(nchar(as.character(generate_ids(250, characters = 3))) == 3)
  )
  expect_true(
    all(nchar(as.character(generate_ids(500, characters = 15))) == 15)
  )
  expect_true(
    all(nchar(as.character(generate_ids(1000, characters = 20))) == 20)
  )
})

test_that("ids are correct proportion numeric", {
  count_numbers <- function(x) {
    chars <- strsplit(as.character(x), split = "")[[1]]
    sum(chars %in% 0:9)
  }

  ids <- generate_ids(100, characters = 10, prop_numeric = 1.00)
  expect_true(all(vapply(ids, count_numbers, integer(1)) == 10))

  ids <- generate_ids(100, characters = 10, prop_numeric = 0.20)
  expect_true(all(vapply(ids, count_numbers, integer(1)) == 2))

  ids <- generate_ids(100, characters = 10, prop_numeric = 0.80)
  expect_true(all(vapply(ids, count_numbers, integer(1)) == 8))

  ids <- generate_ids(100, characters = 20, prop_numeric = 0.05)
  expect_true(all(vapply(ids, count_numbers, integer(1)) == 1))

  ids <- generate_ids(100, characters = 20, prop_numeric = 0.70)
  expect_true(all(vapply(ids, count_numbers, integer(1)) == 14))
})

test_that("error when not enough ids possible", {
  err <- rlang::catch_cnd(generate_ids(100, characters = 5, n_attempt = 20))
  expect_s3_class(err, "rlang_error")
  expect_match(err$message, "larger than or equal to 100")

  err <- rlang::catch_cnd(generate_ids(1000, characters = 2))
  expect_s3_class(err, "rlang_error")
  expect_match(err$message, "Not enough unqiue identifiers found")

  err <- rlang::catch_cnd(generate_ids(100, characters = 1, prop_numeric = 0))
  expect_s3_class(err, "rlang_error")
  expect_match(err$message, "Not enough unqiue identifiers found")
})
