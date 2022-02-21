if(!("readxl") %in% installed.packages()) install.packages("readxl")

library(readxl)

df <- read_excel("./dados/exercicio2.xls")
df
frequencia <- table(df$Casas)

print("Tabela de frequência")
frequencia
media <- mean(df$Casas)
media
mediana <- median(df$Casas)
mediana
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
moda <- getmode(df$Casas)
moda
amplit <- range(df$Casas)
amplit
dp <-  sd(df$Casas)
var <- var(df$Casas)
min <- min(df$Casas)
max <- max(df$Casas)
quartis <- quantile(df$Casas)
q1 <- quartis[2]
q3 <- quartis[4]
x <- seq(-pi,pi,0.1)
pdf("./gráficos/exerc2.pdf")
plot(x, sin(x))
dados <- c(media, mediana,moda, dp, var, min, max, q1, q3)
help(barplot)
#pdf("./gráficos/exerc2.pdf")

barplot(frequencia, main = "Tabela de Frequência",cex.names = 0.5,space=0.5)
dados <- round(dados,3)
legenda <- as.matrix(c("Media","Mediana","Moda","DP","Variância","Minimo","Maximo","Q1","Q3"))
plot <- barplot(ylim=c(0,700),space=0.2,cex.names=0.7, dados,ylab ="Números de Casas" , main="Dados do exercício 2", names.arg =legenda,col=rainbow(9))
text(plot,dados+10, labels= as.character(dados))
dev.off()
