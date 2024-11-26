
# La flecha aparece con Alt y -   : <-


library(dplyr)
  
women
str(women)
women$height
summary(women$height)

summary(women)

centena <- c(1:100)
centena[15:25]


letters
letters[15:20]
summary(letters)
str(letters)

base <- head(iris)
base


y <- list(A=letters[1:10],B=c("A","B"), C=c(1,0,1))
y

lapply(y, FUN = paste)

B=c("A","B")
paste0("A","B")

paste0(B,B)

paste0(B,sep=",")

#### Pruebas con la base de datos Gapminder

install.packages("gapminder")
library(gapminder)
library(dplyr)
library(ggplot2)

data("gapminder")


# Seleccionar algunos datos que cumplan con las condiciones de filtro

datos_africa <- gapminder %>% filter ( (continent=="Africa" & year>1980) |
                                     (continent=="Africa" & year<1960))
View(datos_africa)


# Obtener estadísticos agrupados por año

datos_agrupados <- datos_africa %>% group_by(year) %>%
  summarise("meanExp"=mean(lifeExp), "meanGDP"=mean(gdpPercap))
View(datos_agrupados)


# Ejercicio
#   Calcula el promedio de PIB de los paises de Asia
#   De los años 1980 a 2000
#   Exluye a China del cálculo
#   Ordénalos de mayor a menor

gapminder %>%
  filter(continent==c("Asia")) %>%
  filter(year>=1980 | year<=2000)%>%
  filter(country!="China")%>%
  group_by(country)%>%
  summarise("meanExp"=mean(gdpPercap))%>%
  arrange(desc(meanExp))


#  Manejo de bases de datos con valores perdidos
library(mice)
data("boys")

View(boys)

# Borra todos los valores que tengan NA (toda la fila)
boys %>%  na.omit()
