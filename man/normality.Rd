\name{normality}
\alias{normality}
\title{normality: all standard univariate normality tests in a single wrapper.}
\usage{
normality(values)
}
\arguments{
\item{values}{A vector of values}
}
\value{
\item{}{A tibble containing the results of performing Cramer-von Mises, Shapiro-Francia, Pearson chi-square, Kolmogorov-Smirnov, Anderson-Darling, Shapiro-Wilk test.}
\description{
The package is just a simple wrapper to the \code{nor.test}, \code{stats} and \code{mhde} packages where these functions are implemented.
}
\examples{
# not run:
values <- rnorm(100)
normality(values)
}