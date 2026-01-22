test_that("timss03 data follows expected structure", {
  # timss03 data
  expect_identical(ncol(timss03_data), 23L + 1L)
  expect_identical(nrow(timss03_data), 757L)
  expect_identical(
    colnames(timss03_data),
    c(
      "id",
      paste0("M0120", c("01", "02", "04", "16", "17", "40", "41", "42")),
      paste0("M0220", c("43", "50", "57", "66")),
      paste0("M0221", c("85", "91", "94", "96", "98", "99")),
      paste0("M0222", c("32", "51")),
      c("M032570", "M032643", "M022234B")
    )
  )
  expect_identical(sort(unique(timss03_data$id)), 1:757)

  for (i in 2:ncol(timss03_data)) {
    expect_true(all(timss03_data[[i]] %in% c(0L, 1L)))
  }

  # timss03 qmatrix
  expect_identical(ncol(timss03_qmatrix), 13L + 1L)
  expect_identical(nrow(timss03_qmatrix), 23L)
  expect_identical(nrow(timss03_qmatrix), ncol(timss03_data) - 1L)
  expect_identical(
    colnames(timss03_qmatrix),
    c(
      "item",
      "understand_ratio",
      "use_ratio",
      "compute_fluently",
      "rational_numbers",
      "algebraic_expressions",
      "one_variable_equations",
      "recognize_proportional_relationships",
      "use_proportional_relationships",
      "asmd_rational_numbers",
      "expressions_equations",
      "compare_fractions",
      "multistep_problems",
      "equivalent_fractions"
    )
  )
  expect_identical(
    timss03_qmatrix$item,
    c(
      paste0("M0120", c("01", "02", "04", "16", "17", "40", "41", "42")),
      paste0("M0220", c("43", "50", "57", "66")),
      paste0("M0221", c("85", "91", "94", "96", "98", "99")),
      paste0("M0222", c("32", "51")),
      c("M032570", "M032643", "M022234B")
    )
  )
  expect_identical(timss03_qmatrix$item, colnames(timss03_data)[2:24])

  for (i in 2:ncol(timss03_qmatrix)) {
    expect_true(all(timss03_qmatrix[[i]] %in% c(0L, 1L)))
  }
})
