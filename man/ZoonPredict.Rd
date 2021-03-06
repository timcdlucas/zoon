% Generated by roxygen2 (4.1.1.9000): do not edit by hand
% Please edit documentation in R/zoonPredict.R
\name{ZoonPredict}
\alias{ZoonPredict}
\title{ZoonPredict}
\usage{
ZoonPredict(zoonModel, newdata)
}
\arguments{
\item{zoonModel}{a \code{zoonModel} object}

\item{newdata}{a dataframe containing data to predict to.}
}
\description{
\strong{module developer tool:} Predict from a ZoonModel object
}
\details{
\strong{This function is only intended to be used when developing
new modules, not for running zoon workflows}.
Given a \code{zoonModel} object returned by a model
module using the function \code{ZoonModel}, make a prediction to
a new dataframe.
For an example, see the source code for the module \code{mgcv}.
}

