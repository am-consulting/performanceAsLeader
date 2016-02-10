#'Get timeseries data from fred etc.
#'
#'@param no=1 NIKKEI225 , no=2 DEXJPUS , no=3 JPNASSETS
#'
#'@return preData you can make your data as preData
#'
#'@export
getindex<-function(no=1){
  dataSource<<-"FRED"
  #Source Federal Reserve Bank of St. Louis
  preData<-na.omit(getSymbols(Symbols=indexes[no],src=dataSource,auto.assign=F))
  preData<-data.frame(Date=index(preData),preData[,1],row.names=NULL,check.names=F)
  colnames(preData)[2]<-indexes[no]
  no<<-no
  #print(head(preData));print(tail(preData))
  preData<<-preData
}
