datasets::Titanic

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

View(titanic_csv)

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