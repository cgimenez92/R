datasets::mtcars
datasets::Titanic

# EJERCICIOS iniciales 5 puntos cada uno

#Ejercicio 1: Crear un programa que guarde 10 números al azar del uno al 50, los sume, y verifique que: 
#Si la suma es menor a 50, Si la suma es mayor a 50 pero menor a 350, y si la suma es mayor a 350.

ten_random_numbers <- sample(1:50, 10, replace = FALSE)
total_numbers <- sum(ten_random_numbers)

if (total_numbers < 50) print(paste('La suma es menor a 50: ', total_numbers)) else if (total_numbers >= 50 && total_numbers <= 350) #nolint
  print(paste('La suma es mayor a 50 pero menor a 350: ', total_numbers)) else if (total_numbers > 350) #nolint
  print(paste('La suma es mayor a 350: ', total_numbers))

#Ejercicio 2: Usando mtcars indicar cuantos vehículos de 6 cilindros hay en el listado.

six_cyl <- subset(mtcars, mtcars$cyl == 6)
count_cars <- 0

for (i in six_cyl$cyl)
count_cars <- count_cars + 1

print(paste("Cantidad de vehiculos de 6 cilindros: ", count_cars))

#Ejercicio 3: Crear un programa que identifique la cantidad de pétalos de una flor ingresando la cantidad de pétalos en el programa. 
#(A modo de prueba, usar: 6 margarita, 10 girasol, 7 petunia)

q_petals <- readline(prompt = "Ingrese cantidad de petalos: ")

input_petals <- switch(q_petals,
  "6" = "Margarita",
  "7" = "Petunia",
  "10" = "Girasol",
  stop("Cantidad de petalos incorrectos")
)

print(input_petals)

#Ejercicio 4: Usando mtcars, indicar cuantos vehículos tienen cilindrada impar en el listado. 

odd_cyl <- subset(mtcars, mtcars$cyl %% 2 != 0)
count_cars_odd_cyl <- 0

for (i in odd_cyl$cyl)
count_cars_odd_cyl <- count_cars_odd_cyl + 1

print(paste("Cantidad de vehiculos con cilindrada impar: ", count_cars_odd_cyl))

#Ejercicio 5: que esta haciendo el siguiente código?
xs <- c(1, 2, 3)
for (x in xs) {
  xs <- c(xs, x * 2)
}
xs

#Ejercicio 6: escribir un programa que genere numeros del 1 al 7 usando for, e indicar el cuadrado de cada numero. 

for (i in sample(1:7)){
  print(i^2)
}

##Ejercicio 7: Escribir un programa que simule el lanzamiento de una moneda 10 veces, 
##indicando en cada lanzamiento si es cara o seca en un vector generado previamente.

coin_launch <- c()

for (coin in sample(0:1, 10, replace = TRUE)) {
  ifelse (coin == 0, coin_launch <- append(coin_launch, "cara"), coin_launch <- append(coin_launch, "seca")) #nolint
}

print(coin_launch)

#Ejercicios avanzados: Puntos 15 por cada uno.

#Instalar

#install.packages("tidyverse")
#install.packages("knitr")

#Si quieren ver detalles de tidyverse: https://www.tidyverse.org/packages/
#detalles de knitr: https://www.r-project.org/nosvn/pandoc/knitr.html (deberia estar por defecto)

# Usar
#library(tidyverse)
#library(knitr)

(wd <- getwd())
if (!is.null(wd)) setwd(wd)

titanic_csv <- read.csv(".\\Titanic.csv", header = TRUE, sep = ",")

##View(titanic_csv)

##Ejercicio 1: Usar dataset titanic provisto. Se estima que el titanic tenia 2224 pasajeros y tripulación a bordo. 
#Usando el CSV provisto, indicar, de cuantas personas tenemos información, cuantos sobrevivieron, y cuantos no. 
#Cual es la tasa de supervivencia de acuerdo a este dataset?

total_passengers_csv <- 0
q_passengers_csv_not_survived <- 0
q_passengers_csv_survived <- 0

for (passengers_csv in titanic_csv$PassengerId) {
  total_passengers_csv <- total_passengers_csv + 1

  if (titanic_csv$Survived[passengers_csv] == 1) {
    q_passengers_csv_survived <- q_passengers_csv_survived + 1
  } else {
    q_passengers_csv_not_survived <- q_passengers_csv_not_survived + 1
  }
}

survived_rate_csv <- q_passengers_csv_survived / total_passengers_csv

print(paste("Tasa de supervivencia:", round(survived_rate_csv * 100, 2), "%"))

##Ejercicio 2: Usar el dataset Titanic integrado (dataset::Titanic), verificar cuantas personas tenemos en esta versión, 
#cuantas sobrevivieron y cuantos no. Y cual es la tasa de supervivencia.

test <- apply(Titanic, 4, sum)
total_passengers_dtst <- test[1] + test[2]
survived_rate_dtst <- test[2] / total_passengers_dtst

print(paste("Tasa de supervivencia:", round(as.numeric(survived_rate_dtst) * 100, 2), "%"))

##Ejercicio 3: Calcular la diferencia entre cada punto de ambos datasets.

dif_survived_rate <- survived_rate_csv - survived_rate_dtst
print(paste("Diferencia en datasets de tasa de supervivencia:", round(dif_survived_rate * 100, 2), "%"))