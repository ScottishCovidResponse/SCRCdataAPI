% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/new_data_product.R
\name{new_data_product}
\alias{new_data_product}
\title{Post entry to data_product table}
\usage{
new_data_product(name, version, object_id, namespace_id, key)
}
\arguments{
\item{name}{a \code{string} specifying the name of the \code{data_product}
\emph{e.g.} "records/SARS-CoV-2/scotland/human-mortality"}

\item{version}{a \code{string} specifying the version identifier of the
\code{data_product} (must conform to semantic versioning syntax) \emph{e.g.} "0.1.0"}

\item{object_id}{a \code{string} specifying the API URL of the
associated \code{object} table \emph{e.g.} "https://data.scrc.uk/api/object/156/",}

\item{namespace_id}{a \code{string} specifying the API URL of the
associated \code{namespace} table \emph{e.g.} "https://data.scrc.uk/api/namespace/2/"}

\item{key}{API token from data.scrc.uk}
}
\description{
Upload information to the \code{data_product} table in the data registry
}
\seealso{
Other new functions: 
\code{\link{new_author}()},
\code{\link{new_code_repo_release}()},
\code{\link{new_coderun}()},
\code{\link{new_external_object}()},
\code{\link{new_issue}()},
\code{\link{new_keyword}()},
\code{\link{new_namespace}()},
\code{\link{new_object_component}()},
\code{\link{new_object}()},
\code{\link{new_source}()},
\code{\link{new_storage_location}()},
\code{\link{new_storage_root}()},
\code{\link{new_text_file}()}
}
\concept{new functions}
