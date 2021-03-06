#' Post entry to storage_root table
#'
#' Upload information to the \code{storage_root} table in the data registry
#'
#' @param name a \code{string} specifying the name of the \code{storage_root}
#' *e.g.* "boydorr"
#' @param root a \code{string} specifying the URI to the root of a
#' `storage_location`, which is then prepended to a \code{storage_location}
#' *e.g.* "ftp://boydorr.gla.ac.uk/scrc/"
#' @param accessibility (optional) an \code{integer} value for the accessibility
#' enum, where 0 is public (default) and 1 is private
#' @param key API token from data.scrc.uk
#'
#' @family new functions
#'
#' @export
#'
new_storage_root <- function(name,
                             root,
                             accessibility = 0,
                             key) {

  post_data(table = "storage_root",
            data = list(name = name,
                        root = root,
                        accessibility = accessibility),
            key)
}
