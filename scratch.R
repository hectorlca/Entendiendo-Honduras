library(plyr)
library(dplyr)
library(tigris)
library(maptools)
library(sp)
library(ggplot2)
library(ggmap)
library(broom)



shp <- spTransform(r, CRS("+proj=longlat +datum=WGS84"))

#'Fortify' to be read by ggplot

shp$id <- rownames(shp@data)
shp.df    <- data.frame(id=rownames(shp@data),
                        values=sample(1:10,length(shp),replace=T),
                        shp@data, stringsAsFactors=F)

data_fort   <- fortify(shp)

data_merged <- join(data_fort, shp.df, by="id")

#### Start Basic Map





p <- ggplot(data = data_merged,
            aes(x=long, y=lat, group=group, colour = "red"))+ geom_path(alpha = 0.5)

p 

p + geom_line(aes(color = "blue"))



  
basic <-   
   p + 
  geom_line( ,
             aes(x = long, y = lat, group = group
                 ) ) 

#### Us ggThemeAssist ####

































