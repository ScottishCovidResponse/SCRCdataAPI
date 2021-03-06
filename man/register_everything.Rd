% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/register_everything.R
\name{register_everything}
\alias{register_everything}
\title{Post everything associated with a data product to the data registry}
\usage{
register_everything(
  product_name,
  version_number,
  doi_or_unique_name,
  save_location,
  namespace,
  original_source_name,
  original_sourceId,
  original_root,
  original_path,
  source_filename,
  submission_script,
  github_info,
  accessibility = 0,
  key
)
}
\arguments{
\item{product_name}{a \code{string} specifying the product_name (used to
identify the data product as well as being used to generate various file
locations)}

\item{version_number}{a \code{string} specifying the version identifier of
the \code{data_product} (must conform to semantic versioning syntax)}

\item{doi_or_unique_name}{a \code{string} specifying the DOI or name of the
\code{external_object} (source data)}

\item{save_location}{a \code{string}, which when prepended to
product_name, will specify where to download the original source to and
where to save the processed data product to. Default is "data-raw"}

\item{namespace}{a \code{string} specifying the namespace; by default this
is "SCRC"}

\item{original_source_name}{a \code{string} specifying the original source
name}

\item{original_sourceId}{a \code{string} specifying the API URL of the
associated \code{source} table}

\item{original_root}{a \code{string} specifying the root of the original
source (must have a trailing slash), which when prepended to
\code{original_path} produces a complete URL}

\item{original_path}{a \code{string} specifying the path from the
original_root, which when appended to \code{original_root} produces a
complete URL}

\item{source_filename}{a \code{string} specifying the source filename}

\item{submission_script}{a \code{string} specifying the filename of the
submission script located in the \code{inst/namespace/} directory of the
SCRCdata package}

\item{github_info}{a \code{list} containing named elements repo_storageRoot,
script_gitRepo, repo_version, github_hash, and submission_script}

\item{accessibility}{(optional) an \code{integer} value for the accessibility
enum associated with \code{original_root}, where 0 is public (default) and
1 is private}

\item{key}{API token from data.scrc.uk}
}
\description{
This function assumes that (1) the source data is being saved as a
\code{csv} file, (2) the data product is being saved as an \code{h5} file,
(3) the source data and data product are being stored on the boydorr ftp
server (4) the submission script is being stored in the
ScottishCovidResponse/SCRCdata respository. Data products may be generated
from a single or multiple original sources, see Examples below for details.
}
\details{
Note that when a data product is generated from multiple original sources,
\code{original_source_name}, \code{original_sourceId}, \code{original_root},
and \code{original_path} are input as named lists (see Example below).
}
\examples{
\dontrun{
repo <- "ScottishCovidResponse/SCRCdata"

github_info <- list(repo_storageRoot = "github",
script_gitRepo = repo,
repo_version = "0.8.0",
github_hash = get_github_hash(repo),
submission_script = "inst/SCRC/scotgov_dz_lookup.R")

# A single original source
register_everything(product_name = "geography/scotland/lookup_table",
version_number = "0.1.0",
doi_or_unique_name = "Scottish spatial lookup table",
save_location = "data-raw",
namespace = "SCRC",
original_source_name = "Scottish Government",
original_sourceId = "https://data.scrc.uk/api/source/3932/",
original_root = "https://www.gov.scot/",
original_path = "path/somefile.csv",
source_filename = "paste0(version_number, ".csv")",
submission_script = "scotgov_dz_lookup.R",
github_info = github_info,
accessibility = 0,
key)

# Multiple original sources
register_everything(product_name = "geography/scotland/lookup_table",
version_number = "0.1.0",
doi_or_unique_name = "Scottish spatial lookup table",
save_location = "data-raw",
namespace = "SCRC",
original_source_name = list(simd = "Scottish Government",
dz = "Scottish Government Open Data Repository downloadable file"),
original_sourceId = list(simd = "https://data.scrc.uk/api/source/3932/",
dz = "https://data.scrc.uk/api/source/3976/"),
original_root = list(simd = "https://www.gov.scot/", dz = "http://statistics.gov.scot/"),
original_path = list(simd = "path/thisfile.csv", dz = "downloads/anotherfile.csv"),
source_filename = list(simd = paste0(version_number, ".xlsx"),
dz = paste0(version_number, ".csv")),
submission_script = "scotgov_dz_lookup.R",
github_info = github_info,
accessibility = 0,
key)
}

}
