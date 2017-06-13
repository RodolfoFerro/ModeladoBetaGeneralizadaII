# Rodolfo Ferro Pérez
# ferro@cimat.mx
# Modelado de datos con Beta Generalizada de Tipo II.

# Liberar memoria:
rm(list=ls())

# IMPORTANTE: Si utilizas RStudio, hay que definir el directorio de trabajo
# al de los archivos fuente, puedes ver el directorio actual con getwd()


#=============== Ajuste de parámetros: ===============#
library(laeken)
library(boot)
library(MASS)

# Filenames and paths:
path_to_csv = "../csv/"
path_to_fit = "../fits/"
sub_prefix  = "samp_"
files = c("GB2", "LNorm", "LNormMix", "RealData")

# Tamaño de submuestras:
N = c(200, 500)

for (n in N){
  for (file_name in files) { 
    # Leer datos reales desde csv:
    datos = read.csv(file=paste(path_to_csv, sub_prefix, file_name, "_", n, ".csv", sep=''), header = TRUE, sep = ",")
    
    # Ajuste de Máxima verosimiltud:
    maxlike_fit = mlfit.gb2(datos[,1])
    
    # Resultados:
    print(maxlike_fit[[1]])
    
    # Escribir resultados en archivo:
    write.table(maxlike_fit[[1]], file = paste(path_to_fit, "fit_", file_name, "_", n, ".txt", sep=''))
  }
}

