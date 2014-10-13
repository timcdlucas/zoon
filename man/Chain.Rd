% Generated by roxygen2 (4.0.1): do not edit by hand
\name{Chain}
\alias{Chain}
\title{Chain}
\usage{
Chain(...)
}
\arguments{
\item{...}{List of modules to be chained.}
}
\description{
This function does nothing. However using Chain(modules... ) in a call
 to workflow will chain the modules together rather than
 run in separate analyses. For occurrence or covariate modules the datasets are joined.
 Processes are run sequentially.
}
