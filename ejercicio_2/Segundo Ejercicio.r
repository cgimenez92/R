require(graphics)
library(modeest) #Libreria para moda
datasets::mtcars
datasets::ChickWeight


#1 - Escriba un programa de R para tomar la entrada del usuario (nombre y edad) y mostrar los valores.
nombre <- readline(prompt = "Ingrese su nombre: ")
edad <- readline(prompt = "Ingrese su edad: ")
print(paste("Nombre: ", nombre, "Edad: ", edad))

#2 - Escriba un programa de R para obtener los detalles de los objetos en memoria. 
#    Hacerlo con un vector, variables y finalmente con un set de datos integrados.
example_variable <- as.integer(5)

print(paste("Variable: ", object.size(example_variable)))
print(paste("Vector: ", object.size(nombre)))
print(paste("Dataset: ", object.size(mtcars)))

#3 - Escribe un programa R para crear una secuencia de números del 10 al 50 y encuentra la media de los números del 20 al 60 y la suma de los números del 51 al 91.
seq_vector <- (10:50)
seq(seq_vector)
print(seq_vector)

median_vector <- (20:60)
mean(median_vector)
print(median_vector)

suma <- (51:91)
sum(suma)
print(suma)

#4 - Escribe un programa de R para crear un vector que contenga 10 valores enteros aleatorios entre -10 y +10.
vector  <- sample(-10:10, size = 10, replace = FALSE)
vector

#5 - Escribe un programa para imprimir únicamente los diez primeros vehículos del dataset de mtcars. 
#    Adicionalmente, que liste aparte las 5 primeras cilindradas, y que me diga la cilindrada más común.
data_cars_firts_ten <- head(mtcars, 10)
print(data_cars_firts_ten)

data_cars_cyl <- head(mtcars$cyl, 10)
print(data_cars_cyl)

#Realizacion de moda sin instalacion de paquetes
#data_cars_five_cyl <- data.frame(table(mtcars$cyl))
#moda <- data_cars_five_cyl[which.max(data_cars_five_cyl$freq), 1]
#print(moda)

print(mlv(mtcars$cyl, method = "mfv"))


#6 - Cual es el promedio de cilindrada de los vehículos en mtcars?
data_cars_avg <- mean(mtcars$cyl)
print(data_cars_avg)

#7 -Escribe un programa para guardar todos los hp de los vehículos de mtcars en un vector, calcular moda, media y mediana, e imprimir la información. 
#  Luego, ordenar los datos y mostrar los 10 superiores
hp <- mtcars$hp

print(paste("Moda", mlv(hp, method = "mfv"), "Media: ", mean(hp), "Mediana: ", median(hp))) # nolint
mtcars_by_hp <- mtcars[order(hp), ]
mtcars_by_hp_firts_ten <- head(mtcars_by_hp, 10)
print(mtcars_by_hp_firts_ten)

#8 (INVESTIGAR) Escribe un programa que contenga 3 vectores con 5 numeros al azar
#  unir los tres vectores en una matriz, finalmente que muestre el contenido de la matriz
#  en cada ejecución la matriz debe cambiar (hint: cbind)

vector1 <- sample(1:100, 5)
print(paste("vector1: ", vector1))

vector2 <- sample(101:200, 5)
print(paste("vector2: ", vector2))

vector3 <- sample(201:300, 5)
print(paste("vector3: ", vector2))

matriz <- cbind(vector1, vector2, vector3)
print(paste("matriz:", matriz))


#9 - (INVESTIGAR) Usando el dataset notten, escribir un programa que me indique la temperatura mas baja de todo el set, la maxima, y despues la minima y maxima por mes, 
#   y finalmente el minimo, maximo y promedio por año.

#10 - Crear un dataset que contenga el nombre, apellido, edad, año de nacimiento, mes de nacimiento y día de nacimiento de cada miembro de su grupo. 
#Puede hacerse directamente o con cbind. Una vez hecho, que muestre el contenido, que indique la edad maxima, la minima y el promedio de edad del grupo.
name <- c("Cristian", "Silvia")
last_name <- c("Gimenez", "Visuara")
age <- c(31, 35)
birth_year <- c(1992, 1987)
month_year <- c(4, 6)
birth_day <- c(2, 31)

