datasets::mtcars
##View(mtcars)
#Ejercicios:

#Ejercicio 1: Crear una versión resumida de un dataset de MTCARS donde, el nuevo dataset incluya, el nombre de los vehiculos, la cilindrada, los caballos de fuerza y el peso, y si el motor es en V o lineal.

mtcars_summary <-  subset(mtcars, select = c(cyl, hp, wt, vs))
##View(mtcars_summary)

#Ejercicio 2: volcar el dataset de MTCARS resumido en un nuevo archivo CSV.
#Tomar el archivo CSV y calcular para todos los vehiculos la relacion entre cilindrada y caballo de fuerza (HP/Cyl) y caballo de fuerza y peso (Wt/hp). 
#Integrar esos datos con los anteriores y generar un nuevo CSV.

write.csv(mtcars_summary, "mtcars_summary.csv")

(wd <- getwd())
if (!is.null(wd)) setwd(wd)

mtcars_summary_csv <- read.csv(".\\mtcars_summary.csv", header = TRUE, sep = ",") #nolint
##View(mtcars_summary_csv)

hp_cyl <- mtcars_summary_csv$hp / mtcars_summary_csv$cyl
wt_hp <- mtcars_summary_csv$wt / mtcars_summary_csv$hp
mtcars_summary_with_calcs_csv <- cbind(mtcars_summary_csv, hp_cyl, wt_hp)

write.csv(mtcars_summary_with_calcs_csv, "mtcars_summary_with_calcs.csv")

#Ejercicio 3: Usando el nuevo dataset, cuantos y qué vehiculos tienen una relacion de fuerza (hp) y cilindrada (cyl) superior a 23 (o lo que es lo mismo, cuantos tienen cada cilindro produciendo mas de 23 hp). 
#Volcar esos nuevos datos en un nuevo CSV.
mtcars_summary_with_calcs <- read.csv(".\\mtcars_summary_with_calcs.csv", header = TRUE, sep = ",") #nolint

cars_cyl_23 <- subset(mtcars_summary_with_calcs, hp_cyl >= 23)
count_cars_cyl_23 <- 0

for (cars in cars_cyl_23$X) {
  count_cars_cyl_23 <- count_cars_cyl_23 + 1
}

print(count_cars_cyl_23)
##View(cars_cyl_23)