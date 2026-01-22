test_that("fractions data follows expected structure", {
  # fraction data
  expect_identical(ncol(fraction_data), 20L + 1L)
  expect_identical(nrow(fraction_data), 536L)
  expect_identical(colnames(fraction_data), c("id", paste0("item_", 1:20)))
  expect_identical(sort(unique(fraction_data$id)), 1:536)

  for (i in 2:ncol(fraction_data)) {
    expect_true(all(fraction_data[[i]] %in% c(0L, 1L)))
  }

  # fraction qmatrix
  expect_identical(ncol(fraction_qmatrix), 8L + 1L)
  expect_identical(nrow(fraction_qmatrix), 20L)
  expect_identical(nrow(fraction_qmatrix), ncol(fraction_data) - 1L)
  expect_identical(
    colnames(fraction_qmatrix),
    c(
      "item",
      "convert",
      "separate",
      "simplify",
      "common",
      "borrow_whole",
      "borrow_numerator",
      "subtract",
      "reduce"
    )
  )
  expect_identical(fraction_qmatrix$item, paste0("item_", 1:20))
  expect_identical(fraction_qmatrix$item, colnames(fraction_data)[2:21])

  for (i in 2:ncol(fraction_qmatrix)) {
    expect_true(all(fraction_qmatrix[[i]] %in% c(0L, 1L)))
  }
})
