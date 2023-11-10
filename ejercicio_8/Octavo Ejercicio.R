# Octavo Ejercicio

#SE PERMITE INVESITGAR POR FUERA DE LOS MATERIALES DE SER NECESARIO
#AL FINALIZAR LA CLASE ENVIEN UNA COPIA POR GRUPO A emilio.leon@bue.edu.ar

#Esta guia tiene como limite de tiempo para entregarse el 20 Esta guía suma 10 puntos por ejercicio, pero debe entregarse completa para considerarse.

#Arboles de clasificación
##--------------
#NOTAS

#Recuerden el ejemplo de Arbol:

#librerías a usar e instalar:
install.packages("caTools")
install.packages("rpart")
install.packages("rpart.plot")
install.packages("caret")
install.packages("dplyr")

#usamos las librerías
library(caTools)
library(rpart)
library(rpart.plot)
library(caret)
library(dplyr)

#vamos a usar el dataset iris para este ejemplo:
head(iris)


set.seed(42) #generador de numeros al azar
#iniciamos la separacion de la muestra

str(iris) #del set de Iris

#tomamos el particionamos en 75% y 25% 
particion_muestra <- sample.split(Y = iris$Species, SplitRatio = 0.75) 

#creamos el set de entrenamiento tomando los verdaderos - 75%
particion_entrenamiento <- subset(x = iris, particion_muestra == TRUE) 

#creamos el set de prueba tomando los falsos - 25%
particion_prueba <- subset(x = iris, particion_muestra == FALSE)

#usando la libreria rpart, creamos el modelo. Ponemos la variable objetivo a la izquierda.
modelo_arbol <- rpart(Species ~ ., data = particion_entrenamiento, method = "class")

#y lo vemos, notar que es para la muestra de 75%, es decir la particion de entrenamiento. 
print (modelo_arbol)

#diagramamos el arbol
rpart.plot(modelo_arbol)

#analizamos el poder predictivo, viendo cuanto pesa cada variable en la predicción
poder_prediccion <- varImp(modelo_arbol)
poder_prediccion %>%
  arrange(desc(Overall))

#ahora usamos el set de prueba para predecir con el modelo
prediccion <- predict(modelo_arbol, newdata = particion_prueba, type = "class")

#vemos detalles de predicción
print(prediccion) 
plot(prediccion)

#analizamos la predicción
confusionMatrix(particion_prueba$Species, prediccion)

#Ahora, como ajustar hiperparametros...facil:
library(rpart)
control <- rpart.control(minsplit = 20, minbucket = 7, maxdepth=30)
fit <- rpart(Species ~ ., data=iris, method="class", control=control)

#y se genera el arbol como parametros ajustados
modelo_arbol_corregido <- rpart(Species ~ ., data = particion_entrenamiento, method="class", control=control)

#ploteamos corregido
rpart.plot(modelo_arbol_corregido) #ojo, aca es muy facil caer en overfitting. 

#veamos que representa cada sección:
#min.split: indica la cantidad minima de observaciones para realizar una división o split en cada nodo.
#minbucket: indica la cantidad minima de observaciones en nodos terminales, es decir la clasificación en si.
#maxdepth: indica la profundidad maxima de los nodos del arbol final. Dependiendo de los datos, esta profundidad puede alcanzarse o no.

#OJO CON OVERFITTING O UNDERFITTING, SI LA CONFIABILIDAD YA ES ALTA (MAS DE 95) puede que no necesiten ajustar, pero para probar que pasa ajusten.


##--------------

#Ejercicio 1: Usando uno de los datasets integrados crear un arbol de clasificación. Recordar verificar que los datos sean adecuados y que la muestra sea representativa.

#Ejercicio 2: Usando cualquier dataset de Kaggle, crear un arbol de clasificación desde un CSV.

#Ejercicio 3: Ajustar hiperparametros para mejorar el resultado de ambos arboles.