corr <- function(directory, threshold = 0) {
  setwd(directory)
  id <- 1:332
  allFiles <- list.files(pattern = 'csv')
  corr <- vector()
  nitrates <- vector()
  sulfates <- vector()
  for (i in id){
    myFile <- allFiles[i]   
    data <- read.csv(myFile)
    good <- complete.cases(data)
    count <- nrow(data[good,])
    if (count >= threshold) {
      nitrates <- data[good,]$nitrate
      sulfates <- data[good,]$sulfate
      cor <- cor(nitrates, sulfates)
      corr <- c(corr, cor)
    }
  }
  setwd('..')
  corr
}
