#'Making boxplot. you need a dataset made by valueswithleader()
#'
#'@param No parameter
#'
#'@return titleAbb+Boxplot
#'
#'@export
boxplotbyleader<-function(){
  for(jjj in 1:length(indextitle)){#1:PMJ,2:BOJ
    tmp<-dataset[,c(2,2+jjj)]
    colnames(tmp)[2]<-"Person"
    boxplotData<-melt(tmp,id="Person")
    boxplotData<-boxplotData[,-2]
    colnames(boxplotData)[1]<-"variable"
    boxplotData[,2]<-as.numeric(boxplotData[,2])
    assign(paste(titleAbb,"Boxplot",sep="")[jjj],boxplotData,env=.GlobalEnv)
    g<-ggplot(data=boxplotData,aes(x=variable,y=value))
    g<-g+geom_boxplot(lwd=1)
    g<-g+ggtitle(paste(colnames(dataset)[2],"\n",first(dataset[,1])," - ",last(dataset[,1]),",Source:",dataSource,sep=""))
    g<-g+theme(axis.text.x=element_text(size=15,face="plain",angle=90,hjust=1,vjust=0.5))
    g<-g+theme(axis.text.y=element_text(size=15,face="plain"))
    g<-g+theme(title      =element_text(size=15,face="plain"))
    g<-g+xlab("")+ylab("")+scale_y_continuous(labels=comma)
    print(g)
    boxplotData<<-boxplotData
  }
}
