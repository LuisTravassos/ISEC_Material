# 1o Problema de PLMO

# Importar biblioteca PuLP
from pulp import *

# Importar sub-modulo Pyplot da biblioteca Matplotlib
import matplotlib.pyplot as plt

# Importar biblioteca Pandas para poder guardar dados em formato Dataframe
import pandas as pd

# Inicializar um DataFrame vazio para guardar resultados da otimização
results = pd.DataFrame(columns=["alpha","x1_opt", "x2_opt", "z1","z2"])

# Criar variáveis de decisão
x1=LpVariable("x1", lowBound=0) 
x2=LpVariable("x2", lowBound=0)

# Definir tamanho do passo (incremento)
step = 0.01

# Iterar para valores de alpha (peso) entre 0 e 1 com incremento step, e 
#guardar resultados no DataFrame
for i in range(0, 101, int (step*100)):
    
    # Criar novo modelo
    model=LpProblem("PLMO_1", LpMaximize)
    
    # Adicionar funcao objetivo como soma ponderada de z1 e z2
    alpha=i/100
    model += alpha* (2*x1+3*x2)+(1-alpha)*(4*x1-2*x2)
    
    # Adicionar restricoes
    model += x1 + x2 <= 10
    model += 2*x1 + x2 <= 15
    
    # Resolver problema
    model.solve()
    
    # Guardar resultados no DataFrame
    results.loc[i] = [alpha,
                      value(x1), value(x2),
                      value(alpha*(2*x1+3*x2)),
                      value((1-alpha)*(4*x1-2*x2))]

# Visualizar resultados de otimizacao numa tabela
for i in range(0,100,15):
    print(results[i:i+15])
    input("Press ENTER key to continue...")
    
# Visualizar resultados de otimizacao num grafico.
#-- Inicializar tamanho da figura
plt.figure(figsize=(28,18))

#-- Criar grafico de linhas
plt.plot(results["alpha"], results["z1"],color="red", label="z1") 
plt.plot(results["alpha"], results["z2"],color="blue",label="z2")
plt.legend(loc= "upper left")

#-- Adicionar legendas dos eixos
plt.xlabel("alpha (weight)", size=20)
plt.ylabel("objective_values",size=20)

#-- Adicionar titulo ao grafico
plt.title("Objective Functions z1 and z2",size=32) 

#-- Mostrar grafico / Show plot
plt.show()

"""
Interpretação dos resultados
Pela análise da tabela percebe-se que, apesar dos 100 valores diferentes de z1 
e de z2, decorrentes da variação de , apenas são apresentadas 3 soluções 
(pares de valores x1 e x2) que correspondem aos vértices da região eficiente 
(sugere-se resolução gráfica do problema para melhor compreensão). Note-se 
que as restantes soluções eficientes podem ser obtidas como combinação linear 
convexa destas últimas.
"""