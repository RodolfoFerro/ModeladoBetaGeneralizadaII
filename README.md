<img src="https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/logo.png" alt="Stochasticity" width="25%">

# Modelado de datos con distribución Beta Generalizada de Tipo II


El objetivo del proyecto es la simulación de variables aleatorias con algunas distribuciones para modelado de los datos con la distribución Beta Generalizada de Tipo II, así como el modelado (con la misma distribución) de ciertos datos reales obtenidos del INEGI, del [Módulo de Condiciones Socioeconómicas de la ENIGH (MCS-ENIGH) 2014](http://www.beta.inegi.org.mx/proyectos/enchogares/modulos/mcs/2014/). Dichos datos son los Ingresos y percepciones financieras y de capital de cada uno de los integrantes del hogar. (Un descriptor sobre estos datos puede ser encontrado en la [página del INEGI](http://internet.contenidos.inegi.org.mx/contenidos/Productos/prod_serv/contenidos/espanol/bvinegi/productos/nueva_estruc/702825070403.pdf).)

El presente repositorio contiene scripts en `R` para: (i) simular variables aleatorias con distribuciones _Beta Generalizada de Tipo II_, _Lognormal_ y mezcla de _Lognormales_; (ii) modelar las simulaciones y los datos reales del INEGI; y (iii) validar los ajustes de modelo para ver si el modelado de los datos con la distrubición _Beta Generalizada de Tipo II_ resulta adecuada.


##  Requerimientos


#### Además de tener R instalado, necesitarás instalar...


* [RStudio](https://www.rstudio.com) (recomendado)
* Librería [`GB2`](https://cran.r-project.org/web/packages/GB2/index.html)
* Librería [`distr`](https://cran.r-project.org/web/packages/distr/index.html)
* Librería [`boot`](https://cran.r-project.org/web/packages/boot/index.html)
* Librería [`MASS`](https://cran.r-project.org/web/packages/MASS/index.html)

Dichas librerías pueden fácilmente ser instaladas con el gestor de paquetes de RStudio.


## Contenido

Para correr los scripts en el orden adecuado y obtener los resultados deseados, se anexa una descripción de cada script así como los pasos a seguir para correr el código. Todos los scripts se encuentran en la carpeta [scripts](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/tree/master/scripts).


**1. [`simulations.R`](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/scripts/simulations.R)**

Este script crea 10000 simulaciones de variables aleatorias con distribuciones _Beta Generalizada de Tipo II_ (𝑎=3.25, 𝑏=17000, 𝑝=0.8, 𝑞=0.35), _Lognormal_ (𝜇=11.04465, 𝜎=1.180168) y mezcla de _Lognormales_ (𝜇<sub>1</sub>=11.04465, 𝜎<sub>1</sub>=1.180168; 𝜇<sub>2</sub>=15, 𝜎<sub>2</sub>=0.7). Las simulaciones se guardan respectivamente en los archivos [sim_GB2.csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/csv/sim_GB2.csv), [sim_LNorm.csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/csv/sim_LNorm.csv) y [sim_LNormMix.csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/csv/sim_LNormMix.csv) dentro de la carpeta [csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/tree/master/csv).


**2. [`subsampling.R`](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/scripts/subsampling.R)**

Este script submuestrea de manera aleatoria a partir de las simulaciones y de los datos reales del INEGI ([mcs_ingresos_2014_concil_2010_csv.csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/csv/mcs_ingresos_2014_concil_2010_csv.csv)), guardando las muestras en archivos _csv_ para posterior apertura por el script que hace un ajuste de parámetros de la distribución Beta Generalizada de Tipo II.

Las longitudes de los vectores de las submuestras son de 𝑛=200 y 𝑛=500. Los submuestreos se guardan en los archivos _csv_: [samp_GB2_200.csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/csv/samp_GB2_200.csv), [samp_GB2_500.csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/csv/samp_GB2_500.csv), [samp_LNorm_200.csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/csv/samp_LNorm_200.csv), [samp_LNorm_500.csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/csv/samp_LNorm_500.csv), [samp_LNormMix_200.csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/csv/samp_LNormMix_200.csv), [samp_LNormMix_500.csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/csv/samp_LNormMix_500.csv), [samp_RealData_200.csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/csv/samp_RealData_200.csv) y [samp_RealData_500.csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/csv/samp_RealData_500.csv) dentro de la carpeta [csv](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/tree/master/csv).


**3. [`fitting.R`](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/scripts/fitting.R)**

Este script utiliza la función `mlfit.gb2` de la librería `GB2` para obtener los parámetros de la distribución _Beta Generalizada de Tipo II_ que mejor se ajustan a los submuestreos de 200 y 500 utilizando _Máxima Verosimilitud_, de acuerdo a la [documentación oficial](https://cran.rstudio.com/web/packages/GB2/GB2.pdf) de la librería `GB2`.

Los parámetros obtenidos se guardaron en los archivos [fit_GB2_200.txt](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/fits/fit_GB2_200.txt), [fit_GB2_500.txt](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/fits/fit_GB2_500.txt), [fit_LNorm_200.txt](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/fits/fit_LNormMix_200.txt), [fit_LNorm_500.txt](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/fits/fit_LNormMix_500.txt), [fit_LNormMix_200.txt](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/fits/fit_LNorm_200.txt), [fit_LNormMix_500.txt](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/fits/fit_LNorm_500.txt), [fit_RealData_200.txt](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/fits/fit_RealData_200.txt) y [fit_RealData_500.txt](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/fits/fit_RealData_500.txt). Dichos fits se encunetran dentro de la carpeta [fits](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/tree/master/fits).


**4. [`validation.R`]()**


## Instrucciones

Si se utilizará _RStudio_ para trabajar los scripts, se recmoienda que como primer acción se establezca el directorio de trabajo al de los archivos fuente, como se muestra a continuación:

<img src="https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/setwd.jpg" alt="Stochasticity" width="50%"><br/><br/>


Para trabajar en los scripts de `R` anteriormente descritos, basta abrirlos en _RStudio_ y correrlos en el siguiente orden:

**Paso 1.** [`simulations.R`](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/scripts/simulations.R)<br/>
**Paso 2.** [`subsampling.R`](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/scripts/subsampling.R)<br/>
**Paso 3.** [`fitting.R`](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/scripts/fitting.R)<br/>
**Paso 4.** [`validation.R`]()<br/>

La idea general es simular primero el total de datos (paso 1) para posteriormente tomar submuestras de estas simulaciones, así como de los datos reales (paso 2) para posteriormente realizar el ajuste del modelo (paso 3) y validar dicho ajuste (paso 4).
