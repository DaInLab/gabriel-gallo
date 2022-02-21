if(!("readxl") %in% installed.packages()) install.packages("readxl")

library(readxl)

df <- read_excel("./dados/exercicio1.xls")
df
summary(df)
media <- mean(df$`Taxas de juros`)
media
mediana <- median(df$`Taxas de juros`)
mediana
desvio <-  sd(df$`Taxas de juros`)
variancia <- var(df$`Taxas de juros`)
minimo <- min(df$`Taxas de juros`)
#maximo
maximo <- max(df$`Taxas de juros`)
#quartis 
quartis <- quantile(df$`Taxas de juros`)
quartis
q1 <- quartis[2]
q3 <- quartis[4]
dados <- c(media, mediana, desvio, variancia, minimo, maximo, q1, q3)
help(barplot)
barplot(dados)
dados
dados <- round(dados,3)
legenda <- as.matrix(c("Media","Mediana","DP","Variância","Minimo","Maximo","Q1","Q3"))
pdf("./gráficos/exerc1.pdf")
plot <- barplot(ylim=c(0,3),space=0.5,cex.names=0.8, dados,ylab ="Taxas de Juros" , main="dados do exercicio 1", names.arg =legenda,col=rainbow(8))
text(plot,dados+0.2, labels= as.character(dados))
dev.off()
