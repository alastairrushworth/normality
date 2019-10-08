context("helpers")

# load in some example data
set.seed(101)
z <- rnorm(100)

# basic test
test_that("Check output is a data.frame", {
  expect_is(normality(z), 'data.frame')
})

