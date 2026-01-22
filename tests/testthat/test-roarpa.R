test_that("roarpa data follows expected structure", {
  # roarpa data
  expect_identical(ncol(roarpa_data), 57L + 1L)
  expect_identical(nrow(roarpa_data), 272L)
  expect_identical(
    colnames(roarpa_data),
    c(
      "id",
      paste0("fsm_", sprintf("%02d", c(1, 4:8, 10:12, 14:18, 21:25))),
      paste0("lsm_", sprintf("%02d", c(1:2, 4:8, 10:11, 13, 15:22, 24))),
      paste0("del_", sprintf("%02d", c(1, 3:11, 13:18, 20:22)))
    )
  )
  expect_identical(sort(unique(roarpa_data$id)), 1:272)

  for (i in 2:ncol(roarpa_data)) {
    expect_true(all(roarpa_data[[i]] %in% c(0L, 1L, NA_integer_)))
  }

  # roarpa qmatrix
  expect_identical(ncol(roarpa_qmatrix), 3L + 1L)
  expect_identical(nrow(roarpa_qmatrix), 57L)
  expect_identical(nrow(roarpa_qmatrix), ncol(roarpa_data) - 1L)
  expect_identical(
    colnames(roarpa_qmatrix),
    c(
      "item",
      "lsm",
      "del",
      "fsm"
    )
  )
  expect_identical(
    roarpa_qmatrix$item,
    c(
      paste0("fsm_", sprintf("%02d", c(1, 4:8, 10:12, 14:18, 21:25))),
      paste0("lsm_", sprintf("%02d", c(1:2, 4:8, 10:11, 13, 15:22, 24))),
      paste0("del_", sprintf("%02d", c(1, 3:11, 13:18, 20:22)))
    )
  )
  expect_identical(roarpa_qmatrix$item, colnames(roarpa_data)[2:58])

  for (i in 2:ncol(roarpa_qmatrix)) {
    expect_true(all(roarpa_qmatrix[[i]] %in% c(0L, 1L)))
  }
})
