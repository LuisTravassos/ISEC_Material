#Problema do fazendeiro

#Bibliotecas
from pulp import *

#Criar Modelo
model = LpProblem("Fazendeiro", LpMaximize)

"""Recuperar modelo de um ficheiro MPS
var, model = LpProblem.fromMPS("Fazendeiro.mps", LpMaximize)"""

#Criar variáveis de decisão
x1 = LpVariable("x1", lowBound=0)
x2 = LpVariable("x2", lowBound=0)

#Adicionar função objetivo ao modelo
model += 5*x1 + 2*x2

#Adicionar restrições ao modelo
model += x1 <= 3, "Arroz"
model += x1 <= 4, "Milho"
model += x1 + 2*x2 <= 9, "Mao_de_Obra"

#Guarda modelo num ficheiro MPS
model.writeMPS("Fazendeiro.mps")

#Resolver modelo
solver = getSolver("GLPK_CMD")
model.solve()

#Visualizar resultados
print("-----Resultados--------")
print(f"Status = {model.status} <=> {LpStatus[model.status]}")
print(f"z* = {value(model.objective)}")

for var in model.variables():
    print(f"{var.name}* = {var.value()}")
    
for name, constraint in model.constraints.items():
    print(f"{name}: {constraint.value()}")
print("-----Resultados--------")




