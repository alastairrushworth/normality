
normality <- function(values){
  if(!is.numeric(values)) stop("values must be a numeric vector")
  # these are function names with similar output
  fun_list  <- list(nortest::ad.test, moments::agostino.test, 
                    normtest::ajb.norm.test, nortest::cvm.test, 
                    normtest::frosini.norm.test, normtest::geary.norm.test, 
                    normtest::hegazy1.norm.test, normtest::jb.norm.test, 
                    moments::anscombe.test, moments::bonett.test,
                    nortest::lillie.test, nortest::pearson.test, stats::shapiro.test, 
                    nortest::sf.test, normtest::spiegelhalter.norm.test, normtest::wb.norm.test) 
  # capture method, p.value and statistic for each when applied to values
  norm_list <- lapply(fun_list, function(x)  suppressWarnings(try(lapply(list(values), x), silent = T))[[1]])
  norm_list <- lapply(norm_list, function(x) c(x$method, x$statistic[1], x$p.value))
  # perform the test from mhde - capture to avoid printing any output
  x         <- capture.output(mhd    <- mhde::mhde.test(values))
  # extract the method, p.value and statistic and add to norm_list
  norm_list[[length(norm_list) + 1]] <- c("Minimum Hellinger Distance normality test", mhd[[1]], mhd[[2]])
  # combine into a single tibble
  normal_df           <- as_tibble(do.call("rbind", norm_list))
  colnames(normal_df) <- c("Test", "statistic", "p.value")
  # convert cols 2 & 3 to numeric
  class(normal_df$statistic) <-  class(normal_df$p.value) <- "numeric"
  # return in alphabetical order
  normal_df <- normal_df[order(normal_df$Test), ]
  return(normal_df)
}