#'Building timeseries data with leaders
#'
#'@param target=target column , dd=day(99:end of month,999:middle of month,9999:as is,other:specific day
#'
#'@return dataset
#'
#'@export
valueswithleader<-function(target=2,dd=9999){
  FUN<-function(x){
    get(titleAbb[jjj])[which(get(titleAbb[jjj])[1]<=x & get(titleAbb[jjj])[2]>=x,arr.ind=F),3]
  }
  dataset<-na.omit(preData[,c(1,target)])
  dataset[,1]<-as.Date(dataset[,1])
  if(dd==999){#middle of month
    dataset[,1]<-as.Date(paste(year(dataset[,1]),"-",month(dataset[,1]),"-",floor(days_in_month(dataset[,1])/2),sep=""))
  }else if(dd==99){#end of month
    dataset[,1]<-dataset[,1]%m+%months(1)-1
  }else if(dd!=9999){#specific day
    dataset[,1]<-as.Date(paste(year(dataset[,1]),"-",month(dataset[,1]),"-",dd,sep=""))
  }
  subset(dataset,borderDate<=dataset[,1])
  for(jjj in 1:length(indextitle)){
    dataset<-data.frame(dataset,apply(dataset[1],1,FUN),check.names=F)
  }
  colnames(dataset)[3:4]<-indextitle
  #print(head(dataset));print(tail(dataset))
  dataset<<-dataset
}
