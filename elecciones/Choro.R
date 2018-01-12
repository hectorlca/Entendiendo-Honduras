### Load Libraries

library(plyr)
library(dplyr)
library(tigris)
library(maptools)
library(sp)
library(ggplot2)
library(ggmap)
library(rgdal)
library(sf)
library(choroplethr)

mapcolors <- read.csv("elecciones/mapcolors.csv", stringsAsFactors = FALSE)

### Import shapefile
hn <- readShapePoly (fn="elecciones/HND_adm1", 
                     proj4string=CRS("+proj=longlat +datum=WGS84") )


#Get data out
hn.dat <- as.data.frame(hn)

######

winner27map <- sp:: plot(hn, col = mapcolors$winner27, lwd = 0.05)

winner29map <- sp:: plot(hn, col = mapcolors$winner29, lwd = 0.05)

winner30map <- sp:: plot(hn, col = mapcolors$winner30, lwd = 0.05)

winnerpnmap <- sp:: plot(hn, col = mapcolors$winnerpn, lwd = 0.05 )

###




























