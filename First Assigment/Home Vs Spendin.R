# Sep 22 2020
# Ze Zheng
# Packages, Google Trends, Regressions

library(tidyverse)
library(stargazer)
library(pwt9)
library(ggplot2)


install.packages("Lahman")
library(Lahman)

install.packages("wooldridge")
library(wooldridge)

rm(list = ls())
ai<-read_csv("AI.csv")
with(ai, plot(ai$`Clothing Searches`,ai$CPIAUCSL,main="Home Improvment Searches Vs Comsumer Spending", xlab = "Home Improvement Searches", ylab= "PCE"))
reg<-lm(ai$CPIAUCSL~ai$`Clothing Searches`)
abline(reg, lwd=3) # for a line thats thiccc
stargazer(reg)
stargazer(reg, type="text")
stargazer(reg, type="text", omit.stat = c("ser", "f"))
gt