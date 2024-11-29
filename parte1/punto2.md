
## Función de Rosenbrock

La función de Rosenbrock, introducida por Howard H. Rosenbrock en 1960, representa un problema de optimización no convexa. Su formulación bidimensional se define como: 
f(x,y) = (1-x)² + 100(y-x²)²
  
```python
def  rosenbrock(x, y):

	return (1-x)**2  +  100*(y-x**2)**2
```

Características:
- Forma un valle elíptico parabólico
- Su punto mínimo se encuentra en (1,1), donde f(1,1) = 0
- Es una función no convexa
- La curvatura del valle varía significativamente

La versión tridimensional de la función extiende estos conceptos a un espacio de tres dimensiones:

```python
def  rosenbrock_3d(x):

	return (1-x[0])**2  +  100*(x[1]-x[0]**2)**2  + (1-x[1])**2  +  100*(x[2]-x[1]**2)**2
```

## Función de Rastrigin

La función de Rastrigin presenta una estructura matemática diferente, caracterizada por múltiples mínimos locales. Su formulación bidimensional se expresa como:
f(x,y) = 20 + x² + y² - 10(cos(2πx) + cos(2πy))

```python
def  rastrigin(x, y):

	return  20  + x**2  + y**2  -  10*(np.cos(2*np.pi*x) + np.cos(2*np.pi*y))
```

Características:
- Una base cuadrática modulada por funciones coseno
- Un punto mínimo global en (0,0), donde f(0,0) = 0
- Múltiples puntos críticos distribuidos regularmente
- Una estructura simétrica y periódica

La extensión tridimensional de la función Rastrigin se expresa como:

```python
def  rastrigin_3d(x):

	return  30  + np.sum(x**2) -  10*np.sum(np.cos(2*np.pi*x))
```


 ## Gradientes
 
El gradiente de estas funciones proporciona información esencial sobre la dirección del descenso más pronunciado en cada punto del espacio.

### El Gradiente de Rosenbrock

```python
def  rosenbrock_gradient(x, y):

	dx =  -2*(1-x) +  200*(y-x**2)*(-2*x)
	dy =  200*(y-x**2)

	return np.array([dx, dy])
```

- La componente `dx` combina dos términos que reflejan la curvatura del valle
- La componente `dy` es proporcional a la diferencia entre `y` y `x²`, indicando la profundidad del valle

Caso tridimensional:

```python
def  rosenbrock_gradient_3d(x):

	dx =  -2*(1-x[0]) +  200*(x[1]-x[0]**2)*(-2*x[0])
	dy =  200*(x[1]-x[0]**2) -  2*(1-x[1]) +  200*(x[2]-x[1]**2)*(-2*x[1])
	dz =  200*(x[2]-x[1]**2)

	return np.array([dx, dy, dz])
```
- La componente `dy` actúa como un puente entre las dimensiones
- El término `dz` mantiene una estructura similar a `dy` en el caso 2D

### El Gradiente de Rastrigin

El gradiente de la función de Rastrigin en dos dimensiones presenta una estructura periódica:

```python
def  rastrigin_gradient(x, y):

	dx =  2*x +  20*np.pi*np.sin(2*np.pi*x)
	dy =  2*y +  20*np.pi*np.sin(2*np.pi*y)

	return np.array([dx, dy])
```

- Un término lineal (`2x`, `2y`) que proporciona una tendencia general
- Un término sinusoidal que crea oscilaciones periódicas
- La amplitud de las oscilaciones es constante en todo el dominio

Caso tridimensional:

```python
def  rastrigin_gradient_3d(x):

	return  2*x +  20*np.pi*np.sin(2*np.pi*x)
```

## Método de Descenso por Gradiente

Tras analizar las funciones y sus gradientes, es momento de examinar cómo podemos utilizar esta información. El método de descenso por gradiente es una técnica que aprovecha la información del gradiente para explorar el espacio de una función.

### Implementación en Dos Dimensiones

```python
def  gradient_descent_2d(f, grad_f, x0, y0, learning_rate=0.001, n_iterations=1000):

	path = [(x0, y0)]
	values = [f(x0, y0)]
	x, y = x0, y0

	for _ in  range(n_iterations):
		grad =  grad_f(x, y)
		x = x - learning_rate * grad[0]
		y = y - learning_rate * grad[1]
		path.append((x, y))
		values.append(f(x, y))

	return np.array(path), np.array(values)
```

 **Parámetros de Entrada**:
