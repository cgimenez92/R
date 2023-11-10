datasets::mtcars
datasets::attenu
datasets::women

#Ejercicio 1: tomando el dataset de mtcars, generar un nuevo data frame que contenga por cada nivel de cilindros (4,6,8) el promedio de hp y mpg. 
cyl_meanHp <- data.frame(tapply(mtcars$hp, mtcars$cyl, mean))
cyl_meanMpg <- data.frame(tapply(mtcars$mpg, mtcars$cyl, mean))
cyl_meanMpg$cyl <- rownames(cyl_meanMpg)
cyl_meanHp_and_meanMpg <- data.frame(cyl_meanHp, cyl_meanMpg)
colnames(cyl_meanHp_and_meanMpg) <- c("hp_mean", "mpg_mean", "cyl")
#print(cyl_meanHp_and_meanMpg)

#Ejercicio 2: usando el data frame generado en el ejemplo 1, predecir cual seria el promedio de hp y mpg de un automotor v10 y v12 (10 y 12 cilindros), integrar la informacion en un nuevo data frame que contenga los de 10 y 12 cilindros.
#plot(cyl_meanHp_and_meanMpg$hp_mean, cyl_meanHp_and_meanMpg$cyl)
lr_hp <- lm(cyl_meanHp_and_meanMpg$cyl ~ cyl_meanHp_and_meanMpg$hp_mean, data = cyl_meanHp_and_meanMpg)
#abline(lr_hp)
#print(lr_hp)

#plot(cyl_meanHp_and_meanMpg$mpg_mean, cyl_meanHp_and_meanMpg$cyl)
lr_mpg <- lm(cyl_meanHp_and_meanMpg$cyl ~ cyl_meanHp_and_meanMpg$mpg_mean, data = cyl_meanHp_and_meanMpg)
#abline(lr_mpg)
#print(lr_mpg)

############## Prediccion de promedio de hp en un automotor V10 y V12 ##############
at_0_lr_hp <- lr_hp$coef["(Intercept)"]
#print(at_0_lr_hp)

variation_cyl_hp <- lr_hp$coef["cyl_meanHp_and_meanMpg$hp_mean"]
#print(variation_cyl_hp)

hp_mean_prediction_10 <- (10 - at_0_lr_hp) / variation_cyl_hp
hp_mean_prediction_12 <- (12 - at_0_lr_hp) / variation_cyl_hp
#print(hp_mean_prediction_10)
#print(hp_mean_prediction_12)


############## Prediccion de promedio de mpg en un automotor V10 y V12 ##############
at_0_lr_mpg <- lr_mpg$coef["(Intercept)"]
#print(at_0_lr_mpg)

variation_cyl_mpg <- lr_mpg$coef["cyl_meanHp_and_meanMpg$mpg_mean"]
#print(variation_cyl_mpg)

mpg_mean_prediction_10 <- (10 - at_0_lr_mpg) / variation_cyl_mpg
mpg_mean_prediction_12 <- (12 - at_0_lr_mpg) / variation_cyl_mpg
#print(hp_mean_prediction_10)
#print(hp_mean_prediction_12)


cyl_meanHp_and_meanMpg <- rbind(cyl_meanHp_and_meanMpg, c(hp_mean_prediction_10, mpg_mean_prediction_10, 10))
cyl_meanHp_and_meanMpg <- rbind(cyl_meanHp_and_meanMpg, c(hp_mean_prediction_12, mpg_mean_prediction_12, 12))
#print(cyl_meanHp_and_meanMpg)

#Ejercicio 3: usando el dataset women, crear un modelo de regresion lineal para la altura y el peso, donde el peso sea la variable de entrada. Realizar dos predicciones con el modelo.
lr_weight_height <- lm(women$weight ~ women$height, data = women) #linear regression model is created using the lm() function, with "weight" as the dependent variable (y) and "height" as the independent variable(x), using the data from the "women" data frame
#plot(women)
#abline(lr_weight_height)

