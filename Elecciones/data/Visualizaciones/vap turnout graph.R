turnout <- read.csv("C:/Users/Hector Corrales/Google Drive/data/2001/turnout.csv")
turnout$VAP.Turnout <- round(turnout$VAP.Turnout, digits = 2)

### ggPLot

turnout.pl <- 
  ggplot(turnout, aes(x = Year, y = VAP.Turnout)) + 
  geom_point() + 
  geom_smooth(aes(x = Year, y = VAP.Turnout),
              method = "loess", 
              span = 0.4,
              se = FALSE, 
              color = "gray25",
              linetype = 1,
              size = 1.1) + 
  geom_segment(aes(x = 1981, y = median(turnout$VAP.Turnout[1:5]), 
                   xend = 1997, 
                   yend = median(turnout$VAP.Turnout[1:5])),
               linetype = 2,
               lineend = "butt",
               size = 1.1) + 
  
  geom_segment(aes(x = 2001, y = median(turnout$VAP.Turnout[6:10]), 
                   xend = 2017, 
                   yend = median(turnout$VAP.Turnout[6:10])),
               linetype = 2,
               size = 1.1) + 
  
  geom_label (data = turnout, aes(x = 1988, y = 0.6, 
                                  label = paste("Median 1981-1997:", 
                                                median(turnout$VAP.Turnout[1:5])))) +
  
  geom_label (data = turnout, aes(x = 2009, y = 0.725, 
                                  label = paste("Median 2001-2017:", 
                                                median(turnout$VAP.Turnout[6:10])))) +
  
  scale_y_continuous(breaks = seq(0.4, 0.9 , .1), limits = c(0.4,0.9), expand = c(0,0)) +  
  scale_x_continuous(breaks = seq(1981, 2017, 4), limits = c(1981, 2017))

turnout.pl

ggsave(
  "vapturnout.png",
  turnout.pl,
  device = "png",
  units = "in",
  width = 10,
  height = 8.5,
  path = "C:/Users/Hector Corrales/Google Drive/data/visualizaciones",
  dpi = 1000)
  
  
  
