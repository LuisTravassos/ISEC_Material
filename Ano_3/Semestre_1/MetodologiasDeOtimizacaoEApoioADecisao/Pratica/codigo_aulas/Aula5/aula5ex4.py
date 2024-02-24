# 1o Problema de PLMO

# Importar biblioteca
from pulp import *

# Criar modelo
model=LpProblem("PLMO 1", LpMaximize)

# Criar variรกveis de decisรฃo
x1=LpVariable("x1", lowBound=0) 
x2=LpVariable("x2", lowBound=0)

# Adicionar funรงรฃo objetivo ao modelo
model+=4*x1 - 2*x2

# Adicionar restriรงรตes ao modelo
model+= x1 + x2 <= 10
model+= 2*x1 + x2 <= 15
model+= 2*x1 + 3*x2 >= 30

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

"""
Interpretação dos resultados
A abordagem usada sugere que x1 = 0 e x2 = 10 é a melhor solução do 
problema. Os valores das funções objetivo são, z1 = 30 (confirmado por _C3=0) 
e z2 = -20. Se tivéssemos otimizado z2 em primeiro lugar e a considerássemos 
como restrição para maximizar z1, a melhor solução seria x1 = 7.5 e x2 = 0, 
correspondendo a z1 = 15 e z2 = 30. Em ambos os casos, verifica-se que a 
melhor solução para o problema corresponde à solução ótima de um dos objetivos 
que sabemos que são soluções eficientes / não dominadas. No entanto, não é 
apresentada nenhuma alternativa que corresponda a um compromisso intermédio 
entre os dois objetivos
"""