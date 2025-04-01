import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Função objetivo F6(x, y)
def F6(x, y):
    return 0.5 - (((np.sin(np.sqrt(x**2 + y**2)))**2) - 0.5) / (1 + (0.001 * ((x**2) + (y**2))))**2

# Função de aptidão
def fitness(x, y):
    return F6(x, y)

# Parâmetros do AG com representação real
pop_size = 200
tcruz = 0.85  # Taxa de cruzamento
tmut = 0.01  # Taxa de mutação
generations = 500  # Número de gerações

# Inicialização da população com valores reais
population = np.random.uniform(-100, 100, (pop_size, 2))  # População com valores reais para x e y

# Inicializar variáveis para armazenar a história dos resultados
fitness_history_real = []
best_fitness_history_real = []
best_x_history_real = []
best_y_history_real = []

# Evolução
for generation in range(generations):
    # Avaliar a aptidão de cada indivíduo
    fitness_values = np.array([fitness(ind[0], ind[1]) for ind in population])

    # Seleção (por roleta proporcional)
    fitness_sum = np.sum(fitness_values)
    prob = fitness_values / fitness_sum
    selected = population[np.random.choice(pop_size, pop_size, p=prob)]

    # Cruzamento Aritmético
    for i in range(0, pop_size, 2):
        if np.random.rand() < tcruz:
            alpha = 0.35
            selected[i, :] = alpha * selected[i, :] + (1 - alpha) * selected[i + 1, :]
            selected[i + 1, :] = alpha * selected[i + 1, :] + (1 - alpha) * selected[i, :]

    # Mutação Randômica Não Uniforme
    for i in range(pop_size):
        if np.random.rand() < tmut:
            selected[i, :] += np.random.normal(0, 1, 2)

    # Atualizar a população
    population = selected

    # Melhor valor de aptidão e posição
    best_idx = np.argmax(fitness_values)
    best_x = population[best_idx, 0]
    best_y = population[best_idx, 1]
    best_fitness = fitness_values[best_idx]

    # Armazenar os resultados para gráficos
    #fitness_history_real.append(np.mean(fitness_values))
    fitness_history.append(np.max(fitness_values))
    best_fitness_history_real.append(best_fitness)
    best_x_history_real.append(best_x)
    best_y_history_real.append(best_y)

    # Plot da população a cada 10 gerações
    if generation % 10 == 0:
        fig = plt.figure()
        ax = fig.add_subplot(111, projection='3d')

        # Gerar uma grade de valores para x e y
        x = np.linspace(-100, 100, 100)
        y = np.linspace(-100, 100, 100)
        X, Y = np.meshgrid(x, y)
        Z = F6(X, Y)

        # Plotando a função F6(x, y)
        ax.plot_surface(X, Y, Z, cmap='viridis', alpha=0.5)

        # Plotando os pontos da população (valores reais de x, y)
        ax.scatter(best_x_history_real, best_y_history_real, best_fitness_history_real, color='r', marker='o')

        # Ajustes nos rótulos e título
        ax.set_xlabel('X')
        ax.set_ylabel('Y')
        ax.set_zlabel('Fitness')
        ax.set_title(f'População na Geração {generation}')

        plt.show()

# Gráfico de Convergência (melhor fitness por geração)
plt.figure()
plt.plot(best_fitness_history_real, label='Melhor Fitness', color='orange')
plt.title('Convergência do Algoritmo Genético (Real)')
plt.xlabel('Gerações')
plt.ylabel('Valor de Fitness')
plt.grid(True)
plt.legend()
plt.show()
