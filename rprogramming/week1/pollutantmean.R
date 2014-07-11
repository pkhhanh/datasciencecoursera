pollutantmean <- function(directory, pollutant, id = 1:332) {
  setwd(directory)
  myFiles <- list.files(pattern = 'csv')
  myFiles <- myFiles[id]
  myData <- data.frame()
  for (filename in myFiles){
    myData <- rbind(myData, read.csv(filename))
  }
  x <- mean(myData[,pollutant], na.rm = TRUE)
  
  setwd('..')
  x
}

