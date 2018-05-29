
normality <- function(values){
  # perform the tests from nor.test & stats
  nor_tests <-  list(cvm.test(values), sf.test(values), pearson.test(values), 
                     lillie.test(values), ad.test(values), shapiro.test(values))
  # perform the test from mhde - capture to avoid printing any output
  x         <- capture.output(mhd  <- mhde.test(values))
  
  # combine outputs into a single list
  normal_test <- list()
  # get stat and p-values from nor.tests
  for(i in 1:6) normal_test[[i]] <- c(nor_tests[[i]]$method, nor_tests[[i]]$statistic, nor_tests[[i]]$p.value)
  # get stat and p-values from shp test
  shp              <- shapiro.test(values)
  normal_test[[7]] <- c("Minimum Hellinger Distance normality test", shp[[1]], shp[[2]])
  # combine into a single tibble
  normal_df           <- as.tibble(do.call("rbind", normal_test))
  colnames(normal_df) <- c("Test", "Statistic", "p.value")
  # convert cols 2 & 3 to numeric
  class(normal_df$Statistic) <-  class(normal_df$p.value) <- "numeric"
  return(normal_df)
}
    