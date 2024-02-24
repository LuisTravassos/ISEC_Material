#Luis Henrique P. O. Travassos
#2021136600

#Gestao de Recursos
from pulp import *

# Definir parâmetros
c=[5.5, 6, 6.5, 8, 8.5]
a=[[1, 0, 0, 0, 0],[0, 1, 0, 0, 0],
   [0, 0, 1, 0, 0],[0, 0, 0, 1, 0],
   [0, 0, 0, 0, 1],[0, 0, 0, 0, 1],
   [1, 1, 1, 1, 1]]
b=[200, 350, 400, 450, 150, 300, 2000]

# Criar modelo
model = LpProblem("T-shirts", LpMaximize)

# Definir variaveis de decisao do modelo (vetor)
x = {j: LpVariable(name=f"x{j}", lowBound=0) for j in range(1, 6)}

# Adicionar funcao objetivo ao modelo
model += lpSum([c[j] * x[j+1]] for j in range(5))

# Adicionar restricoes ao modelo
for i in range(5):
    model += lpSum([a[i][j] * x[j+1]] for j in range(5)) >= b[i]
    
for i in range(5, 7):
    model += lpSum([a[i][j] * x[j+1]] for j in range(5)) <= b[i]

# Visualizar modelo
print("----Modelo----")
print (model)

# Resolver modelo
model.solve()

# Mostrar resultados
print("----Resultados----")
print (f"Estado: {model.status} <=> {LpStatus[model.status]}") 
print (f"z* = {model.objective.value()}")

for var in model.variables():
    print(f"{var.name}* = {var.value()}")
for name, constraint in model.constraints.items(): 
    print (f" {name}): {constraint.value()}")
    
'''
Interpretação dos resultados:
De acordo com os valores obtidos para as variáveis de decisão e 
função objetivo, a empresa deve produzir mensalmente 200 T-shirts XS, 350
T-shirts S, 400 T-shirts M, 750 T-shirts L e 300 T-shirts XL, 
conseguindo, dessa forma, um lucro máximo de 14350€ mensalmente. 
Dados os valores das restrições, podemos concluir que a encomenda de T-shirts 
de tamanho L vai ultrapassar 300 unidades o valor minimo e a encomenda de 
T-shirts de tamanho XS vai ser limitada ao ser valor minimo.
'''