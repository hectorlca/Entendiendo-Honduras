library (plyr)
library (dplyr)

####

censo2013 <- read.csv("elecciones/censo2013.csv", stringsAsFactors = FALSE)
censo2013$edad <- as.numeric(censo2013$edad)
censo2013$edad2013 <- censo2013$edad



censo2013$bracket <- ifelse(censo2013$edad >= 18 & censo2013$edad <= 20, 
                            yes = "18 a 20", no = "none")

censo2013$bracket <- ifelse(censo2013$edad >= 21 & censo2013$edad <= 25, 
                            yes = "21 a 25", no = censo2013$bracket)

censo2013$bracket <- ifelse(censo2013$edad >= 26 & censo2013$edad <= 34, 
                            yes = "26 a 34", no = censo2013$bracket)

censo2013$bracket <- ifelse(censo2013$edad >= 35 & censo2013$edad <= 50, 
                            yes = "35 a 50", no = censo2013$bracket)

censo2013$bracket <- ifelse(censo2013$edad >= 51 & censo2013$edad <= 64, 
                            yes = "51 a 65", no = censo2013$bracket)

censo2013$bracket <- ifelse(censo2013$edad >= 65, 
                            yes = "65+", no = censo2013$bracket)

censo2013$elegible2013 <- ifelse(censo2013$edad2013 >= 18, yes = "Habilitado", no = "No habilitado")

censo2013$bracket <- ifelse(censo2013$edad <= 17, 
                            yes = "Menor", no = censo2013$bracket)
### Census Summary ###

groupedCensus <- group_by(censo2013, departamento, bracket)
sumCensus <- summarise(groupedCensus, cargamasc = sum(as.numeric(hombre)), cargafem = sum(as.numeric(mujer)))

### Calcular Carga Electoral ###

carga <- filter(sumCensus, bracket != "Menor" )
carga$total <- carga$cargamasc + carga$cargafem

### Carga por Departamento ###

carga.dept <- 
  group_by(carga, departamento) %>%
  summarise(cargatotal = sum(total))



