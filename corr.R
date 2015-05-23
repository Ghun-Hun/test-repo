source("complete.R")
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  count<-complete(directory,1:332)
  lcount<-vector()
  for(i in 1:332){
    if(count[,"nobs"][i]>=threshold){
      filename<-paste('./',directory,'/',formatC(i, width = 3, flag = '0'),'.csv',sep="")
      content<-read.csv(filename)
      rmnacontent<-subset(content,!(is.na(content["sulfate"]) | is.na(content["nitrate"])))
      scorr<-cor(rmnacontent["sulfate"],rmnacontent["nitrate"])
      lcount<-append(lcount,scorr)
    }
  }
  lcount
}
cr <- corr("specdata", 400)
head(cr)