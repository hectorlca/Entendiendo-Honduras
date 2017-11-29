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

### Import shapefile
hn <- readShapePoly (fn="elecciones/HND_adm1", 
                     proj4string=CRS("+proj=longlat +datum=WGS84") )


#Get data out
hn.dat <- as.data.frame(hn)

