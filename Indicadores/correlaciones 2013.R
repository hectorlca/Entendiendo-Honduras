### Load Libraries ###

library(plyr)
library(dplyr)
library(Hmisc)
library(sandwich)
library(corrplot)

### Load Data ###
dat <- read.csv("Indicadores/Censo 2013/hogares.csv")
dat$MUNICIPIO <- NULL

dat <- as.matrix(dat)

### Statistics ###



datcorrs <- cor(dat)
corrplot(dat, method = "circle")

corrplot(datcorrs, method="shade",shade.col=NA, tl.col="black", tl.srt=45)
