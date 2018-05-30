# normality
17 standard normality tests in a single wrapper.

__Installation__ 

```r
devtools::install_github("alastairrushworth/normality", dependencies = T)
```

__Usage__

Generate some normal data and perform the normality tests.

```r
library(normality)

set.seed(2019)
normality(rnorm(100))
# A tibble: 17 x 3
   Test                                           statistic p.value
   <chr>                                              <dbl>   <dbl>
 1 Adjusted Jarque-Bera test for normality           2.81     0.188
 2 Anderson-Darling normality test                   0.445    0.278
 3 Anscombe-Glynn kurtosis test                      3.33     0.333
 4 Bonett-Seier test for Geary kurtosis              0.707    0.536
 5 Cramer-von Mises normality test                   0.0819   0.194
 6 D'Agostino skewness test                          0.342    0.146
 7 Frosini test for normality                        0.212    0.263
 8 Geary test for normality                          0.785    0.772
 9 Hegazy-Green test for normality                   0.0874   0.311
10 Jarque-Bera test for normality                    2.41     0.210
11 Lilliefors (Kolmogorov-Smirnov) normality test    0.0779   0.143
12 Minimum Hellinger Distance normality test         0.0776   0.466
13 Pearson chi-square normality test                 9.98     0.442
14 Shapiro-Francia normality test                    0.986    0.303
15 Shapiro-Wilk normality test                       0.987    0.427
16 Spiegelhalter test for normality                  1.27     0.233
17 Weisberg-Bingham test for normality               0.986    0.292
```

