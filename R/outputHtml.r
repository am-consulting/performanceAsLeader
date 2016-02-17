#'Output data frame as html table
#'
#'@param No parameter
#'
#'@return htmldata
#'
#'@encoding UTF-8
#'
#'@export
outputHtml<-function(dataframe=compareData){
username<-Sys.info()['user']
pathOutput<-paste("C:/Users/",username,"/Desktop/",sep="")
setwd(pathOutput)
htmlFile<-paste(Sys.Date(),"_",runif(1,10000000,99999999)*10,"_performanceAsLeader.html",sep="")
cat("",file=htmlFile,append=F)
print(xtable(dataframe),type="html",file=htmlFile,append=T)
}
