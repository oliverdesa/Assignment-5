
# Name: Oliver De Sa
# SciNet username: tmp_odesa
# Description:
#   Functions to be used for assignment 5


# Function takes a vector of angles, sorts the vector into increasing order
# then takes the difference of (angle n+1 - angle n), returning this value as a vector

max.angular.diff<- function(angles) {
  sorted.angles <- sort(angles, decreasing = FALSE)
  angle_diff <- rep(0, length(sorted.angles))
  for (i in 1:length(sorted.angles)) {
    if (i+1 > length(sorted.angles)){
      angle_diff[i] <- 2*pi - (sorted.angles[i] - sorted.angles[1])
    }else if (i+1 <= length(sorted.angles)) {
      angle_diff[i] <- (sorted.angles[i+1] - sorted.angles[i])
    }
  }
  return(max(angle_diff))
}

sim.null.hypo <- function(k, n) {
  samples <- rep(0, n)
  for (sample in 1:length(samples)){
    samples[sample] <- list(runif(k, min=0, max=2*pi))
  }
  sample.angle.diffs <- sapply(samples, max.angular.diff)
  return(sample.angle.diffs)
}









