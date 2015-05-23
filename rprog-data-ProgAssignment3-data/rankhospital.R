rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Read outcome data
  ##outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  cklist<-function(nums,solt,outcomes){
    ck<-solt[,outcomes]=="Not Available"
    minvalue<-as.numeric(solt[,outcomes][!ck])
    ##print(length(minvalue))
    minhosp<-solt[,'Hospital.Name'][!ck]
    ##print(length(minhosp))
    minmat<-cbind(minvalue,minhosp)
    minorder<-order(minvalue,minhosp)
    ##print(length(minorder))
    minlist<-minmat[minorder,]
    if(nums=="best"){
      outs<-minlist[1,2]
    }else if(nums=="worst"){
      outs<-minlist[length(minvalue),2]
    }else if(is.numeric(nums)){
      if(nums>length(minvalue)){
        outs<-"NA"
      }else{
      outs<-minlist[nums,2]
      }
    }
    outs
  }
  outsolt <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  outsolt<-subset(outsolt,(outsolt[,'State']==state))
  if(nrow(outsolt)==0){
    stop("invalid state")
  }
  if(outcome=="heart attack"){
    out<-cklist(num,outsolt,'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack')
  } else if(outcome=="heart failure"){
    out<-cklist(num,outsolt,'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure')
  }else if(outcome=="pneumonia"){
    out<-cklist(num,outsolt,'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia')
  }else{
    stop("invalid outcome")
  }
  out
}
## Check that state and outcome are valid
## Return hospital name in that state with the given rank
## 30-day death rate