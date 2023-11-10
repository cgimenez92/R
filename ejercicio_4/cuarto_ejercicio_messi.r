#Ejercicio 4: Buscar en google los 10 partidos despues de que se uniera messi del Inter Miami. 
#Registrar los oponentes, goles a favor, goles en contra, si se definio en penales, penales a favor, penales en contra. 
#Crear un dataset con esa información. Volcarlo en un archivo CSV.

write.csv(int_miami_messi_era <- data.frame(
  opponent = c("Cruz Azul", "Atlanta", "Orlando", "Dallas", "Charlotte", "Philadelphia", "Nashville", "Cincinnati", "New York", "Nashville"), #nolint
  goals = c(2, 4, 3, 4, 4, 4, 1, 3, 2, 0),
  goals_againts = c(1, 0, 1, 4, 0, 1, 1, 3, 0, 0),
  bool_penalties = c(FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE), #nolint
  penalties = c(0, 0, 0, 5, 0, 0, 10, 5, 0, 0),
  penalties_againts = c(0, 0, 0, 3, 0, 0, 9, 4, 0, 0)
), "inter_miami_messi_era.csv")

View(int_miami_messi_era)

#Ejercicio 5: Buscar en google los 10 partidos antes de que se una Messi del Inter Miami. 
#Registrar los oponentes, goles a favor, goles en contra, si se definio en penales, penales a favor, penales en contra. 
#Crear un dataset con esa información. 
#Volcarlo en un archivo CSV (hacer el CSV primero y leerlo del programa, si bien resuelve esto, no se considera valido para este ejercicio, pero pueden usarlo como control si lo creen necesario).

write.csv(int_miami_before_messi <- data.frame(
  opponent = c("Nashville", "Montreal", "New York", "D.C", "New England", "Philadelphia", "Austin", "Columbus", "DC", "St. Louis"), #nolint
  goals = c(2, 0, 0, 1, 1, 1, 1, 2, 2, 0),
  goals_againts = c(1, 1, 0, 2, 3, 4, 1, 2, 2, 3),
  definition_in_penalties = c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE), #nolint
  penalties = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  penalties_againts = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
), "inter_miami_before_messi.csv")
View(int_miami_before_messi)

#Ejercicio 6: Usando los datos del ejercicio 4 y 5, comparar, la cantidad de partidos ganados antes de messi y después. 
#Calcular el total de goles a favor de cada set y compararlos.
#Comparar también los mínimos y los máximos. En cada comparación indicar el porcentaje en que el dato cambio.

miami_messi_era <- read.csv(".\\inter_miami_messi_era.csv", header = TRUE, sep = ",") #nolint
miami_before_messi <- read.csv(".\\inter_miami_before_messi.csv", header = TRUE, sep = ",") #nolint

diff_btw_mme_mbm <- (sum(miami_messi_era$goals) - sum(miami_before_messi$goals)) / sum(miami_before_messi$goals) #nolint
print(paste(diff_btw_mme_mbm * 100, "%"))

diff_min_btw_mme_mbm <- (min(miami_messi_era$goals) - min(miami_before_messi$goals)) / min(miami_before_messi$goals) #nolint
if (is.nan(diff_min_btw_mme_mbm) == 1) {
  diff_min_btw_mme_mbm <- 0
}

print(paste(diff_min_btw_mme_mbm, "%"))

diff_max_btw_mme_mbm <- (max(miami_messi_era$goals) - max(miami_before_messi$goals)) / max(miami_before_messi$goals)  #nolint
print(paste(diff_max_btw_mme_mbm * 100, "%"))

#Ejercicio 7: Si Messi se uniera a LA Galaxy, en que porcentaje hubiera impactado los ultimos cinco partidos. 
#Indicar los oponentes, resultado real, goles a favor esperados y goles en contra esperados si messi hubiera jugado en ese equipo 
#(esto se puede hacer matemáticamente de varias maneras, pero la mas directa es usando la variación porcentual que ya tenemos del inter miami y aplicarla en este caso, a nivel de programar, pensar bien cada paso, y que información necesito).

diff_goals_againts_btw_mme_mbm <- (sum(miami_messi_era$goals_againts) - sum(miami_before_messi$goals_againts)) / sum(miami_before_messi$goals_againts) #nolint
print(paste(diff_goals_againts_btw_mme_mbm * 100, "%"))


la_galaxy_if_messi <- data.frame(
  opponent = c("Los Angeles", "Minnesota United", "Austin", "Portland Timbers", "Seattle Sounders"), #nolint
  goals = c(2, 4, 3, 3, 1),
  goals_againts = c(4, 3, 3, 3, 2)
)

expected_goals_scored <- c()
expected_goals_againts <-  c()

for (goal in la_galaxy_if_messi$goals) {
  expected_goals_scored <- c(round((la_galaxy_if_messi$goals* diff_btw_mme_mbm) + la_galaxy_if_messi$goals, 0)) #nolint
}
print(expected_goals_scored)

for (goal in la_galaxy_if_messi$goals_againts) {
  expected_goals_againts <- c(round((la_galaxy_if_messi$goals_againts * diff_goals_againts_btw_mme_mbm) + la_galaxy_if_messi$goals_againts, 0)) #nolint
}
print(expected_goals_againts)

la_galaxy_if_messi <- cbind(la_galaxy_if_messi, expected_goals_scored, expected_goals_againts) #nolint

View(la_galaxy_if_messi)

#Ejercicio 8: Si messi jugara en el LA Galaxy, de los ultimos 5, cual hubiera tenido mayor cantidad de goles? y cual menor cantidad? <- UN MOMENTO, ES ESTO UNA PREDICCION BÁSICA??? XD

max_pred_goals_scored <- subset(la_galaxy_if_messi, la_galaxy_if_messi$expected_goals_scored == max(la_galaxy_if_messi$expected_goals_scored))

print(paste("La mayor cantidad de goles",  max_pred_goals_scored$expected_goals_scored, "hubiera sido contra", max_pred_goals_scored$opponent))

min_pred_goals_againts <- subset(la_galaxy_if_messi, la_galaxy_if_messi$expected_goals_againts == min(la_galaxy_if_messi$expected_goals_againts))

print(paste("La menor cantidad de goles en contra",  min_pred_goals_againts$expected_goals_scored, "hubiera sido contra", min_pred_goals_againts$opponent))