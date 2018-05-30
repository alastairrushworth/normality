\name{normality}
\alias{normality}
\title{normality: 17 standard univariate normality tests in a single wrapper.}
\usage{
normality(values)
}
\arguments{
\item{values}{A vector of values}
}
\value{
\item{}{A tibble containing the results of performing Adjusted Jarque-Bera, Anderson-Darling, Anscombe-Glynn, Bonett-Seier, Bonett-Seier, D'Agostino skewness, Frosini, Geary, Hegazy-Green, Jarque-Bera, Lilliefors, Minimum Hellinger Distance, Pearson chi-square, Shapiro-Francia, Shapiro-Wilk, Spiegelhalter, Weisberg-Bingham tests.}
\description{
The package is just a simple wrapper to the \code{moments}, \code{normtest}, \code{nortest}, \code{stats} and \code{mhde} packages where these functions are implemented.
}
\examples{
# not run:
values <- rnorm(100)
normality(values)
}