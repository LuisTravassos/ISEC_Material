#2o Problema de PLMO

# Importar biblioteca PuLP
from pulp import *

# Importar sub-modulo Pyplot da biblioteca Matplotlib
import matplotlib.pyplot as plt 

# Importar biblioteca Pandas para poder guardar dados em formato Dataframe
from pandas import DataFrame

# Inicializar um DataFrame vazio para guardar resultados da otimização
results = DataFrame(columns=["alpha","x1_opt","x2_opt","z1","z2"])

# Criar variáveis de decisão
x1=LpVariable("x1",lowBound=0)
x2=LpVariable("x2",lowBound=0)

# Definir tamanho do passo (incremento)
step = 0.01

# Iterar para valores de alpha (peso) entre 0 e 1 com incremento step, 
# e guardar resultados no DataFrame
for i in range(0,101):
    
        # Criar novo modelo
        model=LpProblem("PLMO_2/MOLP_2",LpMaximize)
        
        # Adicionar funcao objetivo como soma ponderada de z1 
        # e z2: z = alpha*z1 + (1-alpha)*z2
        alpha=i/100
        model += alpha*(x1+x2)+(1-alpha)*(2*x1)
        
        # Adicionar restricoes
        model += -3*x1 + 3*x2 <= 6
        model += 4*x1 + 3*x2 <= 12
        model += x1 - x2 <= 2
        
        # Resolver problema
        model.solve()
        
        # Guardar resultados no DataFrame
        results.loc[i] = [alpha,
                          value(x1),
                          value(x2),
                          value(alpha*(x1+x2)),
                          value((1-alpha)*(2*x1))]

# Visualizar resultados de otimizacao numa tabela
for i in range(0,100,15):
       print(results[i:i+15])
       input("Press ENTER key to continue...")
    
# Visualizar resultados de otimizacao num grafico
# -- Inicializar tamanho da figura
plt.figure(figsize=(20,10))

# -- Criar grafico de linhas
plt.plot(results["alpha"],results["z1"],color="red",label="z1")
plt.plot(results["alpha"],results["z2"],color="blue",label="z2")
plt.legend(loc="upper center")

# -- Adicionar legendas dos eixos
plt.xlabel("alpha (weight)",size=20)
plt.ylabel("objective_values",size=20)

# -- Adicionar tรญtulo ao grafico
plt.title("Objective Functions z1 and z2",size=32)

# -- Mostrar grafico
plt.show()

"""
Interpretação dos resultados
Esta abordagem serve principalmente para determinar os pontos extremos da 
região eficiente que, neste caso, correspondem simplemente aos ótimos 
individuais de z1 e z2. Estes pontos são facilmente obtidos pela 
análise da tabelas.
"""


