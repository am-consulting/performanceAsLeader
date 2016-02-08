#'Get Japanese Government Bond Interest Rates
#'
#'@param year(year=99:get all data.default year=10)
#'
#'@return jgbData preData
#'
#'@export
jgb<-function(year=10){
  dataSource<<-"Ministry of Finance Japan"
  jgbURL<-c(
    #Source Ministry of Finance Japan
   "http://www.mof.go.jp/english/jgbs/reference/interest_rate/historical/jgbcme_all.csv",
   "http://www.mof.go.jp/english/jgbs/reference/interest_rate/jgbcme.csv"
  )
  historicalData<-read.csv(jgbURL[1],header=T,skip=1,stringsAsFactor=F,check.names=F)
  currentData   <-read.csv(jgbURL[2],header=T,skip=1,stringsAsFactor=F,check.names=F)
  buf<-colnames(historicalData)==colnames(currentData)
  if(length(buf[buf==F])==0){
    tmp<-rbind(historicalData,currentData)
    tmp[,1]<-as.Date(tmp[,1])
    FUN.1<-function(x){as.numeric(x)}
    jgbData<-data.frame(tmp[1],apply(tmp[-1],2,FUN.1),check.names=F)
    colnames(jgbData)[-1]<-paste("JapaneseGovernmentBond.",colnames(jgbData)[-1],sep="")
    if(year!=99){
      jgbData<-jgbData[,c(1,grep(paste(".",year,"Y",sep=""),colnames(jgbData)))]
    }
    jgbData<<-jgbData
    preData<<-jgbData
    #print(head(jgbData));print(tail(jgbData))
  }else{cat("Some sort of change in source data.")}
}
