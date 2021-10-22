library(tidyverse)
library(stargazer)
library(pwt9)

install.packages("Lahman")
library(Lahman)

install.packages("wooldridge")
library(wooldridge)

rm(list = ls())
gs<-read_csv("HS2.csv")
gs
with(gs, plot(Week,`Hand Sanitizer`,main="Hand Sanitizer Google Searches"))
reb<-lm(gs$`Hand Sanitizer`~gs$Week)
abline(reb, lwd=3) # for a line thats thiccc
stargazer(reb)
stargazer(reb, type="text")
stargazer(reb, type="text", omit.stat = c("ser", "f"))
gs