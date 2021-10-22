#Ze Zheng
#Final Paper 

rm(list=ls())
install.packages("tidyverse")
install.packages("stargazer")
install.packages("writexl")

library(writexl)
library(tidyverse)
library(stargazer)
library(readxl)
library(tidyr)
library(dplyr)


EconMC<-read_excel("EconMC.xlsx")
EconMC<- na.omit(EconMC) 
summary(EconMC)

sd(EconMC$`Family Unity`)
sd(EconMC$`Community Health`)
sd(EconMC$`Institutional Health`)
sd(EconMC$`County-Level Index`)
sd(EconMC$assn2014)
sd(EconMC$pvote2012)
sd(EconMC$respn2010)
sd(EconMC$sk2014)
sd(EconMC$Density)
sd(EconMC$`% 65+`)

# Making the Wide Data to Long Data
oldD_wide<- read_excel("CleanedWide.xlsx") 
oldD_wide$subject <-factor(oldD_wide$subject)
data_long <-gather(oldD_wide,Date,Counts,1-22-2020:4-30-2020, factor_key = TRUE)

#Finding the First Occurance of the Data according to the date


days2<-data_long %>%
  filter(Counts > 0) %>%
  group_by(FIPS) %>%
  slice(1L)

write_xlsx(days2,"Book5.xlsx")

  


