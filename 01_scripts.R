
###################TALLER DE ANÁLISIS DE DATOS - ESCALA LIKERT###################################

rm(list = ls())#remoción de todos los objetos

# 01 librerías ----- 
if(!require(tidyverse)) install.packages("tidyverse")
if(!require(openxlsx)) install.packages("openxlsx")
if(!require(remotes)) install.packages("remotes")
if(!require(psych)) install.packages("psych")
if(!require(likert)) remotes::install_github('jbryer/likert')

# 02 Cargar datos ----

df <- read.csv("https://raw.githubusercontent.com/GaussKish/Taller-Escala-Likert/main/likert.csv", sep = ";")

head(df)

# 03 convertir todo a tipo factor ----
df <- df %>%
  mutate_if(is.character, as.factor) 


# 04 Objeto likert ---- 

#Elegir las columnas donde se encuentran las preguntas  2 al 12.
l11 <- likert(df[, 2:12])

# 05 Obtener tabla de resumen ----
tabla <- summary(l11)
tabla

#Guardar tabla
write.xlsx(tabla, "tabla.xlsx")

# 05 Gráficos -----
#un gráfico de barras (bar plot) utilizando el objeto de datos l11 en R. La opción type = "bar" indica que se trata de un gráfico de barras. centered = TRUE indica que las barras estarán centradas en las ubicaciones de las categorías en el eje X.
(p1 <- plot(l11, type = "bar", centered = TRUE))#centrado

(p2 <- plot(l11, type = "bar", centered = FALSE))#no centrado 

#agregando porcentajes 
#(bar plot) utilizando el objeto de datos l11. 
#La opción type = "bar" indica que se trata de un gráfico de barras. 
#centered = TRUE indica que las barras estarán centradas y 
#plot.percents = TRUE indica que los valores en el eje Y están en porcentajes.
(p3 <- plot(l11, type = "bar", centered = TRUE, plot.percents = TRUE))


#La opción group.order se utiliza para especificar el orden de los grupos en el gráfico. En este caso, colnames(df[,2:12]) se utiliza para obtener los nombres de las columnas del dataframe df desde la segunda hasta la duodécima columna, y esos nombres se utilizan como el orden de los grupos en el gráfico.
(p4 <- plot(l11,  group.order = colnames(df[ ,2:12])))

#un gráfico de calor (heatmap) utilizando el objeto de datos l11 en R. La opción type = "heat" indica que se trata de un gráfico de calor.
(p5 <- plot(l11, type = "heat"))

#un gráfico de densidad (density plot) utilizando el objeto de datos l11 en R. La opción type = "density" indica que se trata de un gráfico de densidad.
(p6 <- plot(l11, type = "density"))


#En este caso, df[,2:11] se utiliza para seleccionar las columnas 2 a 11 del dataframe df, que probablemente contienen datos en una escala de Likert. grouping = df$CNT indica que los datos se agruparán según la variable CNT en el dataframe df.
#Entonces, l11_grouped contendrá un objeto de tipo likert que representa los datos de las columnas 2 a 11 del dataframe df agrupados por la variable CNT.
l11_grouped    <-    likert(df[,2:11],    grouping =df$CNT)

# un gráfico de barras (bar plot) utilizando el objeto l11_grouped generado previamente con la función likert() del paquete likert en R. La opción type = "bar" indica que se trata de un gráfico de barras.
(p7 <- plot(l11_grouped, type= "bar"))

#Gráﬁco  de  barras  agrupado  con  histograma
plot(l11_grouped, type = "bar", include.histogram = TRUE) -> p8

#Gráﬁco de densidad agrupado
(p9 <- plot(l11_grouped, type = "density"))


# Crear un directorio para guardar los gráficos (si no existe)
dir.create("graficos_en_alta_resolucion_tablas", showWarnings = FALSE)

# Establecer la resolución deseada en ppp (píxeles por pulgada)
resolucion_ppp <- 600  # Puedes ajustar esta resolución según tus necesidades

lista_de_graficos <- list(p1,p2,p3,p4, p5, p6, p7, p8,p9)

# Iterar a través de los gráficos y guardarlos como archivos JPG

for (i in seq_along(lista_de_graficos)) {
  nombre_archivo <- paste0("graficos_en_alta_resolucion_tablas/grafico_", i, ".jpg")
  jpeg(nombre_archivo, 
       width = 12,            #ancho
       height = 9,            #altura
       units = "in",          #Pulgadas
       res = resolucion_ppp   #resolución
       )
  print(lista_de_graficos[[i]])
  dev.off()
}


