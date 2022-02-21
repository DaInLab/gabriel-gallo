if(!("readxl") %in% installed.packages()) install.packages("readxl")

library(readxl)

df <- read_excel("./dados/exercicio5.xls")
df
table(df)
teste <- as.matrix(df)
pdf("./gráficos/exerc5.pdf")

plot <- barplot(ylim=c(0,50),df$`Nº pessoas`,names.arg =df$Marcas,col=rainbow(5),ylab="Número de Pessoas",xlab="Marcas",main="Marcas Preferidas")
text(plot,df$`Nº pessoas`+2, labels= as.character(df$`Nº pessoas`))
dev.off()