-  `f`: La función matemática que estamos analizando
-  `grad_f`: Su gradiente correspondiente
-  `x0, y0`: El punto inicial
-  `learning_rate`: Factor que controla el tamaño de  paso
-  `n_iterations`: Número de pasos a realizar

### Caso en Tres Dimensiones
```python
def  gradient_descent_3d(f, grad_f, x0, learning_rate=0.001, n_iterations=1000):

	path = [x0.copy()]
	values = [f(x0)]
	x = x0.copy()

	for _ in  range(n_iterations):
		grad =  grad_f(x)
		x = x - learning_rate * grad
		path.append(x.copy())
		values.append(f(x))

	return np.array(path), np.array(values)
```
- Trabajo con vectores tridimensionales
- Operaciones vectorizadas para mayor eficiencia

### Aspectos Importantes

-  **Tasa de Aprendizaje**:
	- Un valor pequeño (0.001) asegura movimientos controlados
	- Debe balancear entre precisión y velocidad de convergencia

-  **Número de Iteraciones**:
	- Mayor número de iteraciones no siempre significa mejor resultado
	- Sirve como criterio de parada del algoritmo


## Ejemplos

Veamos ejemplos concretos para cada una de nuestras funciones.

```python
def  plot_function_2d(f, path, title, x_range=(-2, 2), y_range=(-2, 2), n_points=100):
	x = np.linspace(x_range[0], x_range[1], n_points)
	y = np.linspace(y_range[0], y_range[1], n_points)
	X, Y = np.meshgrid(x, y)
	Z = np.zeros_like(X)

	for i in  range(n_points):
		for j in  range(n_points):
			Z[i,j] =  f(X[i,j], Y[i,j])
	
	fig = plt.figure(figsize=(15, 5))

	# Surface plot
	ax1 = fig.add_subplot(121, projection='3d')
	surf = ax1.plot_surface(X, Y, Z, cmap='viridis', alpha=0.8)
	ax1.plot(path[:,0], path[:,1], [f(x,y) for x,y in path], 'r.-', label='Trayectoria')
	ax1.set_title(f'Superficie - {title}')
	fig.colorbar(surf, ax=ax1)

	# Contour plot
	ax2 = fig.add_subplot(122)
	contours = ax2.contour(X, Y, Z, levels=20)
	ax2.plot(path[:,0], path[:,1], 'r.-', label='Trayectoria')
	ax2.plot(path[0,0], path[0,1], 'go', label='Inicio')
	ax2.plot(path[-1,0], path[-1,1], 'ro', label='Final')
	ax2.set_title(f'Contornos - {title}')
	ax2.legend()
	plt.colorbar(contours, ax=ax2)
	plt.tight_layout()
	
	return fig

  

def  plot_convergence_with_function_3d(f, path, values, title):

	fig = plt.figure(figsize=(15, 5))

	# Trayectoria 3D
	ax1 = fig.add_subplot(121, projection='3d')
	ax1.plot3D(path[:, 0], path[:, 1], path[:, 2], 'r.-', alpha=0.5)
	ax1.scatter(path[0, 0], path[0, 1], path[0, 2], color='g', label='Inicio')
	ax1.scatter(path[-1, 0], path[-1, 1], path[-1, 2], color='r', label='Final')

	# Crear una malla para visualizar la superficie
	x = np.linspace(-2, 2, 20)
	y = np.linspace(-2, 2, 20)
	z = np.linspace(-2, 2, 20)
	X, Y, Z = np.meshgrid(x, y, z)
	points = np.column_stack([X.ravel(), Y.ravel(), Z.ravel()])
	values_surface = np.array([f(p) for p in points])
	scatter = ax1.scatter(points[:,0], points[:,1], points[:,2],
	c=values_surface, cmap='viridis', alpha=0.1, s=1)
	ax1.set_title(f'Trayectoria de Optimización 3D - {title}')
	ax1.legend()
	plt.colorbar(scatter, ax=ax1)

	# Valores de la función
	ax2 = fig.add_subplot(122)
	ax2.plot(values, 'b-')
	ax2.set_title(f'Convergencia de Valores - {title}')
	ax2.set_yscale('log')
	ax2.grid(True)
	plt.tight_layout()

	return fig
```


