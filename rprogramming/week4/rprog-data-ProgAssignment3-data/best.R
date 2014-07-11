best <- function(state, outcome) {
  ## Read outcome data
  file <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available")
  states <- file$State
  conditions <- c('heart attack', 'heart failure', 'pneumonia')
  ## Check that state and outcome are valid
  if (!any(states==state)) {stop('invalid state')}
  if (!any(conditions==outcome)){stop('invalid outcome')}
  ## Return hospital name in that state with lowest 30-day death rate
  if (outcome == 'heart attack'){col = 11}
  if (outcome == 'heart failure'){col = 17}
  if (outcome == 'pneumonia'){col = 23}
  file1 <- file[file$State==state, c(2,col)]
  file2 <- na.omit(file1)
  file3 <- file2[order(as.numeric(file2[,2]),file2[1]),]
  file3[1,1]
}

