# Name: Oliver De Sa
# SciNet username: tmp_odesa
# Description:
#   R script that receives arg from command line indicating # datapoints to
# include in each batch of birds, prints out number, 

source('C:/Users/Oliver/MSC1090/assignment5/Circle.Utilities.R')
library(EnvStats)

args <- commandArgs(trailingOnly = TRUE)

if (length(args) != 1){
  cat('Please input only 1 argument', '\n')
  stop()
} else if (is.na(as.numeric(args))){
  cat('Please input a numeric argument', '\n')
  stop()
} else {
  cat('There are', args, 'datapoints included in each batch of measured birds',
      '\n')
  args <- as.numeric(args)
  
  #C
  my.data <- rtri(args, 0.5 * pi, 1.5 * pi, mode = pi)
  
  # D
  Null.Samples <- sim.null.hypo(args, 10000)
  
  # E
  Cumulative.DF <- calc.cdf(Null.Samples)
  
  # F
  test.max <- max.angular.diff(my.data)
  P.value <- calc.cumulative(Cumulative.DF, test.max)
  
  if (P.value >= 0.95){
    cat('This test is significant with a p value of', 1 - P.value)
  } else if (P.value < 0.95){
    cat('This test is insignificant with a p value of', 1 - P.value)
  }
}


