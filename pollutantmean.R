pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ##sumcontent<-vector("list",length(id))
  sumcontent<-vector()
  j=1
  for(i in id){
    filename<-paste('./',directory,'/',formatC(i, width = 3, flag = '0'),'.csv',sep="")
    content<-read.csv(filename)
    na<-is.na(content[pollutant])
    rmnacontent<-content[pollutant][!na]
    print(length(rmnacontent))
    ##sumcontent[j]<-list(rmnacontent)
    print(rmnacontent)
    sumcontent<-append(sumcontent,rmnacontent)
    j=j+1
  }
  ##avg<-sapply(sumcontent,mean)
  avg<-mean(sumcontent)
  avg

  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
}
x<-pollutantmean("specdata","sulfate",1:2)

