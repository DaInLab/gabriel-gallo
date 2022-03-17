if (!require(tidyverse)) {
  install.packages("tidyverse")
  library(tidyverse)
}

if (!require(readxl)) {
  install.packages("readxl")
  library(readxl)
}

df.mortes <- read_excel("./dados/covid_19_bauru_mortes.xlsx", 
                        col_types = c("date", "text", "numeric", "date","text","text", "date", "numeric"))
df.geral <- read_excel("./dados/covid_19_bauru_casos_geral.xlsx")



















temp.idade <- df.mortes$idade[!is.na(df.mortes$idade)]
table(temp.idade)
pct.idade = round(unname(table(temp.idade))) 
pct.idade = paste0(pct.idade, "%")


graph.age <- barplot(table(temp.idade), main = "Figura 1. Distribuição de óbitos por Idade",
                     ylab = "Número de Óbitos", ylim = c(0,(max(table(temp.idade))+10)),
                     xlab = "Idades",)
#Fim figura 1

if (!require(lubridate)) {
  install.packages("lubridate")
  library(lubridate)
}

th <- c()
tph <- c()
i <- 1
j <- 0
while (i <= nrow(df.mortes)) {
  if(!is.na(df.mortes$inicio_sintoma[i]) && !is.na(df.mortes$data_obito[i]) && !is.na(df.mortes$tipo_hosp[i])) {
    j = j + 1
    th[j] = ymd_hms(df.mortes$data_obito[i], truncated = 3) - ymd_hms(df.mortes$inicio_sintoma[i], truncated = 3)
    tph[j] = df.mortes$tipo_hosp[i]
  }
  i = i + 1
}

table(tph)
th
internacao <- table(th,tph)
internacao

graph.inter<- barplot(internacao, main = "Figura 2. Tipos e tempo de permanência hospitalar",
                      ylab = "Numeros de dias", 
                      xlab = "Tipos de internação")

#Fim figura 2

temp.doses <- df.mortes$doses_vacina[!is.na(df.mortes$doses_vacina)]
table(temp.doses)
pct.doses = round(unname(table(temp.doses))) 
pct.doses = paste0(pct.doses, "%")


graph.doses <- barplot(table(temp.doses), main = "Figura 3. Relação entre óbitos ocorridos e a vacinação dos falecidos",
                     ylab = "Número de Óbitos", ylim = c(0,(max(table(temp.doses))+10)),
                     xlab = "Doses da Vacina",)