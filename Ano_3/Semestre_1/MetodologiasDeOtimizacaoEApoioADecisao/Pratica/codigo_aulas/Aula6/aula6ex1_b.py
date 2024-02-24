#2o Problema de PLMO

# Importar biblioteca
from pulp import *

# Criar modelo
model=LpProblem("PLMO_2",LpMaximize)

# Criar variaveis de decisao
x1=LpVariable("x1",lowBound=0)
x2=LpVariable("x2",lowBound=0)

# Adicionar funcao objetivo ao modelo
model+= 2*x1

# Adicionar restricoes ao modelo
model+= -3*x1 + 3*x2 <= 6
model+= 4*x1 + 3*x2 <= 12
model+= x1 - x2 <= 2
model+= x1 + x2 >= 3.7142

print(model)

# Resolver modelo
model.solve()

# Visualizar resultados
print("-------- Resultados / Results ---------")
print(f"Status = {model.status} <=> {LpStatus[model.status]}")
print(f"z* = {value(model.objective)}")
for var in model.variables():
    print(f"{var.name}* = {var.value()}")       
for name,constraint in model.constraints.items():
    print(f"{name}: {constraint.value()}")

"""
Interpretação dos resultados
A abordagem usada sugere que a melhor solução para o problema é a que otimiza
z1, ou seja, o ponto B. Salvo pequenos erros de arredondamento (na 4ª casa 
decimal), os valores são x1 = 6/7 e x2 = 20/7, com os valores das funções 
objetivo z1 = 26/7 (confirmado por _C4=0) e z2 = 12/7. Se tivéssemos otimizado 
z2 em primeiro lugar e a considerássemos como restrição para maximizar z1, 
a melhor solução seria o ponto E,com x1 = 18/7 e x2 = 4/7, correspondendo 
a z1 = 22/7 e z2 = 36/7. Ambas as soluções referidas são soluções 
eficientes / não dominadas, pois correspondem aos ótimos individuais de z1 e z
"""
    