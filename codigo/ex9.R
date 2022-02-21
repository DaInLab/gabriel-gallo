if(!("readxl") %in% installed.packages()) install.packages("readxl")

library(readxl)

df <- read_excel("./dados/exercicio9.xls")
df
salarios <- df$Salários
salarios
summary(salarios)

help(hist)
hist(salarios,nclass = 2)
brk <- c(seq(4,26,2))
brk
classes <- c("4-6","6-8","8-10","10-12","12-14","14-16","16-18","18-20","20-22","22-24","24-26")
pdf("./gráficos/exerc9.pdf")
help(plot)
barplot(ylim=c(0,20),cex.names=0.7,table(cut(salarios,breaks=brk,right=FALSE,labels=classes)),main="Distribuição de Frequências ",ylab="Número de Funcionários",xlab="Salário (X Salários Mínimo)",col=rainbow(11))

hist(salarios,main="Histograma",breaks = seq(4,26,2),ylab = "Número de Funcionários",xlab="Salário (X Salários Mínimo)", col="light blue")

dev.off()

