# Ze Zheng
#Oct 8,2020
#Midterm Paper
#comparing y with csh_i, ccon and rtfpna

install.packages("tidyverse")
install.packages("pwt9")
install.packages("stargazer")
library(tidyverse)
library(stargazer)
library(pwt9)

data("pwt9.1")

y1995<-subset(pwt9.1,year=="2000") #Getting the data for the years 2000
impdata<-subset(y1995,select= c(rgdpe,csh_i,pop,delta,rtfpna))
impdata<-mutate(impdata, y=rgdpe/pop)#getting the standard of living
impdata<- na.omit(impdata) #removing n/a's

summary(impdata)

plot(impdata$delta,impdata$y,ylab = "Standard of Living",xlab = "Average Depreciation rate of the capital stock",main = "Figure 1")
abline(impdata$delta,impdata$y)

plot(impdata$csh_i,impdata$y,ylab = "Standard of Living",xlab = "Share of gross capital formation at current PPPs",main ="Figure 2")
abline(impdata$csh_i,impdata$y)

plot(impdata$rtfpna,impdata$y,ylab = "Standard of Living",xlab = "TFP at constant national prices",main = "Figure 3")
abline(impdata$rtfpna,impdata$y)

sd(impdata$y) #standard Deviation for standard of living
sd(impdata$csh_i) #standard Deviation for savings rate
sd(impdata$delta)#standard Deviation for real consumption

sd(impdata$rtfpna)#standard Deviation for technology


impdata<-lm(y~delta+csh_i+rtfpna,data=impdata)#multiple regression

summary(impdata)



qt(0.95,116)# The DF is 116  

stargazer(impdata, report = "vcs", type="text", omit.stat =c("ser", "f"))

stargazer(impdata, report="vcs", 
          omit.stat = c("ser", "f"),
          ci=TRUE, omit.table.layout = "n") # adding confidence interval, killing note

#stargazer(impdata[c(y, ccon, csh_i, rtfpna)], type="text",
         # title= "Discriptive Stats for Selected variables",digits =1)


#stargazer(impdata[column], type = "text",
  #summary.stat = c("min", "p25", "median", "p75", "max", "median", "sd"))


#stargazer(impdata)
#stargazer(impdata, type="text", report="vcst",omit.stat = c("ser", "f")
          # nice regression table in console window
          #,omit.table.layout = "n") # adding confidence interval, killing note
#stargazer(impdata[c("rgdpe", "csh_g", "ccon", "pl_c")],type="text", title= "table1",digit=1, out="table1.txt")

#summary(impdata)

            