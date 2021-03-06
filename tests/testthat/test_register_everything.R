context("Testing register_everything()")

# get the token
key <- Sys.getenv("SCRC_API_TOKEN")
sleep_time <- 0.5
test_user <- "22"
test_identifier <- sample(1:1000000, 1, replace=TRUE)
datetime <- format(Sys.time(), "%d%m%y%H%M%S")
UID <- paste0("register everything ", datetime, test_identifier)
UID_ <- paste0("register-everything-", datetime, test_identifier)
path <- paste0(UID_)
patch <- sample(0:9, 1)
major <- sample(0:9, 1)

# Create a CSV
df <- data.frame(cbind(UID = rep(UID, 10),
                       test = 1:10,
                       text = paste0(rep("TEST_", 10), as.character(1:10))))

if(!file.exists(path)) dir.create(path, recursive = TRUE)

version <- create_version_number(Sys.Date(),
                                 patch = patch,
                                 major = major)
filename <- paste0(version, ".csv")
filepath <- paste0(path, "/", filename)
write.csv(df, filepath)

create_table(paste0(version, ".h5"), path, UID_, df)

submission_script <- paste0("inst/SCRC/", UID_, ".R")
repo <- paste0("ScottishCovidResponse/", UID_)

github_info <- list(repo_storageRoot = "github",
                    script_gitRepo = repo,
                    repo_version = version,
                    github_hash = openssl::sha1(UID),
                    submission_script = submission_script)

original_source_name <- paste0("source " ,UID)
original_path <- paste0("download/", UID_, ".csv")
original_root <- paste0("https://", UID_, ".com/")

original_source_id <- post_data("source",
                                list(
                                name = original_source_name,
                                abbreviation = original_source_name),
                                key)

test_that("register_everything works with single original source", {
  skip_if(is.null(original_source_id))
  expect_message(expect_true(is.character(
    register_everything(product_name = path,
                        version_number = version,
                        doi_or_unique_name = UID,
                        save_location = getwd(),
                        namespace = UID,
                        original_source_name = original_source_name,
                        original_sourceId = original_source_id,
                        original_root = original_root,
                        original_path = original_path,
                        source_filename = filename,
                        submission_script = submission_script,
                        github_info = github_info,
                        accessibility = 0,
                        key)

  )))
})



# # Multiple original sources
# register_everything(product_name = "geography/scotland/lookup_table",
#                     version_number = "0.1.0",
#                     doi_or_unique_name = "Scottish spatial lookup table",
#                     save_location = "data-raw",
#                     namespace = "SCRC",
#                     original_source_name = list(simd = "Scottish Government",
#                                                 dz = "Scottish Government Open Data Repository downloadable file"),
#                     original_sourceId = list(simd = "https://data.scrc.uk/api/source/3932/",
#                                              dz = "https://data.scrc.uk/api/source/3976/"),
#                     original_root = list(simd = "https://www.gov.scot/", dz = "http://statistics.gov.scot/"),
#                     original_path = list(simd = "path/thisfile.csv", dz = "downloads/anotherfile.csv"),
#                     source_filename = list(simd = paste0(version_number, ".xlsx"),
#                                            dz = paste0(version_number, ".csv")),
#                     submission_script = "scotgov_dz_lookup.R",
#                     github_info = github_info,
#                     accessibility = 0,
#                     key)

file.remove(filepath)
file.remove(paste0(path, "/", version, ".h5"))

unlink(path, recursive = TRUE)
