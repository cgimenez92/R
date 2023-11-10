#Asigno variable, nombrando la variable y usando <- para asignar el valor

numero_variable <- 3
print(numero_variable)

#El tipo de dato que asigno se define en la asignación.

elmejordelmundo <- "Lionel Messi"
print(elmejordelmundo)

#Puedo operar entre numeros y variables facilmente

1 + 1

sumador_1 <- 10
sumador_2 <- 5
print(sumador_1 + sumador_2)

#Los conjuntos de datos se pueden crear con esta estructura:

bolsa_de_datos <- c(5, 6, 7, 8, 9)
print(bolsa_de_datos)

#EjerciciosS
#  ---------------------------------------
# Crar un hola mundo
print("Hola Mundo")

# Crear una suma de dos variables en forma directa y con variables

num_one <- readline(prompt = "Ingresar primer numero: ")
num_one <- as.integer(num_one)
num_two <- readline(prompt = "Ingresar segundo numero: ")
num_two <- as.integer(num_two)

sum <- sum(num_one, num_two)

print(sum)
print(2 + 2)


# Crear una resta de dos variables en forma directa y con variables

num_one <- readline(prompt = "Ingresar primer numero: ")
num_one <- as.integer(num_one)
num_two <- readline(prompt = "Ingresar segundo numero: ")
num_two <- as.integer(num_two)

subtraction <- num_one - num_two

print(subtraction)
print(2 - 2)

# Calcular la potencia en forma directa y con variables

num_one <- readline(prompt = "Ingresar primer numero: ")
num_one <- as.integer(num_one)
num_two <- readline(prompt = "Ingresar segundo numero: ")
num_two <- as.integer(num_two)

square <- num_one ^ num_two

print(square)

print(2 ^ 2)
# plotear un conjunto de datos

plot(trees) #Dataset de ejemplo guardado para muestra en R