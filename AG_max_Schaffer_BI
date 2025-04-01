import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
def F6(x, y):
    return 0.5 - (((np.sin(np.sqrt(x**2 + y**2)))**2) - 0.5) / (1 + (0.001 * ((x**2) + (y**2))))**2

def fitness(x, y):
    return F6(x, y)

def encode(value, bits):
    scale = 100
    encoded = np.zeros(bits)
    value = (value + scale) * (2**bits - 1) / (2 * scale)  # Normalizando para [0, 2^bits-1]
    for i in range(bits):
        if (value >= 2**(bits - i - 1)):
            encoded[i] = 1
            value -= 2**(bits - i - 1)
    return encoded

def decode(binary, bits):
    scale = 100
    value = 0
    for i in range(bits):
        value += binary[i] * 2**(bits - i - 1)
    return value * (2 * scale) / (2**bits - 1) - scale  # Revertendo a normalização


n_bits = 25  # Número de bits para codificação de cada variável (x, y)
pop_size = 200  # Tamanho da população
tcruz = 0.85  # Taxa de cruzamento
tmut = 0.01  # Taxa de mutação
generations = 500  # Número de gerações


population = np.random.randint(0, 2, (pop_size, n_bits * 2))  # População binária de x e y

fitness_history = []
best_fitness_history = []
best_x_history = []
best_y_history = []


for generation in range(generations):

    fitness_values = np.array([fitness(decode(ind[:n_bits], n_bits), decode(ind[n_bits:], n_bits)) for ind in population])

    fitness_sum = np.sum(fitness_values)
    prob = fitness_values / fitness_sum
    selected = population[np.random.choice(pop_size, pop_size, p=prob)]

    for i in range(0, pop_size, 2):
        if np.random.rand() < tcruz:
            crossover_point = np.random.randint(1, n_bits * 2 - 1)
            selected[i, crossover_point:], selected[i + 1, crossover_point:] = selected[i + 1, crossover_point:], selected[i, crossover_point:]

    for i in range(pop_size):
        if np.random.rand() < tmut:
            mutation_point = np.random.randint(0, n_bits * 2)
            selected[i, mutation_point] = 1 - selected[i, mutation_point]

    population = selected

    best_idx = np.argmax(fitness_values)
    best_x = decode(population[best_idx][:n_bits], n_bits)
    best_y = decode(population[best_idx][n_bits:], n_bits)
    best_fitness = fitness_values[best_idx]

    fitness_history.append(np.max(fitness_values))  # Melhor fitness
    best_fitness_history.append(best_fitness)
    best_x_history.append(best_x)
    best_y_history.append(best_y)

    if generation % 10 == 0:
        fig = plt.figure()
        ax = fig.add_subplot(111, projection='3d')
        x = np.linspace(-100, 100, 100)
        y = np.linspace(-100, 100, 100)
        X, Y = np.meshgrid(x, y)
        Z = F6(X, Y)
        ax.plot_surface(X, Y, Z, cmap='viridis', alpha=0.5)
        ax.scatter(best_x_history, best_y_history, best_fitness_history, color='r', marker='o')
        ax.set_xlabel('X')
        ax.set_ylabel('Y')
        ax.set_zlabel('Fitness')
        ax.set_title(f'População na Geração {generation}')
        plt.show()

plt.figure()
plt.plot(best_fitness_history, label='Melhor Fitness', color='orange')
plt.title('Convergência do Algoritmo Genético (Binário)')
plt.xlabel('Gerações')
plt.ylabel('Valor de Fitness')
plt.grid(True)
plt.legend()
plt.show()
