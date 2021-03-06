context("Testing new_keyword()")

# get the token
key <- Sys.getenv("SCRC_API_TOKEN")

sleep_time <- 0.5

test_user <- "22"

test_identifier <- sample(1:1000000, 1, replace=TRUE)

keyphrase <- paste(sample(letters, 12, FALSE), collapse ="", sep = "")

keyphrase <- paste0(keyphrase, format(Sys.time(), "%d%m%y%H%M%S"), test_identifier)

object_id <- get_entry("object", list(updated_by = test_user))[[1]]$url

if(is.null(object_id)){
  object_id <- post_data("object",
                         list(description = paste0(keyphrase, " Test")),
                         key)
}

test_that("new_keyword works as intended", {
  expect_true(is.character(new_keyword(keyphrase,
                                       object_id,
                                       key)))
})

test_that("duplicate new_keyword produces a message", {
  expect_message(expect_true(is.character(new_keyword(keyphrase,
                                       object_id,
                                       key))))
})
