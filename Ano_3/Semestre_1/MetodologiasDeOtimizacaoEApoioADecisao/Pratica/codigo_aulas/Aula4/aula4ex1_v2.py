"""
Carpinteiro / Carpenter
"""
from pandas import read_excel
from pulp import *

# Lê área verde do ficheiro EXCEL
df1 = read_excel("Data_EX5.xlsx",nrows=2,usecols=(['Wood','Hand labour',
                                                                  'Profits']))
print("\n==> Dataframe 1\n",df1)

# Cria lista da quantidade de madeira
wood = list(df1['Wood'])
print("\n==> Wood\n",wood)

# Cria lista de tempo de mão-de-obra
hand_labour = list(df1['Hand labour'])
print("\n==> Hand labour\n",hand_labour)

# Cria lista de lucros unitários
profits = list(df1['Profits'])
print("\n==> Profits\n",profits)

# Lê área azul do ficheiro EXCEL
df2 = read_excel("Data_EX5.xlsx",nrows=2,usecols=(['Resources']))
print("\n==> Dataframe 2\n",df2)

# Cria lista de recursos
resources = list(df2['Resources'])
print("\n==> Resources\n",resources)

# Cria modelo / Create model
model=LpProblem("Carpinteiro/Carpenter",LpMaximize)

# Cria variáveis de decisão
x = {j: LpVariable(name=f"x{j}", lowBound=0,cat=LpInteger) for j in range(1,3)}

# Cria função objetivo
model += lpSum([profits[j]*x[j+1] for j in range(2)])

# Cria restrições
model += lpSum([wood[j] * x[j+1] for j in range(2)]) <= resources[0]
model += lpSum([hand_labour[j] * x[j+1] for j in range(2)]) <= resources[1]

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
    

"""
Interpretação dos resultados:
O carpinteiro deverá fabricar, por mês, 3 bancos do modelo I e nenhum 
banco do modelo II, conseguindo desta forma um lucro máximo mensal 
de 36 U.M. O valor que surge na 2ª restrição (_C2) significa que das 28 
horas/mês que o carpinteiro dispõepara trabalhar no fabrico dos bancos, 7 
não vão ser utilizadas.
"""