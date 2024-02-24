#GestÃ£o de Recursos / Resource Management
from pulp import *

# Criar modelo / Create model
model = LpProblem("Gestao-de-Recursos/Resource-Management", LpMaximize)

# Definir variÃ¡veis de decisÃ£o / Define decision variables
x = {j: LpVariable(name=f"x{j}", lowBound=0) for j in range(1, 5)}

# Adicionar funÃ§Ã£o objetivo ao modelo / Add objective function to model 
model += 20 * x[1] + 12 * x[2] + 40 * x[3] + 25 * x[4]

# Adicionar restriÃ§Ãµes ao modelo / Add constraints to model
model += x[1] + x[2] + x[3] + x[4] <= 50, "mao-de-obra/hand-labor"
model += 3* x[1] + 2 * x[2] + x[3] <= 100, "materia-prima-A/raw-material-A"
model += x[2] + 2 * x[3] + 3 * x[4] <= 90, "materia-prima-B/raw-material-B"

# Visualizar modelo / Visualize model
print("----Modelo Model----")
print (model)

# Resolver modelo / Solve model
model.solve()

# Mostrar resultados / Show results
print("----Resultados / Results----")
print (f"Estado / Status: {model.status} <=> {LpStatus[model.status]}") 
print (f"z* = {model.objective.value()}")

for var in model.variables():
    print(f"{var.name}* = {var.value()}")
for name, constraint in model.constraints.items(): 
    print (f" {name}): {constraint.value()}")
    
'''
Interpretação dos resultados:
De acordo com os valores obtidos para as variáveis de decisão e função objetivo, a
empresa deve produzir diariamente 5 unidades do produto P1 e 45 unidades do
produto P3, conseguindo, dessa forma, um lucro máximo de 1900 € por dia. 
Dados os valores das restrições, podemos concluir que a mão-de-obra será usada na sua
totalidade, bem como a matéria-prima B. Da matéria-prima A, sobrarão 40 unidades.
'''