```python
# Ejemplo 2D - Rosenbrock
x0_2d, y0_2d = np.random.uniform(-2, 2, 2)
path_ros_2d, values_ros_2d =  gradient_descent_adaptive_2d(
rosenbrock_2d, rosenbrock_gradient_2d, x0_2d, y0_2d, initial_lr=0.0001
)

print("\nRosenbrock 2D:")
print(f"Punto inicial: ({x0_2d:.6f}, {y0_2d:.6f})")
print(f"Punto final: ({path_ros_2d[-1,0]:.6f}, {path_ros_2d[-1,1]:.6f})")
print(f"Valor final: {values_ros_2d[-1]:.6f}")
  
# Ejemplo 2D - Rastrigin
path_ras_2d, values_ras_2d =  gradient_descent_adaptive_2d(
rastrigin_2d, rastrigin_gradient_2d, x0_2d, y0_2d, initial_lr=0.01
)

print("\nRastrigin 2D:")
print(f"Punto final: ({path_ras_2d[-1,0]:.6f}, {path_ras_2d[-1,1]:.6f})")
print(f"Valor final: {values_ras_2d[-1]:.6f}")

# Ejemplo 3D - Rosenbrock
x0_3d = np.random.uniform(-2, 2, 3)
path_ros_3d, values_ros_3d =  gradient_descent_adaptive_3d(
rosenbrock_3d, rosenbrock_gradient_3d, x0_3d, initial_lr=0.0001
)

print("\nRosenbrock 3D:")
print(f"Punto inicial: {x0_3d}")
print(f"Punto final: {path_ros_3d[-1]}")
print(f"Valor final: {values_ros_3d[-1]:.6f}")

# Ejemplo 3D - Rastrigin
path_ras_3d, values_ras_3d =  gradient_descent_adaptive_3d(
rastrigin_3d, rastrigin_gradient_3d, x0_3d, initial_lr=0.01
)

print("\nRastrigin 3D:")
print(f"Punto final: {path_ras_3d[-1]}")
print(f"Valor final: {values_ras_3d[-1]:.6f}")

# Visualizaciones

# 2D con funciones
plot_function_2d(rosenbrock_2d, path_ros_2d, "Rosenbrock 2D")
plot_function_2d(rastrigin_2d, path_ras_2d, "Rastrigin 2D")

# 3D
plot_convergence_with_function_3d(rosenbrock_3d, path_ros_3d, values_ros_3d, "Rosenbrock 3D")
plot_convergence_with_function_3d(rastrigin_3d, path_ras_3d, values_ras_3d, "Rastrigin 3D")

plt.show()
```



# Casos de Prueba y Análisis de Resultados



### Función de Rosenbrock 2D


```plaintext
Punto inicial: (-0.773049, 0.633768)
Punto final:   ( 0.420778, 0.189871)
Valor final:    0.351924
```
![Rosenbrock 2D](https://raw.githubusercontent.com/fmunoze/RNA-Optimizacin-heuristica/refs/heads/main/parte1/rosenbrock2D.png)
### Función de Rastrigin 2D


```plaintext
Punto final: (-0.994959, 0.994959)
Valor final:  1.989918
```
![Rastrigin 2D](https://raw.githubusercontent.com/fmunoze/RNA-Optimizacin-heuristica/refs/heads/main/parte1/rastringin2D.png)

### Función de Rosenbrock 3D


```plaintext
Punto inicial: [1.41024978, 1.31187496, 1.85391396]
Punto final:   [1.16132328, 1.34757955, 1.82028936]
Valor final:    0.148821
```

### Función de Rastrigin 3D

```plaintext
Punto final: [0.99495864, 0.99495864, 1.98991223]
Valor final:  5.969749
```




## Analisis
Se aprecian dos limitaciones en los métodos de optimización basados en gradiente. Por un lado, el problema del gradiente desvaneciente, el cual sucede cuando el gradiente se aproxima a cero antes de alcanzar el óptimo global, lo que ralentiza la convergencia y puede llevar a un estancamiento del proceso de optimización, especialmente en funciones que presentan valles profundos o mesetas.

La presencia de mínimos locales representa un desafío en funciones no convexas, donde el algoritmo puede quedar atrapado en un minimo local. Este problema se agrava con el aumento de la dimensionalidad, lo que hace que encontrar el mínimo global sea una tarea cada vez más dificil.