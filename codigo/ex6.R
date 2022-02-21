if(!("readxl") %in% installed.packages()) install.packages("readxl")
if(!("qcc") %in% installed.packages()) install.packages("qcc")
library(readxl)
library(qcc)

df <- read_excel("./dados/exercicio6.xls")
df
numero <- df$`Nº pessoas`
names(numero) <- df$Qualidade
pdf("./gráficos/exerc6.pdf")
plot <- pareto.chart(numero, ylab="Frequência", main="Diagrama de Pareto - Números")

table(df)
teste <- as.matrix(df)

# Pequenos ajustes neste gráfico
plot <- barplot(ylim=c(0,50),df$`Nº pessoas`,
#                names.arg =df$Marcas,
                names.arg =df$Qualidade,
                col=rainbow(5),ylab="Número de Pessoas",
                xlab="Qualidade",
#                xlab="Marcas",
main="Marcas preferidas")
text(plot,df$`Nº pessoas`+2, labels= as.character(df$`Nº pessoas`))
dev.off()

