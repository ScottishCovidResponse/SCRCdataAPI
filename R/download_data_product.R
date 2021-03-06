#' Download data product
#'
#' Download data product from the Boydorr server.
#'
#' @param name a \code{string} specifying the name of the data product
#' @param data_dir a \code{string} specifying the download directory
#' @param version (optional) a \code{string} specifying the version number of
#' the data product; if version is not specified, the most recent version will
#' be downloaded
#'
#' @family download functions
#'
#' @export
#'
#' @return Returns list comprising two elements
#' \itemize{
#'  \item{"downloaded_to"}{absolute path of H5 file after downloading}
#'  \item{"components"}{H5 file components}
#' }
#'
#' @examples
#' \dontrun{
#' # Download H5 file
#' data_product <- "records/SARS-CoV-2/scotland/cases-and-management/testing"
#'
#' # Automatically download the latest version
#' download_data_product(name = data_product,
#'                       data_dir = "data-raw")
#'
#' # Download specified version
#' download_data_product(name = data_product,
#'                       data_dir = "data-raw",
#'                       version = "0.20200920.0")
#'
#' # Download TOML file
#' data_product <- "human/infection/SARS-CoV-2/asymptomatic-period"
#'
#' # Automatically download the latest version
#' download_data_product(name = data_product,
#'                       data_dir = "data-raw")
#' }
#'
download_data_product <- function(name, data_dir, version) {
  # List all version numbers in the data registry
  entries <- get_entry("data_product", list(name = name))

  if(!is.null(entries)) {
    version_numbers <- lapply(entries, function(x) x$version) %>%
      unlist()

    # If version hasn't been input, get the latest version from the data registry
    if(missing(version)){
      version <- max(as.numeric_version(version_numbers))
      version <- as.character(version)
    }


    # Find the version
    ind <- which(version_numbers == version)
    this_entry <- entries[[ind]]

    # Get its object id
    object_id <- this_entry$object
    object_id <- gsub("https://data.scrc.uk/api/object/", "", object_id)
    object_id <- gsub("/", "", object_id)

    # Download file
    return(get_data_from_object_id(as.numeric(object_id), data_dir))
  }
}
