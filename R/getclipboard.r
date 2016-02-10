#'Get clip board data
#'
#'@param No parameter
#'
#'@return preData
#'
#'@encoding UTF-8
#'
#'@export
getclipboard<-function(){
  tmp<-read.table("clipboard",header=TRUE,sep="\t",stringsAsFactors=F,na.strings=c("NA","-"),check.names=FALSE)
  tmp[,1]<-as.Date(tmp[,1])
  preData<-tmp
  print(head(preData,3))
  print(tail(preData,3))
  preData<<-preData
}
