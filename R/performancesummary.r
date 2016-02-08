#'Building data frame for performance summary by leaders
#'
#'@param No parameter
#'
#'@return titleAbb+Summary
#'
#'@export
performancesummary<-function(){
  for(jjj in 1:length(indextitle)){#1:PMJ,2:BOJ
    assign(
      paste(titleAbb,"Summary",sep="")[jjj],
      get(paste(titleAbb,"Boxplot",sep="")[jjj])%>%group_by(variable)%>%summarize(
        mean=mean(value),
        median=median(value),
        sd=sd(value),
        max=max(value),
        min=min(value),
        n=length(value),
        first=first(value),
        last=last(value),
        performance=round((last/first-1)*100,2)
      )
      ,env=.GlobalEnv
    )
    #cat(paste(titleAbb,"Summary",sep="")[jjj],"\n")
    #print(get(paste(titleAbb,"Summary",sep="")[jjj]))
  }
}
