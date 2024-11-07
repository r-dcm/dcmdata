test_that("can perform logit transformation", {
  expect_equal(logit(0.50), 0, tolerance = 1e-3)
  expect_equal(logit(0.25), -1.0986, tolerance = 1e-3)
  expect_equal(logit(0.80), 1.3862, tolerance = 1e-3)
  expect_equal(inv_logit(0), 0.50, tolerance = 1e-3)
  expect_equal(inv_logit(3), 0.9525, tolerance = 1e-3)
  expect_equal(inv_logit(-2), 0.1192, tolerance = 1e-3)
})
