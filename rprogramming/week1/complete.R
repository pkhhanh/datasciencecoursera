complete <- function(directory, id = 1:332) {
  setwd(directory)
  allFiles <- list.files(pattern = 'csv')
  #myFiles <- allFiles[id]
  myIds <- vector()
  complete_count <- vector()
  for (i in id){
    myFile <- allFiles[i]   
    data <- read.csv(myFile)
    good <- complete.cases(data)
    myIds <- c(myIds, i)
    count <- nrow(data[good,])
    complete_count<- c(complete_count, count)
  }
  setwd('..')
  data.frame(id=myIds, nobs=complete_count)
}