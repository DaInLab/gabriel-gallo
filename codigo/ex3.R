if(!("readxl") %in% installed.packages()) install.packages("readxl")

library(readxl)
teste <- c(rep(0,17),rep(1,20),rep(2,28),rep(3,19),rep(4,7),rep(5,4),rep(6,5))

teste
frequencia <- as.matrix(table(teste))
frequencia
media <- mean(teste)
media
mediana <- median(teste)
mediana
#medianation.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
moda <- getmode(teste)
moda
dados <- c(mediana,moda)
help(barplot)
pdf("./gráficos/exerc3.pdf")
legenda <- as.matrix(c("Mediana","Moda"))
plot <- barplot(ylim=c(0,6),space=0.2,cex.names=0.7, dados,ylab ="Números de Filhos" , main="Dados Exercício 3", names.arg =legenda,col=rainbow(2))
text(plot,dados+0.5, labels= as.character(dados))
dev.off()

