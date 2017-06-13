# Rodolfo Ferro Pérez
# ferro@cimat.mx
# Modelado de datos con Beta Generalizada de Tipo II.

# Liberar memoria:
rm(list=ls())
# Set path:
setwd("/Users/RodolfoFerro/Desktop/computer/simulación")

#=============== Ajuste de parámetros: ===============#
library(laeken)

files = c("sGB2.csv", "sLNORM.csv", "smixLNORM.csv")
for (file_name in files) {
  # Leer datos simulados desde csv:
  simulations = read.csv(file=file_name, header = TRUE, sep = ",")
  #print(simulations[,1])
  
  # Ajuste de Máxima verosimiltud:
  print(file_name)
  maxlike_fit = mlfit.gb2(simulations[,1])
  
  # Resultados:
  print(maxlike_fit[[1]])
  
  # Escribir resultados en archivo:
  write(file_name, file = "fit.txt", append = TRUE)
  write.table(maxlike_fit[[1]], file = "fit.txt", append = TRUE)
  write("\n\n", file = "fit.txt", append = TRUE)
}
