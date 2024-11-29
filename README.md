# Optimización Numérica y Combinatoria

Este proyecto tiene como objetivo abordar problemas de optimización numérica y combinatoria utilizando diferentes técnicas y algoritmos. En la primera parte, se realiza la optimización de funciones matemáticas en varias dimensiones utilizando métodos de optimización como el descenso por gradiente, algoritmos evolutivos, optimización de partículas y evolución diferencial. En la segunda parte, se resuelve el problema del vendedor viajero (TSP) utilizando colonias de hormigas y algoritmos genéticos.

## Contenido

### Parte 1: Optimización Numérica
En esta sección, se abordan dos funciones de prueba seleccionadas: la **Función de Rosenbrock** y la **Función de Rastrigin**. Estas funciones se optimizan en dos y tres dimensiones utilizando distintos enfoques:
1. **Método de descenso por gradiente** con condiciones iniciales aleatorias.
2. **Métodos heurísticos** como algoritmos evolutivos, optimización de partículas y evolución diferencial.
3. **Representación visual** de los procesos de optimización mediante GIFs animados.

### Parte 2: Optimización Combinatoria
En esta sección, se aborda el problema del **Vendedor Viajero** utilizando:
1. **Colonias de hormigas** para encontrar el orden óptimo de las ciudades.
2. **Algoritmos genéticos** para resolver el mismo problema.


### Metodología
La metodología seguida en este proyecto incluye la implementación de los algoritmos mencionados, pruebas de optimización y la representación visual de los resultados. La optimización de funciones se realizó mediante la implementación de código en Python, mientras que la parte combinatoria del vendedor viajero se abordó utilizando métodos de inteligencia artificial.

## Requerimientos

- **Python 3.x**
- **Bibliotecas necesarias:**
  - `numpy`
  - `matplotlib`
  - `scipy`
  - `openturns`
  - `deap` (para algoritmos evolutivos)

## Instalación

1. Clona este repositorio:
    ```bash
    git clone https://github.com/tu_usuario/optimizacion-numerica-combinatoria.git
    cd optimizacion-numerica-combinatoria
    ```

2. Instala las dependencias:
    ```bash
    pip install -r requirements.txt
    ```

## Resultados

Los resultados de las optimizaciones se incluyen en los archivos generados. Se proporcionan representaciones gráficas y animadas del proceso de optimización, que muestran el comportamiento de los algoritmos utilizados.

### Ejemplos de Resultados:
- **Optimización de la Función de Rosenbrock**: Se muestra la convergencia de los métodos de optimización en 2D y 3D.
- **Optimización de la Función de Rastrigin**: Se comparan los resultados obtenidos con métodos heurísticos frente al descenso por gradiente.

## Bibliografía

1. OpenTurns. (2024, noviembre 25). *Quick start guide to optimization* [Guía de inicio rápido para optimización]. OpenTurns. https://openturns.github.io/openturns/latest/auto_numerical_methods/optimization/plot_optimization_rosenbrock.html
2. The Generalized Rastrigin Function. (2024). *The Generalized Rastrigin Function*. Universidad de Málaga. http://tracer.lcc.uma.es/problems/rastrigin/rastrigin.html

## Reporte de Contribución Individual

- **Pablo Andrés Usuga Gómez**  
  - Correcciones y análisis de la primera parte (optimización numérica).  
  - Elaboración del blog y del reporte de contribución individual.  
  - Selección de la bibliografía de soporte.  

- **Russbell Noreña Mejía**  
  - Desarrollo de la segunda parte (optimización combinatoria).  
  - Implementación de algoritmos relacionados con el problema del vendedor viajero.  

- **Samuel Rivera Botero**  
  - Correcciones y análisis de la segunda parte del trabajo.  
  - Revisión final del reporte y aseguramiento de la coherencia general del trabajo.

- **Felipe Muñoz Echeverri**  
  - Desarrollo de la primera parte (optimización numérica).  
  - Implementación de los algoritmos de optimización y pruebas en dos y tres dimensiones.
