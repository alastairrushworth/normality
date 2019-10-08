#' Normality: 17 standard univariate normality tests in a single wrapper.
#' @details The package is just a simple wrapper to the \code{moments}, \code{normtest}, \code{nortest}, \code{stats} and \code{mhde} packages where these functions are implemented.
#' @param values A numerical vector of values
#' @return  A tibble containing the results of performing the following normality tests:
#' \itemize{
#' \item Adjusted Jarque-Bera
#' \item Anderson-Darling
#' \item Anscombe-Glynn
#' \item Bonett-Seier
#' \item D'Agostino skewness
#' \item Frosini
#' \item Geary
#' \item Hegazy-Green
#' \item Jarque-Bera
#' \item Lilliefors
#' \item Minimum Hellinger Distance
#' \item Pearson chi-square
#' \item Shapiro-Francia
#' \item Shapiro-Wilk
#' \item Spiegelhalter
#' \item Weisberg-Bingham
#' }
#' @examples
#' # Test normal random deviates:
#' values <- rnorm(100)
#' normality(values)
#' @export
#' @importFrom tibble as_tibble
#' @author Alastair Rushworth

normality <- function(values){
  if(!is.numeric(values)) stop("values must be a numeric vector")
  # these are function names with similar output
  fun_list  <- list(nortest::ad.test, 
                    moments::agostino.test, 
                    normtest::ajb.norm.test, 
                    nortest::cvm.test, 
                    normtest::frosini.norm.test, 
                    normtest::geary.norm.test, 
                    normtest::hegazy1.norm.test, 
                    normtest::jb.norm.test, 
                    moments::anscombe.test, 
                    moments::bonett.test,
                    nortest::lillie.test, 
                    nortest::pearson.test, 
                    stats::shapiro.test, 
                    nortest::sf.test, 
                    normtest::spiegelhalter.norm.test, 
                    normtest::wb.norm.test) 
  # capture method, p.value and statistic for each when applied to values
  norm_list <- lapply(fun_list, function(x)  suppressWarnings(try(lapply(list(values), x), silent = T))[[1]])
  norm_list <- lapply(norm_list, function(x) c(x$method, x$statistic[1], x$p.value))
  # perform the test from mhde - capture to avoid printing any output
  x         <- capture.output(mhd    <- mhde.test(values))
  # extract the method, p.value and statistic and add to norm_list
  norm_list[[length(norm_list) + 1]] <- c("Minimum Hellinger Distance normality test", mhd[[1]], mhd[[2]])
  # combine into a single tibble
  normal_df           <- as_tibble(do.call("rbind", norm_list), .name_repair = make.names)
  colnames(normal_df) <- c("Test", "statistic", "p.value")
  # convert cols 2 & 3 to numeric
  class(normal_df$statistic) <-  class(normal_df$p.value) <- "numeric"
  # return in alphabetical order
  normal_df <- normal_df[order(normal_df$Test), ]
  return(normal_df)
}