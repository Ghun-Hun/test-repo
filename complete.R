complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  sumcount<-data.frame(id=1:length(id),nobs=1:length(id))
  j=1
  for(i in id){
    filename<-paste('./',directory,'/',formatC(i, width = 3, flag = '0'),'.csv',sep="")
    content<-read.csv(filename)
    rmnacontent<-subset(content,!(is.na(content["sulfate"]) | is.na(content["nitrate"])))
    sumcount$id[j]<-i
    sumcount$nobs[j]<-nrow(rmnacontent)
    j=j+1
  }
  ##print(class(sumcount))
  print(sumcount)
  ##sumcount.colname <- c("id", "nobs")
  ##sumcount<-sumcount[-1,]
  ##ff<-as.data.frame.noquote(sumcount)
  ##ff
  
}
x<-complete("specdata",30:25)
complete("specdata", c(2, 4, 8, 10, 12))