## ----message=F,error=F,warning=F,results='asis'--------------------------
library(performanceAsLeader)
knitr::kable(head(pmoj))
knitr::kable(tail(pmoj))
knitr::kable(head(goboj))
knitr::kable(tail(goboj))

## ----message=F,error=F,warning=F,results='asis'--------------------------
jgb(year=10)
knitr::kable(head(jgbData))
knitr::kable(tail(jgbData))

## ----message=F,error=F,warning=F,results='asis'--------------------------
jgb(year=40)
knitr::kable(head(jgbData))
knitr::kable(tail(jgbData))

## ----message=F,error=F,warning=F,results='asis'--------------------------
getindex(1)
knitr::kable(head(preData))
knitr::kable(tail(preData))

## ----message=F,error=F,warning=F,results='asis'--------------------------
getindex(3)
knitr::kable(head(preData))
knitr::kable(tail(preData))

## ----message=F,error=F,warning=F,results='asis'--------------------------
valueswithleader(target = 2,dd = 5)
knitr::kable(head(dataset))
knitr::kable(tail(dataset))

## ----message=F,error=F,warning=F,results='asis'--------------------------
valueswithleader(target = 2,dd = 99)
knitr::kable(head(dataset))
knitr::kable(tail(dataset))

## ----message=F,error=F,warning=F,results='asis'--------------------------
valueswithleader(target = 2,dd = 999)
knitr::kable(head(dataset))
knitr::kable(tail(dataset))

## ----message=F,error=F,warning=F,results='asis'--------------------------
valueswithleader()
knitr::kable(head(dataset))
knitr::kable(tail(dataset))

## ----message=F,error=F,warning=F,results='asis',fig.width=10,fig.height=10----
boxplotbyleader()
knitr::kable(head(boxplotData))
knitr::kable(tail(boxplotData))

## ----message=F,error=F,warning=F,results='asis'--------------------------
#performance(%)=(last/first-1)*100
performancesummary()
knitr::kable(tail(pmojSummary))
knitr::kable(tail(gobojSummary))

