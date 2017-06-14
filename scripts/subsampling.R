# Rodolfo Ferro Pérez
# ferro@cimat.mx
# Toma de muestras aleatorias de simulaciones y datos reales.

# Liberar memoria:
rm(list=ls())

# IMPORTANTE: Si utilizas RStudio, hay que definir el directorio de trabajo
# al de los archivos fuente, puedes ver el directorio actual con getwd()

# Breaks para histogramas:
breaks = 30


#================== Toma de muestras: ==================#
library(laeken)
library(boot)
library(MASS)

# Filenames and paths:
path_to_csv = "../csv/"
path_to_plt = "../plots/"
sim_prefix  = "sim_"
hist_prefix = "hist_"
files = c("GB2", "LNorm", "LNormMix")
real_data = "mcs_ingresos_2014_concil_2010_csv.csv"

# Tamaño de submuestras:
N = c(200, 500)

for (n in N){
  
  # For simulated data:
  for (file_name in files) { 
    # Leer datos reales desde csv:
    datos = read.csv(file=paste(path_to_csv, sim_prefix, file_name, ".csv", sep=''), header = TRUE, sep = ",")
    
    # Toma de submuestras con semilla aleatoria:
    set.seed(321)
    subsample = datos[sample(1:nrow(datos), n), 1]
    #print(subsample)
    
    #================ Histograma de datos: =================#
    # Graficamos histograma:
    png(paste(path_to_plt, hist_prefix, file_name, "_", n, ".png", sep=''), width=4, height=4, units="in", res=300) # Para iniciar el guardado de imagen
    hist(subsample,freq=F,main=paste("Histograma de ", n, " datos ", file_name, sep=''),
         xlab="Datos",ylab="Frecuencia de datos",
         border="white", col="firebrick3", breaks=breaks) 
    #lines(density(subsample, adjust=1.0), col="steelblue", lwd=2)
    dev.off() # Fin de guardado de imagen
    
    # Guardamos como csv:
    write.table(subsample, file = paste(path_to_csv, "samp_", file_name, "_", n, ".csv", sep=''), sep = ",")
  }
  
  # For real data:
  
  # Leer datos reales desde csv:
  datos = read.csv(file=paste(path_to_csv, real_data, sep=''), header = TRUE, sep = ",")
  
  # Toma de submuestras con semilla aleatoria:
  set.seed(321)
  subsample = datos[sample(1:nrow(datos), n), 18]
  #print(subsample)
  
  #================ Histograma de datos: =================#
  # Graficamos histograma:
  png(paste(path_to_plt, hist_prefix, "RealData_", n, ".png", sep=''), width=4, height=4, units="in", res=300) # Para iniciar el guardado de imagen
  hist(subsample,freq=F,main=paste("Histograma de ", n, " datos ", "RealData", sep=''),
       xlab="Datos",ylab="Frecuencia de datos",
       border="white", col="firebrick3", breaks=breaks) 
  #lines(density(subsample, adjust=1.0), col="steelblue", lwd=2)
  dev.off() # Fin de guardado de imagen
  
  # Guardamos como csv:
  write.table(subsample, file = paste(path_to_csv, "samp_RealData", "_", n, ".csv", sep=''), sep = ",")
}

