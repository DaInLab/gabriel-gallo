if(!("readxl") %in% installed.packages()) install.packages("readxl")

library(readxl)

df <- read_excel("./dados/exercicio8.xls")
df
df$...2
alturas <- c(df$`Altura dos pacientes`,df$...2,df$...3,df$...4,df$...5,df$...6,df$...7,df$...8,df$...9,df$...10)
alturas
table(alturas)
summary(alturas)

brk <- c(1.55,1.60,1.65,1.70,1.75,1.80,1.85,1.90)
classes <- c("1.55-1.60","1.60- 1.65","1.65- 1.70","1.70- 1.75","1.75- 1.80","1.80- 1.85","1.85- 1.90")
pdf("./gráficos/exerc8.pdf")

barplot(ylim=c(0,20),cex.names=0.5,table(cut(alturas,breaks=brk,right=FALSE,labels=classes)),main="Distribuição de Frequências",ylab="Pacientes",xlab="Alturas", col=rainbow(7))

hist(alturas,main="Histograma", col="light blue")
dev.off()

