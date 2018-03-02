library(ggplot2)
library(ggthemes)
library(ggThemeAssist)

turnout <- read.csv("C:/Users/Hector Corrales/Google Drive/data/turnout.csv")
turnout$VAP.Turnout <- round(turnout$VAP.Turnout, digits = 2)

### ggPLot

turnout.pl <- 
  ggplot(turnout, aes(x = Year, y = VAP.Turnout)) + 
  
   
  geom_segment(aes(x = 1981, y = mean(turnout$VAP.Turnout[1:5]), 
                   xend = 1997, 
                   yend = mean(turnout$VAP.Turnout[1:5])),
               linetype = 2,
               color = "gray40",
               size = 1.1) + 
  
  geom_segment(aes(x = 2001, y = mean(turnout$VAP.Turnout[6:10]), 
                   xend = 2017, 
                   yend = mean(turnout$VAP.Turnout[6:10])),
               linetype = 2,
               color = "gray40",
               size = 1.1) + 
  
  geom_smooth(aes(x = Year, y = VAP.Turnout),
              method = "loess", 
              span = 0.4,
              se = FALSE, 
              color = "gray25",
              linetype = 1,
              size = 1.1) +
  
  geom_point(size = 2.2) + 
  
  geom_label (data = turnout, size = 5, aes(x = 1988, y = 0.6, 
                                  label = paste("Mean 1981-1997:", 
                                                (mean(turnout$VAP.Turnout[1:5])*100), "%"))) +
  
  geom_label (data = turnout, size = 5, aes(x = 2009, y = 0.725, 
                                  label = paste("Mean 2001-2017:", 
                                                (mean(turnout$VAP.Turnout[6:10])*100), "%"))) +
  
  scale_y_continuous(breaks = seq(0.4, 0.9 , .1), limits = c(0.4,0.9), expand = c(0,0)) +  
  scale_x_continuous(breaks = seq(1981, 2017, 4), limits = c(1981, 2017))

turnout.pl <- turnout.pl + theme_economist()

turnout.pl <- turnout.pl + theme(axis.title = element_text(size = 14), 
    axis.text = element_text(size = 14), 
    axis.text.x = element_text(size = 14), 
    axis.text.y = element_text(size = 14), 
    plot.title = element_text(size = 18, 
        hjust = 0.5)) +labs(title = "Honduran Elections VAP Turnout", 
    x = NULL, y = "VAP Turnout")

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
  
  
  
