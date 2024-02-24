# 1o Problema de PLMO

# Importar biblioteca
from pulp import *

# Criar modelo
model=LpProblem("PLMO 1", LpMaximize)

# Criar variáveis de decisão
x1=LpVariable("x1", lowBound=0) 
x2=LpVariable("x2", lowBound=0)

# Adicionar função objetivo ao modelo
model+=2*x1 + 3*x2

# Adicionar restrições ao modelo
model+= x1 + x2 <= 10
model+= 2*x1 + x2 <= 15

print(model)

# Resolver modelo
model.solve()

# Visualizar resultados
print("--------- Resultados ---------")
print (f"Status = {model.status} <=> {LpStatus[model.status]}") 
print (f"z* = {value (model.objective)}")

for var in model.variables():
    print(f" {var.name}* = {var.value()}")
for name, constraint in model.constraints.items(): 
    print(f" {name}: {constraint.value()}")

