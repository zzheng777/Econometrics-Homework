#Student 23 Ze Zheng
#Oct 13 2020
#Doing F- Test

library(tidyverse)
library(Lahman)
library(stargazer)
data("Teams")

rm(list = ls())

t00<-subset(Teams,yearID=="2000")
t00<-mutate(t00, lwrat=log(W/L))
t00<-mutate(t00, lrrat=log(R/RA))
t00<-mutate(t00, lr=log(R))
t00<-mutate(t00, lra=log(RA))
view(t00)
Ureg<-lm(lwrat~lr+lra,data=t00)
Rreg<-lm(lwrat~lrrat,data=t00)              

ssru<-sum(resid(Ureg)^2)
ssrr<-sum(resid(Rreg)^2)

# Making the F-stat for the James Hypothesis
f<-((ssrr-ssru)/1)/(ssru/(30-3))
# Looking up the Critical F-Stat (1-alpha, num dof, den dof)
qf(.95,1,27)
# Let's take a look at these side-by-side
stargazer(Ureg, Rreg, type="text")

