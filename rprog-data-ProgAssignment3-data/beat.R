best <- function(state, outcome) {
  ## Read outcome data
  ##outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outsolt <- read.csv("outcome-of-care-measures.csv")
  outsolt<-outsolt[,State=state]
  if(outcome=="heart attack"){
    out<-subset(outsolt,min(Hospital.30-Day.Death.Mortality.Rates.from.Heart.Attack),select=c(1:2))
  } else if(outcome=="heart failure"){
    out<-outcome[,order("Hospital.30-Day.Death.Mortality.Rates.from.Heart.Failure")]
  }else if(outcome=="pneumonia"){
    out<-outsolt[,order("Hospital.30-Day.Death.Mortality.Rates.from.Pneumonia")]
  }
  out
}
x<-best("TX", "heart attack")
## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death
## rate