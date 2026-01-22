test_that("timss07_ data follows expected structure", {
  # timss07_ data
  expect_identical(ncol(timss07_data), 25L + 1L)
  expect_identical(nrow(timss07_data), 698L)
  expect_identical(
    colnames(timss07_data),
    c(
      "id",
      "M031085",
      paste0("M0311", c("72", "73")),
      paste0("M0312", c("19", "45", "47")),
      paste0("M0313", c("03", "09")),
      paste0("M0410", c("52", "56", "69", "76")),
      paste0("M0411", c("31", "46", "52", "64", "86")),
      paste0("M0412", c("75", "81")),
      c("M041336", "M031242A", "M031242B", "M031242C", "M041258A", "M041258B")
    )
  )
  expect_identical(sort(unique(timss07_data$id)), 1:698)

  for (i in 2:ncol(timss07_data)) {
    expect_true(all(timss07_data[[i]] %in% c(0L, 1L, NA_integer_)))
  }

  # timss07 skill qmatrix ------------------------------------------------------
  expect_identical(ncol(timss07_skill_qmatrix), 15L + 1L)
  expect_identical(nrow(timss07_skill_qmatrix), 25L)
  expect_identical(nrow(timss07_skill_qmatrix), ncol(timss07_data) - 1L)
  expect_identical(
    colnames(timss07_skill_qmatrix),
    c(
      "item",
      "n_wn_represent",
      "n_wn_compute",
      "n_wn_solve",
      "n_wn_proportions",
      "n_fd_parts",
      "n_fd_solve",
      "n_ns_model",
      "n_pr_describe",
      "gm_la_properties",
      "gm_tt_figures",
      "gm_tt_calculate",
      "gm_lm_locate",
      "dd_ri_read",
      "dd_ri_information",
      "dd_or_data"
    )
  )
  expect_identical(
    timss07_skill_qmatrix$item,
    c(
      "M031085",
      paste0("M0311", c("72", "73")),
      paste0("M0312", c("19", "45", "47")),
      paste0("M0313", c("03", "09")),
      paste0("M0410", c("52", "56", "69", "76")),
      paste0("M0411", c("31", "46", "52", "64", "86")),
      paste0("M0412", c("75", "81")),
      c("M041336", "M031242A", "M031242B", "M031242C", "M041258A", "M041258B")
    )
  )
  expect_identical(timss07_skill_qmatrix$item, colnames(timss07_data)[2:26])

  for (i in 2:ncol(timss07_skill_qmatrix)) {
    expect_true(all(timss07_skill_qmatrix[[i]] %in% c(0L, 1L)))
  }

  # timss07 topic qmatrix ------------------------------------------------------
  expect_identical(ncol(timss07_topic_qmatrix), 7L + 1L)
  expect_identical(nrow(timss07_topic_qmatrix), 25L)
  expect_identical(nrow(timss07_topic_qmatrix), ncol(timss07_data) - 1L)
  expect_identical(
    colnames(timss07_topic_qmatrix),
    c(
      "item",
      "n_wn",
      "n_fd",
      "n_nspr",
      "gm_la",
      "gm_tt",
      "gm_lm",
      "dd_rior"
    )
  )
  expect_identical(
    timss07_topic_qmatrix$item,
    c(
      "M031085",
      paste0("M0311", c("72", "73")),
      paste0("M0312", c("19", "45", "47")),
      paste0("M0313", c("03", "09")),
      paste0("M0410", c("52", "56", "69", "76")),
      paste0("M0411", c("31", "46", "52", "64", "86")),
      paste0("M0412", c("75", "81")),
      c("M041336", "M031242A", "M031242B", "M031242C", "M041258A", "M041258B")
    )
  )
  expect_identical(timss07_topic_qmatrix$item, colnames(timss07_data)[2:26])

  for (i in 2:ncol(timss07_topic_qmatrix)) {
    expect_true(all(timss07_topic_qmatrix[[i]] %in% c(0L, 1L)))
  }

  # timss07 domain qmatrix -----------------------------------------------------
  expect_identical(ncol(timss07_domain_qmatrix), 3L + 1L)
  expect_identical(nrow(timss07_domain_qmatrix), 25L)
  expect_identical(nrow(timss07_domain_qmatrix), ncol(timss07_data) - 1L)
  expect_identical(
    colnames(timss07_domain_qmatrix),
    c(
      "item",
      "n",
      "gm",
      "dd"
    )
  )
  expect_identical(
    timss07_domain_qmatrix$item,
    c(
      "M031085",
      paste0("M0311", c("72", "73")),
      paste0("M0312", c("19", "45", "47")),
      paste0("M0313", c("03", "09")),
      paste0("M0410", c("52", "56", "69", "76")),
      paste0("M0411", c("31", "46", "52", "64", "86")),
      paste0("M0412", c("75", "81")),
      c("M041336", "M031242A", "M031242B", "M031242C", "M041258A", "M041258B")
    )
  )
  expect_identical(timss07_domain_qmatrix$item, colnames(timss07_data)[2:26])

  for (i in 2:ncol(timss07_domain_qmatrix)) {
    expect_true(all(timss07_domain_qmatrix[[i]] %in% c(0L, 1L)))
  }
})
