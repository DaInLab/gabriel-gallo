if(!("readxl") %in% installed.packages()) install.packages("readxl")

library(readxl)

df <- read_excel("./dados/exercicio7.xls")
df
table(df)
teste <- as.matrix(df)
pdf("./gráficos/exerc7.pdf")

plot <- barplot(ylim=c(0,400),df$Atendimento,names.arg =df$Áreas,col=rainbow(5),ylab="Número de Atendimentos",xlab="Áreas",main="Atendimentos realizados")
text(plot,df$Atendimento+15, labels= as.character(df$Atendimento))
dev.off()
