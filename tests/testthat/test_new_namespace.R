context("Testing new_namespace()")

# get the token
key <- Sys.getenv("SCRC_API_TOKEN")

sleep_time <- 0.5

test_user <- "22"

test_identifier <- sample(1:1000000, 1, replace=TRUE)

name <- paste0("namespace ", format(Sys.time(), "%d%m%y%H%M%S"), test_identifier)

test_that("new_namespace posts to registry", {
  expect_true(is.character(new_namespace(name,
                                         key)))
})

test_that("new_namespace produces a message when the same name is used", {
  expect_message(is.character(new_namespace(name,
                                            key)))
})
