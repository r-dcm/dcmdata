test_that("mcmi data follows expected structure", {
  # mcmi data
  expect_identical(ncol(mcmi_data), 44L + 1L)
  expect_identical(nrow(mcmi_data), 1208L)
  expect_identical(colnames(mcmi_data), c("id", paste0("item.", 1:44)))
  expect_identical(sort(unique(mcmi_data$id)), 1:1208)

  for (i in 2:ncol(mcmi_data)) {
    expect_true(all(mcmi_data[[i]] %in% c(0L, 1L)))
  }

  # mcmi qmatrix
  expect_identical(ncol(mcmi_qmatrix), 4L + 1L)
  expect_identical(nrow(mcmi_qmatrix), 44L)
  expect_identical(nrow(mcmi_qmatrix), ncol(mcmi_data) - 1L)
  expect_identical(
    colnames(mcmi_qmatrix),
    c(
      "item",
      "anxiety",
      "somatoform",
      "thought_disorder",
      "major_depression"
    )
  )
  expect_identical(mcmi_qmatrix$item, paste0("item.", 1:44))
  expect_identical(mcmi_qmatrix$item, colnames(mcmi_data)[2:45])

  for (i in 2:ncol(mcmi_qmatrix)) {
    expect_true(all(mcmi_qmatrix[[i]] %in% c(0L, 1L)))
  }
})
