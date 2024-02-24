#nome: Luís Henrique Pessoa Oliveira Travassos
#nº: 2021136600

#Gestao de Recursos
from pulp import *

# Definir parâmetros
c=[13.8, 15.4, 18.2]
a=[[1, 1, 1],[1.4, 2.3, 0],
   [9.1, 4.5, 0],[1, 0, 0],
   [0, 1, 0]]
b=[100, 82, 290, 28, 30]

# Criar modelo
model = LpProblem("Tratamento_lixo", LpMinimize)

# Definir variaveis de decisao do modelo (vetor)
x = {j: LpVariable(name=f"x{j}", lowBound=0) for j in range(1, 4)}

# Adicionar funcao objetivo ao modelo
model += lpSum([c[j] * x[j+1]] for j in range(3))

# Adicionar restricoes ao modelo
model += lpSum([a[0][j] * x[j+1]] for j in range(3)) == b[0]

for i in range(1, 5):
    model += lpSum([a[i][j] * x[j+1]] for j in range(3)) <= b[i]

# Visualizar modelo
print("----Modelo----")
print (model)

# Resolver modelo
model.solve()

# Mostrar resultados
print("----Resultados----")
print (f"Estado: {model.status} <=> {LpStatus[model.status]}") 
print (f"z* = {round(model.objective.value(), 2)}")

for var in model.variables():
    print(f"{var.name}* = {round(var.value(), 2)}")
for name, constraint in model.constraints.items(): 
    print (f" {name}): {round(constraint.value(), 2)}")
    
'''
Interpretação dos resultados:
De acordo com os valores obtidos para as variáveis de decisão e 
função objetivo, o municipio deve queimar 20.37 toneladas de lixo, por dia,
na incineradora A, queimar 23.25 toneladas de lixo, por dia, na incineradora B 
e deve  enterrar 56.38 toneladas de lixo, por dia, no aterro sanitário, 
conseguindo, dessa forma, minimizar os custos para 1665.27€ diários. 
Dados os valores das restrições, podemos concluir que o número de particulas,
por dia, vai ser o valor maximo (290kg) e a capacidade máxima da 
incineradora B, diáriamente, não vai ser alcançada por 6.75 toneladas.
'''

