% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/new_storage_location.R
\name{new_storage_location}
\alias{new_storage_location}
\title{Post entry to storage_location table}
\usage{
new_storage_location(path, hash, storage_root_id, key)
}
\arguments{
\item{path}{a \code{string} specifying the path from the \code{storage_root}
URI to the item location, which when appended to \code{storage_root} URI
produces a complete URL
\emph{e.g.} "master/SCRC/human/infection/SARS-CoV-2/latent-period/0.1.0.toml"}

\item{hash}{a \code{string} specifying the SHA1 hash of the file stored in
\code{storage_location} \emph{e.g.} "7c0e14caec08674d7d4e52c305cb4320babaf90f"}

\item{storage_root_id}{a \code{string} specifying the API URL of the
associated \code{storage_root} table
\emph{e.g.} "https://data.scrc.uk/api/storage_root/14/"}

\item{key}{API token from data.scrc.uk}
}
\description{
Upload information to the \code{storage_location} table in the data registry
}
\seealso{
Other new functions: 
\code{\link{new_author}()},
\code{\link{new_code_repo_release}()},
\code{\link{new_coderun}()},
\code{\link{new_data_product}()},
\code{\link{new_external_object}()},
\code{\link{new_issue}()},
\code{\link{new_keyword}()},
\code{\link{new_namespace}()},
\code{\link{new_object_component}()},
\code{\link{new_object}()},
\code{\link{new_source}()},
\code{\link{new_storage_root}()},
\code{\link{new_text_file}()}
}
\concept{new functions}
