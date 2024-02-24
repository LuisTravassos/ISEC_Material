#2o Problema de PLMO

# Importar biblioteca
from pulp import *

# Criar modelo
model=LpProblem("PLMO_2/MOLP_2",LpMaximize)

# Criar variaveis de decisao
x1=LpVariable("x1",lowBound=0)
x2=LpVariable("x2",lowBound=0)

# Adicionar funcao objetivo ao modelo
model+= x1 + x2

# Adicionar restricoes ao modelo
model+= -3*x1 + 3*x2 <= 6
model+= 4*x1 + 3*x2 <= 12
model+= x1 - x2 <= 2

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
    
    