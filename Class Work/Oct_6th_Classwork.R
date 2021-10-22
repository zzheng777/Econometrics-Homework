# Ze Zheng


# oct 6 2020
# Rick Eichhorn
# Following up on Oct 1 stuff, doing and reporting multiple reg results

library(tidyverse)
library(Lahman)
library(stargazer)
data("Teams")

t17_18<-subset(Teams, yearID=="2018"| yearID=="2017")

t17_18<-mutate(t17_18, wrat=W/L)
t17_18<-mutate(t17_18, rrat=R/RA)
with(t17_18, plot(rrat, wrat))
w_reg<-lm(wrat~rrat, data=t17_18)

stargazer(w_reg, type="text", report="vcst",
          omit.stat = c("ser", "f")) # nice regression table in console window

stargazer(w_reg, report="vcst",
          omit.stat = c("ser", "f")) # LaTeX code for same table

stargazer(w_reg, report="vcs", type="text",
          omit.stat = c("ser", "f"),
          ci=TRUE, omit.table.layout = "n") # adding confidence interval, killing note

# What else is in this data frame? Homeruns, and Homeruns Allowed
t17_18<-mutate(t17_18, hrat=HR/HRA)
w_mreg<-lm(wrat~rrat+hrat, data=t17_18)
stargazer(w_mreg, type="text", report="vcst",
          omit.stat = c("ser", "f")) # nice regression table in console window
stargazer(w_mreg, report="vcs", type="text",
          omit.stat = c("ser", "f"),
          ci=TRUE, omit.table.layout = "n") # adding confidence interval, killing note
cor<-subset(t17_18, select=c(49:51))
C=cor(cor)
library(corrplot)
# install.packages("corrplot")
# library(corrplot)
corrplot(C)
corrplot.mixed(C)