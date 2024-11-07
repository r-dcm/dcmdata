test_that("MDM data follows expected structure", {
  # mdm data
  expect_identical(ncol(mdm_data), 4L + 1L)
  expect_identical(nrow(mdm_data), 142L)
  expect_identical(colnames(mdm_data),
                   c("respondent", paste0("mdm", 1:4)))
  expect_s3_class(mdm_data$respondent, "factor")
  expect_true(all(nchar(as.character(mdm_data$respondent)) == 5))
  expect_equal(length(levels(mdm_data$respondent)), nrow(mdm_data))
  expect_equal(length(unique(mdm_data$respondent)),
               length(levels(mdm_data$respondent)))
  expect_equal(sort(as.character(mdm_data$respondent)),
               sort(levels(mdm_data$respondent)))

  for (i in 2:ncol(mdm_data)) {
    expect_true(all(mdm_data[[i]] %in% c(0L, 1L)))
  }

  # mdm qmatrix
  expect_identical(ncol(mdm_qmatrix), 1L + 1L)
  expect_identical(nrow(mdm_qmatrix), 4L)
  expect_identical(nrow(mdm_qmatrix), ncol(mdm_data) - 1L)
  expect_identical(colnames(mdm_qmatrix),
                   c("item", "multiplication"))
  expect_identical(mdm_qmatrix$item, paste0("mdm", 1:4))
  expect_identical(mdm_qmatrix$item, colnames(mdm_data)[2:5])

  for (i in 2:ncol(mdm_qmatrix)) {
    expect_true(all(mdm_qmatrix[[i]] %in% c(0L, 1L)))
  }
})
