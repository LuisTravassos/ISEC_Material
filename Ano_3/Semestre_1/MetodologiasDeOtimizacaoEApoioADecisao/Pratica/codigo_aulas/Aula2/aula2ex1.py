#Planeamento de turnos Shift planning

from pulp import *

# Criar modelo / Create model
model = LpProblem("Turnos-enfermeiros/Nurse-Shifts", LpMinimize)

# Definir variáveis de decisão / Define decision variables
x1=LpVariable("x1",0)
x2=LpVariable("x2",0)
x3=LpVariable("x3",0)
x4=LpVariable("x4",0)
x5=LpVariable("x5",0)
x6=LpVariable("x6",0)

# Adicionar função objetivo ao modelo / Add objective function to model 
model += x1 + x2 + x3 + x4 + x5 + x6, "Total Enfermeiros/Nurses"

# Adicionar restrições ao modelo / Add constraints to the model
model += x6 + x1 >= 4, "Periodo/Period 00H00-04H00" 
model += x1 + x2 >= 6, "Periodo/Period 04H00-08H00" 
model += x2 + x3 >= 10, "Periodo/Period 08H00-12H00" 
model += x3 + x4 >= 8, "Periodo/Period 12H00-16H00" 
model += x4 + x5 >= 12, "Periodo/Period 16H00-20H00" 
model += x5 + x6 >= 6, "Periodo/Period 20H00-00H00TM"

# Visualizar modelo / Visualize model
print("----Modelo / Model----")
print(model)

# Resolver modelo / Solve the model 
model.solve()

# Mostrar resultados / Show results
print("----Resultados----")
print(f"Estado / Status: {model.status} <=> {LpStatus[model.status]}") 
print(f"z* = {model.objective.value()}")

for var in model.variables():
    print (f" {var.name}* = {var.value()}")
for name, constraint in model.constraints.items(): 
    print (f" {name}: {constraint.value()}")
    
    
'''
Interpretação dos resultados:
A clínica deverá contratar um total de 26 enfermeiros que serão necessários para
assegurar os requerimentos nos vários períodos horários. Destes, 4 trabalharão no
turno 1, 2 no turno 2, 8 no turno 3, 6 no turno 4 e 6 no turno 5. O turno 6 não precisará
de existir. 
Verifica-se que em todos os períodos horários, o nº de enfermeiros a
trabalhar será igual ao mínimo exigido, à exceção do período das 12:00 às 16:00, em
que estarão presentes mais 6 enfermeiros do que era requerido.
'''