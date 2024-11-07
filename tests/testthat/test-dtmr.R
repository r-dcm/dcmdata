test_that("DTMR data follows expected structure", {
  # dtmr data
  expect_identical(ncol(dtmr_data), 27L + 1L)
  expect_identical(nrow(dtmr_data), 990L)
  expect_identical(colnames(dtmr_data),
                   c("id", c(1:7, paste0(8, letters[1:4]), 9,
                             paste0(10, letters[1:3]), 11:14,
                             paste0(15, letters[1:3]), 16:18, 21:22)))
  expect_s3_class(dtmr_data$id, "factor")
  expect_true(all(nchar(as.character(dtmr_data$id)) == 6))
  expect_equal(length(levels(dtmr_data$id)), nrow(dtmr_data))
  expect_equal(length(unique(dtmr_data$id)), length(levels(dtmr_data$id)))
  expect_equal(as.character(dtmr_data$id), levels(dtmr_data$id))

  for (i in 2:ncol(dtmr_data)) {
    expect_true(all(dtmr_data[[i]] %in% c(0L, 1L)))
  }

  # dtmr qmatrix
  expect_identical(ncol(dtmr_qmatrix), 4L + 1L)
  expect_identical(nrow(dtmr_qmatrix), 27L)
  expect_identical(nrow(dtmr_qmatrix), ncol(dtmr_data) - 1L)
  expect_identical(colnames(dtmr_qmatrix),
                   c("item", "referent_units", "partitioning_iterating",
                     "appropriateness", "multiplicative_comparison"))
  expect_identical(dtmr_qmatrix$item,
                   c(1:7, paste0(8, letters[1:4]), 9,
                     paste0(10, letters[1:3]), 11:14,
                     paste0(15, letters[1:3]), 16:18, 21:22))
  expect_identical(dtmr_qmatrix$item, colnames(dtmr_data)[2:28])

  for (i in 2:ncol(dtmr_qmatrix)) {
    expect_true(all(dtmr_qmatrix[[i]] %in% c(0L, 1L)))
  }
})

test_that("DTMR true values follow expected structure", {
  # item parameters
  params <- model.matrix(~ . ^ 2, data = dtmr_qmatrix[, -1])
  colnames(params) <- gsub("\\(Intercept\\)", "intercept", colnames(params))
  colnames(params) <- gsub(":", "__", colnames(params))
  expect_identical(nrow(dtmr_true_items), nrow(dtmr_qmatrix))
  expect_identical(dtmr_true_items$item, dtmr_qmatrix$item)
  expect_true(all(colnames(dtmr_true_items %in% c("item", colnames(params)))))

  # structural parameters
  expect_equal(nrow(dtmr_true_structural),
               2L ^ ncol(dtmr_qmatrix[, -1]))
  expect_identical(ncol(dtmr_true_structural),
                   ncol(dtmr_qmatrix[, -1]) + 1L)
  expect_identical(colnames(dtmr_true_structural),
                   c(colnames(dtmr_qmatrix)[-1], "class_probability"))
  expect_equal(sum(dtmr_true_structural$class_probability), 1)
  for (i in 1:(ncol(dtmr_true_structural) - 1)) {
    expect_true(all(dtmr_true_structural[[i]] %in% c(0L, 1L)))
    expect_equal(sum(dtmr_true_structural[[i]]), 8L)
  }

  # profiles
  expect_identical(nrow(dtmr_true_profiles), nrow(dtmr_data))
  expect_identical(sort(dtmr_true_profiles$id), sort(dtmr_data$id))
  expect_identical(colnames(dtmr_true_profiles),
                   c("id", colnames(dtmr_qmatrix)[-1]))
  for (i in 2:ncol(dtmr_true_profiles)) {
    expect_true(all(dtmr_true_profiles[[i]] %in% c(0L, 1L)))
  }
})
