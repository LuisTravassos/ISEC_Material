"""
nome -> Luís Henrique Pessoa Oliveira Travassos
nº aluno -> 2021136600
"""

#Fabrica Brinquedos

from pandas import read_excel
from pulp import *

# Lê área verde do ficheiro EXCEL
df1 = read_excel("Data_MT2.xlsx",nrows=2,usecols=(['Carros_A','Carros_B',
                                                   'Cap_Prod_Diaria',
                                                   'Disp_Rolamentos',
                                                   'Profits']))
print("\n==> Dataframe 1\n",df1)

# Cria lista dos carros A
carros_A = list(df1['Carros_A'])
print("\n==> Carros A\n",carros_A)

# Cria lista dos carros B
carros_B = list(df1['Carros_B'])
print("\n==> Carros B\n",carros_B)

# Cria lista da capacidade de producao diaria
cap_Prod_Diaria = list(df1['Cap_Prod_Diaria'])
print("\n==> Capacidade Producao Diaria\n",cap_Prod_Diaria)

# Cria lista da disponibilidade diaria de rolamentos
disp_Rolamentos = list(df1['Disp_Rolamentos'])
print("\n==> Disponibilidade Rolamentos\n",disp_Rolamentos)

# Cria lista dos profits
profits = list(df1['Profits'])
print("\n==> Profits\n",profits)

# Lê área azul do ficheiro EXCEL
df2 = read_excel("Data_MT2.xlsx",nrows=4,usecols=(['Resources']))
print("\n==> Dataframe 2\n",df2)

# Cria lista de recursos
resources = list(df2['Resources'])
print("\n==> Resources\n",resources)

# Cria modelo / Create model
model=LpProblem("Fabrica_Brinquedos",LpMaximize)

# Cria variáveis de decisão
x = {j: LpVariable(name=f"x{j}", lowBound=0,cat=LpInteger) for j in range(1,3)}

# Cria função objetivo
model += lpSum([profits[j]*x[j+1] for j in range(2)])

# Cria restrições
model += lpSum([carros_A[j] * x[j+1] for j in range(2)]) >= resources[0]
model += lpSum([carros_B[j] * x[j+1] for j in range(2)]) >= resources[1]
model += lpSum([cap_Prod_Diaria[j] * x[j+1] for j in range(2)]) <= resources[2]
model += lpSum([disp_Rolamentos[j] * x[j+1] for j in range(2)]) <= resources[3]

# Resolve modelo              
model.solve()

# Visualizar resultados
print("\n-------- Resultados ---------\n")
print(f"Status = {model.status} <=> {LpStatus[model.status]}")
print(f"z* = {value(model.objective)}")
for var in model.variables():
    print(f"{var.name}* = {var.value()}")       
for name,constraint in model.constraints.items():
    print(f"{name}: {constraint.value()}")
    