group_members <- data.frame(name, last_name, age, birth_year, month_year)
names(group_members) <- c("name", "last_name", "age", "birth_year", "month_year") #nolint
print(group_members)
print(paste("Edad Minima:", min(age), "Edad Maxima:", max(age), "Promedio:", mean(age))) #nolint

#11 - (INVESTIGAR) Usando el dataset creado en el ejercicio 10, imprimir el resumen de la información. Probar de hacer lo mismo con iris.
summary(group_members)
summary(iris)

#12 Del set IRIS, ordenar indicar el promedio de longitud de pétalos, solamente de la especie setosa. Luego indicar el máximo de longitud de pétalo, 
#solo de la especie virginica. (Se puede resolver solo con lo aclarado en esta guía pero hay formas mas elegantes de hacerlo)
setosa <- subset(iris, Species == "setosa")
cat("El promedio de longitud de pétalos para la especie setosa es:",mean(setosa$Petal.Length)) #nolint
summary(setosa)        #compruebo
virginica <- subset(iris, Species == "virginica")
cat("El promedio de longitud de pétalos para la especie virginica es:",max(virginica$Petal.Length)) #nolint

#13 Usando el dataset de nhtemp, cual es el promedio total de temperaturas? cual es el promedio total de temperaturas entre 1912 y 1922, y cual es el promedio de temperaturas entre 1961 y 1971. En todos los casos, cual es el mínimo y el máximo.
# Usando el dataset mtcars, indicar cuantos vehículos tienen caja de cambios en números impares

summary(nhtemp)

start(nhtemp)
end(nhtemp)
summary(window(nhtemp, start = 1912, end = 1922))
temp_1912_22 <- window(nhtemp, start = 1912, end = 1922)
cat("Promedio: ", mean(temp_1912_22), "Min: ", min(temp_1912_22), "Max: ", max(temp_1912_22)) #nolint

summary(window(nhtemp, start = 1961, end = 1971))
temp_1961_71 <- window(nhtemp, start = 1961, end = 1971)

cat("Promedio: ", mean(temp_1961_71), "Min: ", min(temp_1961_71), "Max: ", max(temp_1961_71)) #nolint

data(mtcars)
mtcars
View(mtcars)
gear_impar <- sum(mtcars$gear %% 2 != 0)
cat("Número de vehículos con caja de cambios impar:", gear_impar)

#14 Calcular la relación entre los cilindros y el hp de los vehículos en mtcars y mostrarlo. 

mtcars_by_hp <- mtcars[order(mtcars$hp), ] # ordenado por hp
mtcars_by_hp$cyl <- factor(mtcars_by_hp$cyl) # Ordena por categoria, en este caso cilindrada #nolint
dotchart(mtcars_by_hp$hp, labels=row.names(mtcars_by_hp), groups = mtcars_by_hp$cyl, main = "Horse power for Car Models\ngrouped by cylinder") #nolint


#15 - Usando cualquier dataset en datasets::, hacer un estudio aplicando todo lo visto hasta ahora, este ejercicio es libre, pero se pide al menos un resumen, mediana, modo, promedio, alguna relacion, top de informacion, etc. 
# Esta informacion tiene que tener sentido y ser consistente dentro de los datos analizados.

#str(ChickWeight) #Weight -> Grm | Time -> Days

unique_chk <- unique(ChickWeight$Chick)
uniques_chk_in_time <- subset(ChickWeight, ChickWeight$Chick %in% unique_chk & ChickWeight$Time == max(ChickWeight$Time)) #nolint
View(uniques_chk_in_time)
#resumen
#chk_first_diet <- subset(ChickWeight, Diet == 1)
summary(uniques_chk_in_time)

#mediana moda promedio

print(paste("Moda", mlv(uniques_chk_in_time$weight, method = "mfv"), "Promedio: ", mean(uniques_chk_in_time$weight), "Mediana: ", median(uniques_chk_in_time$weight))) # nolint

#alguna relacion: weight ~ Time

coplot(weight ~ Time | Chick, data = ChickWeight)

#top de informacion
chk_weight <- uniques_chk_in_time$weight

chk_by_weight <- uniques_chk_in_time[order(chk_weight, decreasing = TRUE), ]
max_10_chk_diet <- head(chk_by_weight, 10)
View(max_10_chk_diet)

#BONUS
#Distribución normal al azar
#n <- floor(rnorm(10000, 500, 100))
#t <- table(n)
#barplot(t)
#Les debería servir en estadística ;)