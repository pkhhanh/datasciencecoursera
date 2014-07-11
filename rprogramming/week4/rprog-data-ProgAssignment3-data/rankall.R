rankall <- function(outcome, num = "best") {
  ## Read outcome data
  file <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available")
  states <- file$State
  conditions <- c('heart attack', 'heart failure', 'pneumonia')
  ## Check that state and outcome are valid
  if (!any(conditions==outcome)){stop('invalid outcome')}
  ## For each state, find the hospital of the given rank
  if (outcome == 'heart attack'){col = 11}
  if (outcome == 'heart failure'){col = 17}
  if (outcome == 'pneumonia'){col = 23}
  file1 <- file[c(7,2,col)]
  file2 <- na.omit(file1)
  file3 <- file2[order(file2[1],as.numeric(file2[,3]),file2[2]),]
  s <- split(file3, file3$State)
  
  hospital <- lapply(s, function(x) 
    {if (num == 'best'){x[1,2]}
    else if (num == 'worst'){x[nrow(x),2]}
    else {if (num > nrow(x)) {NA} 
          else {x[num,2]}}})

  ## Returnnum - a data frame with the hospital names and the
  ## (abbreviated) state name
  state <- lapply(s, function(x) x[1,1])  
  df <- as.data.frame(cbind(hospital))
  df2 <- as.data.frame(cbind(state))
  result <- as.data.frame(cbind(hospital, state))
}