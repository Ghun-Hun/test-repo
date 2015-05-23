best <- function(state, outcome) {
  ## Read outcome data
  ##outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outsolt <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  outsolt<-subset(outsolt,(outsolt[,'State']==state))
  if(nrow(outsolt)==0){
    stop("invalid state")
  }
  if(outcome=="heart attack"){
    ck<-outsolt[,'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack']=="Not Available"
    minvalue=min(as.numeric(outsolt[,'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'][!ck]))
    minck<-outsolt[,'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack']==minvalue
    out<-outsolt[,'Hospital.Name'][minck]
  } else if(outcome=="heart failure"){
    ck<-outsolt[,'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure']=="Not Available"
    minvalue=min(as.numeric(outsolt[,'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure'][!ck]))
    minck<-outsolt[,'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure']==minvalue
    out<-outsolt[,'Hospital.Name'][minck]
  }else if(outcome=="pneumonia"){
    ck<-outsolt[,'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia']=="Not Available"
    minvalue=min(as.numeric(outsolt[,'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia'][!ck]))
    minck<-outsolt[,'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia']==minvalue
    out<-outsolt[,'Hospital.Name'][minck]
  }else{
    stop("invalid outcome")
  }
  as.character(out)
}
x<-best("TX", "heart attack")
## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death
## rate