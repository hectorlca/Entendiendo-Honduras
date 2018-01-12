vial <- readShapeLines( fn="shapefiles/vial/principales/n3102vL002009_HN", proj4string=CRS("+proj=longlat +datum=WGS84") )

#Subset and Transform

shp <- spTransform(vial, CRS("+proj=longlat +datum=WGS84"))

#### 'Fortify' to be read by ggplot and setup colorcode ####
shp$id <- rownames(shp@data)
shp.df <- as.data.frame(shp)
data_fort <- fortify(shp, region = "id")
data_merged <- join(data_fort, shp.df, by="id")

data_merged$colorcode <- data_merged$Layer

dat <- data_merged

dat$colorcode <- gsub("CAR-MSEL-PRINC", 2, dat$colorcode)
dat$colorcode <- gsub("CAR-MSEL-SEC", 1, dat$colorcode)
dat$colorcode <- gsub("CAR-MSEL-VEC", 1, dat$colorcode)
dat$colorcode <- gsub("CAR-PAVI-PRINC", 2, dat$colorcode)
dat$colorcode <- gsub("CAR-PAVI-SEC", 1, dat$colorcode)
dat$colorcode <- gsub("CAR-TIER-VEC", 1, dat$colorcode)
dat$colorcode <- as.numeric(dat$colorcode)

#### Now lets add a column for specific size ####

dat$size <- ifelse(dat$colorcode == "2")

####Start the Plot ####

p <- ggplot( dat,
             aes(x = long, y = lat,
                 group = group ))


p <- p + geom_path(aes(colour = as.numeric(colorcode)), size = (dat$colorcode*0.9) )

vial <- p + scale_colour_gradient(low = "gray40", high = "gray70")

vial <- vial + theme(plot.subtitle = element_text(vjust = 1), 
              plot.caption = element_text(vjust = 1), 
              axis.line = element_line(colour = "white"), 
              axis.ticks = element_line(colour = "white"), 
              panel.grid.major = element_line(linetype = "blank"), 
              panel.grid.minor = element_line(linetype = "blank"), 
              axis.title = element_text(size = 1, colour = "white"), 
              axis.text = element_text(size = 1, colour = "white"), 
              axis.text.x = element_text(size = 1, 
                                         colour = "white"), axis.text.y = element_text(colour = "white"), 
              plot.title = element_text(size = 30, 
                                        colour = "dodgerblue4", hjust = 0.5, 
                                        vjust = -1.75), legend.text = element_text(size = 1, 
                                                                                   colour = "white"), legend.title = element_text(size = 1, 
                                                                                                                                  colour = "white"), panel.background = element_rect(fill = NA), 
              legend.key = element_rect(fill = "white"), 
              legend.background = element_rect(fill = "white"), 
              legend.position = "none") +labs(title = "")

vial
