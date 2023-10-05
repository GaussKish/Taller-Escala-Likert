# Iniciando con R
#
# Asignación de variables: En R, puedes asignar valores a variables utilizando el operador <- o =.  ----
# Aquí hay un ejemplo:
x <- 5
y <- 3

#Operaciones aritméticas: Puedes realizar operaciones matemáticas básicas como suma, resta, multiplicación y división:----
suma <- x + y
resta <- x - y
multiplicacion <- x * y
division <- x / y

#Funciones matemáticas: R tiene una variedad de funciones matemáticas incorporadas que puedes utilizar. Por ejemplo:----
raiz_cuadrada <- sqrt(x)
exponencial <- exp(x)
logaritmo <- log(x)

#Vectores: Los vectores son una estructura fundamental en R. Puedes crear vectores utilizando la función c():----
vector_numerico <- c(1, 2, 3, 4, 5)
vector_caracteres <- c("manzana", "banana", "naranja")

#Indexación de vectores: Puedes acceder a elementos específicos de un vector utilizando índices:----
primer_elemento <- vector_numerico[1]
segundo_elemento <- vector_numerico[2]

#Funciones en vectores: Puedes aplicar funciones a todos los elementos de un vector de manera eficiente:----
doble_vector <- vector_numerico * 2

#Matrices: Las matrices son estructuras bidimensionales en R. Puedes crear matrices utilizando la función matrix():----
matriz <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)

#Data frames: Los data frames son estructuras de datos tabulares similares a hojas de cálculo.----
#Puedes crear data frames utilizando la función data.frame():
data <- data.frame(nombre = c("Juan", "María", "Pedro"), edad = c(25, 30, 28))

#Funciones personalizadas: Puedes crear tus propias funciones en R: ----
mi_funcion <- function(a, b) {
  resultado <- a + b
  return(resultado)
}

resultado_final <- mi_funcion(10, 15)

#Gráficos: R es conocido por su capacidad de visualización. Puedes crear gráficos utilizando la librería ggplot2:----
library(ggplot2)

datos <- data.frame(x = 1:10, y = c(3, 6, 9, 5, 8, 12, 15, 10, 7, 4))

grafico <- ggplot(datos, aes(x, y)) + geom_point()
grafico

# Guardar el gráfico en formato PNG con alta resolución (300 ppp  o más)----
ggsave("mi_grafico.jpg", plot = grafico, dpi = 300)

# Crear un gráfico de ejemplo
x <- 1:10
y <- c(3, 6, 9, 5, 8, 12, 15, 10, 7, 4)
plot(x, y, type = "p", pch = 16, col = "blue")



