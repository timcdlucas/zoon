% Generated by roxygen2 (4.0.1): do not edit by hand
\name{BuildModule}
\alias{BuildModule}
\title{Turn a function in the namespace into a module.
Will later add functions to upload module to figshare etc.
And add testing that the module name is unique.}
\usage{
BuildModule(object, type, dir = ".")
}
\arguments{
\item{object}{A function that will be made into a module file.}

\item{dir}{The directory to put the module into (defaults to the
working directory.}

\item{type}{A string that defines the type of module. Possible module types
     are occurence, covariate, process, model, diagnostic and output.}
}
\value{
NULL. Outputs a file
}
\description{
Turn a function in the namespace into a module.
Will later add functions to upload module to figshare etc.
And add testing that the module name is unique.
}
\examples{
# Define some module function
NewModule <- function(extent){
  covs <- as.data.frame(df[, 5:ncol(df)])
  names(covs) <- names(df)[5:ncol(df)]
  m <- glm(df$value ~ .,
        data = covs,
        family = binomial)

  return (m)
}

# Then build it into a module file.
BuildModule(NewModule, type = 'process', dir='~/Desktop')
}
