if(!("readxl") %in% installed.packages()) install.packages("readxl")

library(readxl)

df <- read_excel("./dados/exercicio4.xls")
df  
tabela <- table(df$Salários)
tabela
summary(df$Salários)
brk <- c(5,7,9,11,13)
classes <- c("5-7","7-9","9-11","11-13")
pdf("./gráficos/exerc4.pdf")

barplot(table(cut(df$Salários,breaks=brk,right=FALSE,labels=classes)),main="Distribuição de Frequências",ylab="X Salários Mínimos",xlab="Funcionários",col=rainbow(4))

hist(df$Salários,main="Histograma", xlab="Salários", ylab="Frequência",col="light blue")
dev.off()

