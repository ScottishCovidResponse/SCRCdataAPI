% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_data_from_object_id.R
\name{get_data_from_object_id}
\alias{get_data_from_object_id}
\title{Download TOML/H5 file}
\usage{
get_data_from_object_id(obj_id, data_dir = "data-raw")
}
\arguments{
\item{obj_id}{an \code{integer} specifying the id of an entry}

\item{data_dir}{a \code{string} specifying the directory in which the file
should be saved}
}
\value{
Returns a \code{list} comprising two elements
\itemize{
\item{downloaded_to}{absolute path of TOML/H5 file after downloading}
\item{components}{TOML/H5 file components}
}
}
\description{
Download TOML/H5 file
}
\keyword{internal}
