rankall <- function(outcome, num = "best") {
  ## Read outcome data
  cklist<-function(nums,solt,outcomes){
    ck<-solt[,outcomes]=="Not Available"
    minvalue<-as.numeric(solt[,outcomes][!ck])
    ##print(length(minvalue))
    minhosp<-solt[,'Hospital.Name'][!ck]
    ##print(length(minhosp))
    minmat<-cbind(minvalue,minhosp)
    minorder<-order(minvalue,minhosp)
    ##print(length(minorder))
    if(minorder!=1){
    minlist<-minmat[minorder,]
    }else {
    minlist<-minmat
    }
    #print(minlist)
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
  statelist<-unique(outsolt[,'State'])
  stateorder<-order(statelist)
  statelist<-statelist[stateorder]
  ou<-data.frame(1:length(statelist),1:length(statelist))
  colnames(ou)<-c("hospital","state")
  j=1
  for(i in statelist){
    outss<-subset(outsolt,(outsolt[,'State']==i))
  if(outcome=="heart attack"){
    out<-cklist(num,outss,'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack')
  } else if(outcome=="heart failure"){
    out<-cklist(num,outss,'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure')
  }else if(outcome=="pneumonia"){
    out<-cklist(num,outss,'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia')
  }else{
    stop("invalid outcome")
  }
  ou[j,1]<-out
  ou[j,2]<-i
  j=j+1
  }
  ou
}
## Check that state and outcome are valid
## For each state, find the hospital of the given rank
## Return a data frame with the hospital names and the
## (abbreviated) state name