#Ejercicio 4: usando el dataset attenu, crear una muestra con 25 observaciones. Guardar en un nuevo dataset.
sample_attenu <- attenu[sample(nrow(attenu), size = 25), ]

#Ejercicio 5: usando el dataset LakeHuron (ojo que es una serie temporal) extraer una serie de datos al azar, 
#de 40. comparar el promedio contra el dataset real.
data(LakeHuron)
str(LakeHuron)
mean(LakeHuron)
serie<-sample(LakeHuron, 40, replace=TRUE)
mean(serie)

#Ejercicio 6: usando el dataset de juego de tronos, battles.csv (en el aula virtual), 
#crear un dataset reducido que solo contenga las 5 primeras variables (name, year,battle_number,attacker_king, defender_king) 
#y las columnas major_death, major_capture, volvar este nuevo set en un csv. 
#Generar de ese nuevo set una muestra de 15 observaciones al azar que tenga un promedio aproximado de muertes y capturas al set completo.

#(wd <- getwd())
#if (!is.null(wd)) setwd(wd)
#print(wd)

got_battles_csv <- read.csv(".\\battles.csv", header = TRUE, sep = ",") #nolint
names_columns <- c("name", "year", "battle_number", "attacker_king", "defender_king", "major_death", "major_capture")
got_battles_reduced <- subset(got_battles_csv, major_death != "Invalid Number", select = names_columns) #nolint
write.csv(got_battles_reduced, "got_battles_reduced.csv")

mean_mDeath_reduced <- mean(got_battles_reduced$major_death)
mean_mCapture_reduced <- mean(got_battles_reduced$major_capture)

print(mean_mDeath_reduced)
print(mean_mCapture_reduced)

repeat {
  rndm_got_battles_reduced <- got_battles_reduced[sample(nrow(got_battles_reduced), size=15),]
  mean_mDeath_rndom <- mean(rndm_got_battles_reduced$major_death)
  mean_mCapture_rndom <- mean(rndm_got_battles_reduced$major_capture)
  print(mean_mDeath_rndom)
  print(mean_mCapture_rndom)
  if (round(mean_mDeath_reduced) == round(mean_mDeath_rndom) && round(mean_mCapture_reduced) == round(mean_mCapture_rndom)) {
    View(rndm_got_battles_reduced)
    break
  }
}

#Ejercicio 7: usando el dataset de juego de tronos, character-deaths.csv (en el aula virtual)
character_deaths_csv <- read.csv(".\\character-deaths.csv", header = TRUE, sep = ",") #nolint
columns <- c("name", "allegiances", "death_year", "book_of_death", "death_chapter", "book_intro_chapter", "gender", "nobility", "got", "cok", "sos", "ffc", "dwd")
colnames(character_deaths_csv) <- columns

#Completar todos los datos no conocidos con la expresion "NA".
character_deaths_r <- subset(character_deaths_csv, book_intro_chapter != "Invalid Number", select = columns) #nolint
character_deaths_r[character_deaths_r$allegiances == "None", 2] <- NA

#Y volcar a un CSV nuevo.
write.csv(character_deaths_r, "character_deaths_r.csv")

#Volver a tomar los datos y crear una muestra del tamaño que deseen, que tenga una composición similar de genero (gender) y nobleza (nobility)
character_deaths_r_csv <- read.csv(".\\character_deaths_r.csv", header = TRUE, sep = ",")

#View(character_deaths_csv)

repeat {
  rndm_character_deaths_r_csv <- character_deaths_r_csv[sample(nrow(character_deaths_r_csv), size=100),]
  if (sum(rndm_character_deaths_r_csv$gender) == sum(rndm_character_deaths_r_csv$nobility)) {
    View(rndm_character_deaths_r_csv)
    break
  }
}

#RECORDAR QUE EN LAS MUESTRAS NO SE DEBERIAN REPETIR LAS OBSERVACIONES