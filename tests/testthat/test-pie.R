test_that("PIE data follows expected structure", {
  # pie ft data -----
  expect_identical(ncol(pie_ft_data), 15L + 1L)
  expect_identical(nrow(pie_ft_data), 172L)
  expect_true(colnames(pie_ft_data)[1] == "student")
  expect_all_true(grepl("^[0-9]{5}$", colnames(pie_ft_data)[-1]))
  expect_all_true(grepl("^[0-9]{7}$", pie_ft_data$student))

  for (i in 2:ncol(pie_ft_data)) {
    expect_true(all(pie_ft_data[[i]] %in% c(0L, 1L, NA_integer_)))
  }

  # pie ft qmatrix -----
  expect_identical(ncol(pie_ft_qmatrix), 3L + 1L)
  expect_identical(nrow(pie_ft_qmatrix), 15L)
  expect_identical(nrow(pie_ft_qmatrix), ncol(pie_ft_data) - 1L)
  expect_identical(
    colnames(pie_ft_qmatrix),
    c("task", "L1", "L2", "L3")
  )
  expect_all_true(grepl("^[0-9]{5}$", pie_ft_qmatrix$task))
  expect_identical(pie_ft_qmatrix$task, colnames(pie_ft_data)[2:16])

  for (i in 2:ncol(pie_ft_qmatrix)) {
    expect_true(all(pie_ft_qmatrix[[i]] %in% c(0L, 1L)))
  }

  # pie pilot data -----
  expect_identical(ncol(pie_pilot_data), 17L + 2L)
  expect_identical(nrow(pie_pilot_data), 2370L)
  expect_identical(colnames(pie_pilot_data)[1:2], c("student", "time"))
  expect_all_true(grepl("^[0-9]{5}$", colnames(pie_pilot_data)[-c(1:2)]))
  expect_all_true(grepl("^[0-9]{7}$", pie_pilot_data$student))
  expect_all_true(
    pie_pilot_data$time %in% c("baseline", "midway", "end_of_unit")
  )

  for (i in 3:ncol(pie_pilot_data)) {
    expect_true(all(pie_pilot_data[[i]] %in% c(0L, 1L, NA_integer_)))
  }

  # pie pilot qmatrix -----
  expect_identical(ncol(pie_pilot_qmatrix), 3L + 1L)
  expect_identical(nrow(pie_pilot_qmatrix), 17L)
  expect_identical(nrow(pie_pilot_qmatrix), ncol(pie_pilot_data) - 2L)
  expect_identical(
    colnames(pie_pilot_qmatrix),
    c("task", "L1", "L2", "L3")
  )
  expect_all_true(grepl("^[0-9]{5}$", pie_pilot_qmatrix$task))
  expect_identical(pie_pilot_qmatrix$task, colnames(pie_pilot_data)[3:19])

  for (i in 2:ncol(pie_pilot_qmatrix)) {
    expect_true(all(pie_pilot_qmatrix[[i]] %in% c(0L, 1L)))
  }
})
