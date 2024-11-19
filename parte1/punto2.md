### Función de Rosenbrock

La función de Rosenbrock debido a su topología característica, presenta una complejidad particular:

f(x,y) = (1-x)² + 100(y-x²)²
```python
def  rosenbrock(x, y):
	return (1-x)**2  +  100*(y-x**2)**2
```
Caracteristicas:
- Un valle parabólico estrecho con curvatura pronunciada
- Gradientes locales que pueden ser engañosamente pequeños
- Una región óptima global que es difícil de localizar debido a la naturaleza curva del valle
- 
Caso de tres dimensiones:

```python
def  rosenbrock_3d(x):

	return (1-x[0])**2  +  100*(x[1]-x[0]**2)**2  + (1-x[1])**2  +  100*(x[2]-x[1]**2)**2
```
### Función de Rastrigin

La función de Rastrigin ejemplifica un problema de optimización multimodal:

f(x,y) = 20 + x² + y² - 10(cos(2πx) + cos(2πy))
```python
def  rastrigin_3d(x):
	return  30  + np.sum(x**2) -  10*np.sum(np.cos(2*np.pi*x))
```
Caracteristicas:
- Una estructura modular con periodicidad 2π en todas las dimensiones
- Un paisaje de optimización altamente rugoso con múltiples mínimos locales
- Una relación precisa entre la amplitud de las ondulaciones y el término cuadrático base

Caso de tres dimensiones:

```python
def  rastrigin_3d(x):

	return  30  + np.sum(x**2) -  10*np.sum(np.cos(2*np.pi*x))
```

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

### Descenso por Gradiente

El método de descenso por gradiente es una técnica que aprovecha la información del gradiente para explorar el espacio de una función.

1. **Rosenbrock**:
   - La convergencia es altamente sensible al punto inicial
   - Requiere tasas de aprendizaje adaptativas para manejar diferentes regiones
   - El progreso puede ser extremadamente lento cerca del valle óptimo

2. **Rastrigin**:
   - La convergencia depende críticamente de la escala de la tasa de aprendizaje
   - Los gradientes locales pueden ser engañosos debido a la naturaleza oscilatoria
   - La probabilidad de convergencia al óptimo global disminuye con la dimensionalidad

```python
def gradient_descent_adaptive_2d(f, grad_f, x0, y0, initial_lr=0.001, max_iter=1000, patience=50):
    x, y = x0, y0
    lr = initial_lr
    best_value = float('inf')
    plateau_count = 0
    path = [(x, y)]
    values = [f(x, y)]
    
    for _ in range(max_iter):
        if plateau_count >= patience:
            break
            
        grad = grad_f(x, y)
        new_x = x - lr * grad[0]
        new_y = y - lr * grad[1]
        new_value = f(new_x, new_y)
        
        if new_value < best_value:
            best_value = new_value
            plateau_count = 0
            lr *= 1.1
        else:
            lr *= 0.5
            plateau_count += 1
        
        x, y = new_x, new_y
        path.append((x, y))
        values.append(new_value)
    
    return np.array(path), np.array(values)

def gradient_descent_adaptive_3d(f, grad_f, x0, initial_lr=0.001, max_iter=1000, patience=50):
    x = x0.copy()
    lr = initial_lr
    best_value = float('inf')
    plateau_count = 0
    path = [x.copy()]
    values = [f(x)]
    
    for _ in range(max_iter):
        if plateau_count >= patience:
            break
            
        grad = grad_f(x)
        new_x = x - lr * grad
        new_value = f(new_x)
        
        if new_value < best_value:
            best_value = new_value
            plateau_count = 0
            lr *= 1.1
        else:
            lr *= 0.5
            plateau_count += 1
        
        x = new_x
        path.append(x.copy())
        values.append(new_value)
    
    return np.array(path), np.array(values)
```