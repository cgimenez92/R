#Ejercicios
datasets::airquality
datasets::mtcars
datasets::attenu

library(tidyverse)

#Ejercicio 1: Tomar el dataset airquality y traducir todas las variables al español desde R, volcar el nuevo dataset en un CSV.
airquality_esp <- airquality %>% 
    rename("ozono" = "Ozone", "radiacion_solar" = "Solar.R", "viento" = "Wind", "temperatura" = "Temp", "mes" = "Month", "day"= "Day")

write.csv(airquality_esp, "airquality_esp.csv")

#Ejercicio 2: Tomar el dataset de mtcars, crear un nuevo dataset que incluya al menos 4 relaciones nuevas. Traducir todos las variables al español y volcar en un csv.
mtcars$hp.cyl <- mtcars$hp / mtcars$cyl
mtcars$wt.hp <- mtcars$wt / mtcars$hp
mtcars$disp.cyl <- mtcars$disp / mtcars$cyl #cantidad de volumen de nafta en un cilindro en un movimiento de desplazamiento de los cilindros.
mtcars$gal.time <- ((mtcars$qsec * 4) * mtcars$mpg) / 60 #Cantidad de minutos que tardo en gastar un galon de nafta, manteniendo velocidad final de cuarto de milla.

mtcars_esp <- mtcars %>% 
    rename("millas_por_galon" = "mpg", "cilindrada" = "cyl", "disp" = "disp", "caballos_de_fuerza" = "hp", "drat" = "drat", "peso"= "wt", "cuarto_de_milla_x_segundo"= "qsec",
            "motor_en_v_bool"= "vs", "transmision"= "am", "numero_de_cambios"= "gear", "numero_carburadores"= "carb", "fuerza_por_cilindro"= "hp.cyl", 
            "peso_trasladado_por_caballo_de_fuerza"= "wt.hp", "nafta_en_cilindro"= "disp.cyl", "Galon_gastado_en_minutos"= "gal.time")

write.csv(mtcars_esp, "mtcars_esp.csv")

#Ejercicio 3: Tomando el dataset attenu indicar cual es la correlacion entre la distancia de la estación (dist) y la magnitud. guardar la nueva tabla como dataset. Hacer lo mismo para la aceleración (accel) y la magnitud y guardar la tabla.

#Tiempo en que el evento tarda en llegar a la estacion de medicion.
#Variacion de la fuerza del evento al punto que se encuentra la estacion de medicion.
attenu$mag.dist <- attenu$mag / attenu$dist

#Me indica la variacion de la aceleración en la magnitud del evento.
attenu$mag.accel <- attenu$accel / attenu$mag

attenu_test <- attenu
#Ejercicio 4: generar un nuevo dataset usando de base attenu, que contenga dentro del mismo dataset las relaciones del anterior, renombrar las variables para que sea mas facil de entender, y guardar en un CSV. 

attenu_esp <- attenu_test %>%
    rename("numero_de_evento" = "event", "medida_de_fuerza" = "mag", "numero_de_estacion" = "station", "distancia_estacion_centro_evento" = "dist", "punto_maximo_aceleracion" = "accel")
attenu_esp[order(attenu_esp$numero_de_evento, attenu_esp$distancia_estacion_centro_evento), ]

write.csv(attenu_esp, "attenu_esp.csv")

#Ejercicio 5:Generar un programa que explore el dataset attenu, que me indique min, max y promedio de cada uno de los valores numericos. Ademas para cada variable, que indique el tipo de variable que es.
data(attenu) #cargo el data.frame
head(attenu)
View(attenu)
## Estructura general
str(attenu)  # General
dim(attenu) # Dimension
nrow(attenu) #numero de filas (row)
ncol(attenu) #numero de columnas
class(attenu) # tipo de objeto
names(attenu) # Nombre de variables/atributos/campos



summary(attenu) # resumen (min, max, media, mediana, 1er y 3er cuartil) de las variables numericas
#       min    max     prom
#event 1.00   23.00   14.74   
#mag  5.000   7.700   6.084
#dist  0.50   370.00  45.60
#accel 0.00300 0.81000 0.15422

levels(attenu$station)
table(attenu$station) #cant x level



#vemos nulos
nulos <- function(x) {
  y <- sum(is.na(x))
  return(y)
} #  funcion que suma todos los nulos
sapply(X = attenu, FUN = nulos) # invocamos la funcion con sapply.

#Ejercicio 6: Usando el dataset mtcars, reemplazar las columnas de mpg y wt, por sus equivalentes en medidas metricas 
#y remover las versiones en medidas imperiales. Crear un nuevo dataset y guardarlo en un CSV.
require(tidyverse)
data(mtcars)
?mtcars
# mpg = Miles/(US) gallon  1mpg=0.354kpl
# wt = Weight (1000 lbs) 1lb=0.453592 kg
summary(mtcars)
#mtcars_esp <- mtcars %>% 
#  rename('kpl' = 'mpg', 'peso' = 'wt')

mtcars_a<-cbind(mtcars, data.frame(kpl = mtcars$mpg*0.354))
mtcars_a<-cbind(mtcars_a, data.frame(peso = mtcars$wt*0.453592*1000))
head(mtcars_a)
mtcars_new <- mtcars_a %>% select (-mpg,-wt)
head(mtcars_new)

#Ejercicio 7: Descubrimos que el set mtcars tiene mal los datos de la 
#cilindrada del valiant (deberian ser cyl= 8) yel consumo de la duster 360, (deberian ser 20). Corregirlo.

data("mtcars")

mtcars['Valiant',]
mtcars['Valiant','cyl'] <- 8

mtcars['Duster 360',]
mtcars['Duster 360','mpg'] <- 20


#Ejercicio 8 *(Investigar): en el set de MTCARS, nos informan que todos los vehiculos v8 son en realidad v10, 
#debemos corregir este error y guardar en un nuevo dataset en CSV.
str(mtcars)

# vs == 1" y los "cyl == 8" 
table(mtcars$vs,mtcars$cyl)
mtcars$cyl[mtcars$vs == 1 & mtcars$cyl == 8] <- 10

table(mtcars$vs,mtcars$cyl) #como hay ninguna obs que cumpla con la cond no hace nada

write.csv(x = mtcars, file = 'mtcars_ok.csv', row.names = T) 
mtcars_new <-  read.csv("mtcars_ok.csv")
table(mtcars_new$vs,mtcars_new$cyl)

