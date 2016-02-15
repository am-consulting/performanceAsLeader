#'Compare performance between Liberal Democratic Party of Japan and Democratic Party of Japan
#'
#'@param No parameter
#'
#'@return dpj ldp compareData timeSeries
#'
#'@encoding UTF-8
#'
#'@export
ldpvsdpj<-function(dataSource=""){
if(exists("dataset")==F){valueswithleader()}
tmp<-dataset
dpj<-subset(tmp,as.Date("2009-09-16")<=tmp[,1] & as.Date("2012-12-25")>=tmp[,1])
ldp<-subset(tmp,as.Date("2012-12-26")<=tmp[,1])
#dbp:MINSHUTOU , ldp:JIMINTOU
performance<<-function(x){(last(x)/first(x)-1)*100}
functionList<-list("length","mean","median","max","min","sd","first","last","performance")
tmp<-sapply(functionList,get)
FUNdpj<-function(x){x(dpj[,2])}#MINSHUTOU
FUNldp<-function(x){x(ldp[,2])}#JIMINTOU
compareData<-data.frame(sapply(tmp,FUNdpj),sapply(tmp,FUNldp),row.names=unlist(functionList),check.names=F)
colnames(compareData)<-c("Democratic Party of Japan","Liberal Democratic Party of Japan")
compareData<-format(compareData,scientific=F)
compareData<<-compareData
tmp1<-data.frame(dpj,color=c(rep("red",length.out=nrow(dpj)-1),"blue"),check.names=F)
tmp2<-data.frame(ldp,color="blue",check.names=F)
tmp<-rbind(tmp1,tmp2)
eventDate<-c(
  "2011-3-11",
  "2012-11-14",
  "2012-12-26",
  "2013-4-4",
  "2014-4-1",
  "2014-10-31",
  "2016-1-29"
  )
event<-c(
  "Tohoku earthquake\nand tsunami",
  "Question-time debate\nbetween Noda(PM) vs Abe",
  "Change of government",
  "1st bazooka\nfired by KURODA",
  "Consumption tax\nfrom 5% to 8%",
  "2nd bazooka\nfired by KURODA",
  "BOJ adapts\nnegative interest rates"
  )
#eventPosition<-head(rep(c(max(tmp[,2]),mean(tmp[,2]),min(tmp[,2])),ceiling(length(eventDate)/3)),length(eventDate))
eventPosition<-head(rep(c(quantile(tmp[,2])[4],quantile(tmp[,2])[3],quantile(tmp[,2])[2]),ceiling(length(eventDate)/3)),length(eventDate))
#for ggplot
tmp<<-tmp
event<<-event
eventDate<<-eventDate
eventPosition<<-eventPosition
#for ggplot
g<-ggplot()
if(nrow(tmp%>%filter(tmp[,2]<0))==0 | nrow(tmp%>%filter(tmp[,2]>=0))==0){
g<-g+geom_line(data=tmp,aes(x=tmp[,1],y=tmp[,2]),color=tmp[,5])
}else{
g<-g+geom_bar(data=tmp,aes(x=tmp[,1],y=tmp[,2]),stat="identity",position="identity",fill=tmp[,5],width=5,col=tmp[,5],alpha=0.3)
}
g<-g+geom_vline(xintercept=as.numeric(as.Date(eventDate)),color="dimgray")
g<-g+geom_text(aes(x=as.Date(eventDate),y=eventPosition,label=paste(eventDate,"\n",event)),vjust=0,hjust=1,size=3)
g<-g+ggtitle(paste(colnames(tmp)[2],"\nRed:MINSHUTOU , BLUE:JIMINTOU\nSource:",dataSource,sep=""))
g<-g+theme(axis.text.x=element_text(size=15,face="plain",angle=0,hjust=1,vjust=0.5))
g<-g+theme(axis.text.y=element_text(size=15,face="plain"))
g<-g+theme(title      =element_text(size=15,face="plain"))
g<-g+xlab("")+ylab("")+scale_y_continuous(labels=comma)+scale_x_date(labels=date_format("%Y-%m"))
print(g)
timeSeries<<-tmp[,-5]
}
