library(scales)

agua <- readShapeLines( fn="shapefiles/red hidrica/m2301vL001970_HN", proj4string=CRS("+proj=longlat +datum=WGS84") )

#Subset red secundaria y cuerpos chiquitos
agua2 <- subset(agua, Codigo <= 2)
agua3 <- subset(agua, Shape_Leng > 1000)
shp <- spTransform(agua3, CRS("+proj=longlat +datum=WGS84"))

#'Fortify' to be read by ggplot
shp$id <- rownames(shp@data)
shp.df <- as.data.frame(shp)
data_fort <- fortify(shp, region = "id")
data_merged <- join(data_fort, shp.df, by="id")

# Start the basic plot


subsets <- filter( data_merged, Shape_Leng > 1600)





p <- ggplot( subsets,
             aes(x = long, y = lat,
                 group = group ))


p <- p + geom_path(aes(colour = as.numeric(Shape_Leng)))

hidro <- p + scale_colour_gradient(low = "steelblue1", high = "steelblue4")

hidro + theme(plot.subtitle = element_text(vjust = 1), 
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






