
# Descenso por Gradiente vs Método Heurístico

![Rastrigin 2D](https://raw.githubusercontent.com/fmunoze/RNA-Optimizacin-heuristica/refs/heads/main/parte1/GIF.gif)

El descenso por gradiente (punto ver) y los métodos heurísticos representan dos enfoques diferentes para la optimización. El descenso por gradiente sigue un camino determinista, utilizando la información de las derivadas para moverse en la dirección de máximo descenso. Este método es muy eficiente en funciones suaves, pero puede quedar atrapado en mínimos locales y requiere que la función sea diferenciable.

Por otro lado, los métodos heurísticos (punto rojo)  adoptan un enfoque más exploratorio, utilizando elementos aleatorios y estrategias basadas en población para buscar soluciones. Aunque generalmente son más lentos en converger, tienen una mayor capacidad para escapar de mínimos locales y pueden manejar funciones no diferenciables.