% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/new_coderun.R
\name{new_coderun}
\alias{new_coderun}
\title{Post entry to code_run table}
\usage{
new_coderun(
  run_date,
  description = "",
  code_repo_id = "",
  model_config = "",
  submission_script_id = "",
  inputs = list(),
  outputs = list(),
  key
)
}
\arguments{
\item{run_date}{the date-time of the code run \emph{e.g.} \code{Sys.time()} or
"2010-07-11 12:15:00 BST"}

\item{description}{(optional) a \code{string} containing a free text
description of the \code{code_run} \emph{e.g.} "Script run to upload and process
scottish coronavirus-covid-19-management-information"}

\item{code_repo_id}{(optional) \emph{e.g.} "https://data.scrc.uk/api/object/154/"}

\item{model_config}{(optional)}

\item{submission_script_id}{\emph{e.g.} "https://data.scrc.uk/api/object/153/"}

\item{inputs}{\emph{e.g.} list("https://data.scrc.uk/api/object_component/875/")}

\item{outputs}{\emph{e.g.} list("https://data.scrc.uk/api/object_component/875/")}

\item{key}{API token from data.scrc.uk}
}
\description{
Upload information to the \code{coderun} table in the data registry
}
\seealso{
Other new functions: 
\code{\link{new_author}()},
\code{\link{new_code_repo_release}()},
\code{\link{new_data_product}()},
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
