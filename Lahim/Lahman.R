#Oct 1 2020
#Ze Zheng

library(tidyverse)
library(Lahman)
library(stargazer)

data("Teams")
t18<-subset(Teams,yearID=="2018")

with(t18, plot(R,W))
w_reg<-lm(W~R,data=t18)
summary(w_reg)
0.16/0.82

stargazer(w_reg,type="text",report="vcst",
          omit.stat = c("ser","f"))
stargazer(w_reg,report="vcst",
          omit.stat = c("ser","f"))
