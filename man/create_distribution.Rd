% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_distribution.R
\name{create_distribution}
\alias{create_distribution}
\title{Create distribution-type TOML file}
\usage{
create_distribution(filename, path, distribution)
}
\arguments{
\item{filename}{a \code{string} specifying the name of the toml file}

\item{path}{a \code{string} specifying the directory in which you want to
save the toml file; this will be automatically generated if it doesn't
already exist}

\item{distribution}{a \code{list} containing 3 named elements:
\itemize{
\item{name} - {a \code{string} specifying the name of the parameter}
\item{distribution} - {a \code{string} specifying the name of the distribution}
\item{parameters} - {a \code{list} specifying parameter values and associated
names}
}
If more than one distribution is required, they must be added as a list
(see Examples)}
}
\description{
Function to populate toml file with distribution type data, \emph{e.g.}
\itemize{
\item{Generate a single toml file containing a single distribution component}
\item{Generate a single toml file containing multiple distribution components}
\item{Generate a single toml file containing a single distribution component
and associated point-estimate components}
}
If a file already exists at the specified location, an error will be returned.
}
\examples{
filename <- "0.1.0.toml"
data_product_name <- "some/descriptive/name/latency-period"

# Write a single distribution into a toml file
dist <- list(name = "latency-period",
                  distribution = "gamma",
                  parameters = list(shape = 2.0, scale = 3.0))

create_distribution(filename = filename,
                                path = data_product_name,
                                distribution = dist)

file.remove(file.path(data_product_name, filename))

# Write multiple distributions into a toml file
dist1 <- list(name = "latency-period1",
                    distribution = "gamma",
                    parameters = list(shape = 2.0, scale = 3.0))
dist2 <- list(name = "latency-period2",
                    distribution = "gamma",
                    parameters = list(shape = 2.0, scale = 3.0))

create_distribution(filename = filename,
                               path = data_product_name,
                               distribution = list(dist1, dist2))

file.remove(file.path(data_product_name, filename))

# Write a single distribution with point-estimates into a toml file
dist <- list(name = "latency-period",
                  distribution = "gamma",
                  parameters = list(shape = 2.0, scale = 3.0))
estimate1 <- list(mean = 1.0)
estimate2 <- list(`standard-deviation` = 1.0)

create_distribution(filename = filename,
                               path = data_product_name,
                               distribution = list(dist, estimate1, estimate2))

file.remove(file.path(data_product_name, filename))

}
\seealso{
Other create functions: 
\code{\link{create_array}()},
\code{\link{create_estimate}()},
\code{\link{create_table}()},
\code{\link{create_version_number}()}
}
\concept{create functions}
