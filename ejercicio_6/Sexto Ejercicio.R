# Sexto Ejercicio

#SE PERMITE INVESITGAR POR FUERA DE LOS MATERIALES DE SER NECESARIO
#AL FINALIZAR LA CLASE ENVIEN UNA COPIA POR GRUPO A emilio.leon@bue.edu.ar
# Si no han terminado la guía anterior seguir haciéndola.
#Sepan entender si faltan acentos en algunas palabras, tengo que cambiar el teclado entre dos idiomas para comentar y programar XD

##--------------

#Notas  - Preparación de datos y limpieza

install.packages("tidyverse") #facilita manejar datos
install.packages("jmv") #maneja frequencias y descripciones

#Extracción de variables
iris[, c("Species", "Petal.Width")] #permite visualizar solo la columna species y ancho de petalos
mtcars[, c("mpg", "cyl")] #permite visualizar solo la columna de millas y cilindrada

#para ver parcialmente lo que tengo
datacars <-mtcars[, c("mpg", "cyl")]
head(datacars)

#alternativamente con tidyverse
library(tidyverse)
select(iris, Species, Petal.Width) #por variable
select(iris, 5, 4) #por numero de columna

#o alternativamente para mtcars
library(tidyverse)
select(mtcars, mpg, cyl)

#Construir variables nuevas de las existentes
iris$Petal.Ratio <- iris$Petal.Length/iris$Petal.Width #divide las variables entre longitud y ancho y las guarda en Ratio
iris$Sepal.Ratio <- iris$Sepal.Length/iris$Sepal.Width #divide las variables entre longitud y ancho y las guarda en Ratio
iris #veo las nuevas variables en el dataset de R (si limpio variables del ambiente no las veo más)

#Visualizar estructura de datos primeras cinco variables. Tambien permite visualizar el tipo de dato. Esta limitado a la 5 columna o variable en los ejemplos.
str(mtcars[1:5])
str(iris[1:5])
str(AirPassengers[1:5])

#o visualizar una sola variable
str(mtcars$cyl)
#devuelve num [1:32] 6 6 4 6 8 6 8 4 4 6 ..., que implica, es una categoria numerica, con 32 observaciones.

#o para ver solo el tipo de variable
class(mtcars$cyl) #numérico
str(iris$Species) #factor de tres niveles

#nombres de variables
names(mtcars)

#las variables se pueden renombrar, requiere tidyverse

#renombrando variables
mtcars_esp <- mtcars %>% 
  rename('cilindrada' = 'cyl', 'caballoFuerza' = 'hp')
#verificamos
names(mtcars_esp)

#tambien con tidyverse puedo reducir un dataset, quitando variables:
library(tidyverse)
airquality_reducido <- airquality %>% select (-Month,-Day)
print(airquality_reducido)

#renombrando variables
mtcars_esp <- mtcars %>% 
  rename('cilindrada' = 'cyl', 'caballoFuerza' = 'hp')
#verificamos
names(mtcars_esp)

#puedo relacionar dos variables dentro de un dataset de esta manera
table(mtcars$cyl,mtcars$hp) #en este caso me indica la cantidad de vehiculos de determinada cilindrada que generan cierta cantidad de fuerza.

#si quisiera trabajar con las observaciones 5 y 7 de mtcars unicamente (con tidyverse)
mtcars_reducido <- mtcars %>% slice (57)
print(mtcars_reducido) 

#esto lo puedo manipular asi:
# rangos (5:7)
# remover (-2,-7)
#remover rango (-5:-7)

#cambiar datos individuales, aca cambio el valor de mtcars, columna 1, fila 3 (noten que el nombre de la observacion no lo toma para calcular donde cambia, esto tambien se puede hacer con los nombres)
mtcars_reducido[1,3] <- 1
mtcars_reducido

