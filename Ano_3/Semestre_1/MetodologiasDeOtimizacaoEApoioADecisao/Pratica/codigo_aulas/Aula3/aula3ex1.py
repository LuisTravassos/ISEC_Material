"""
Alimentação dos cachorros / Feeding the puppies
"""
from pandas import read_excel
from pulp import *

# Lê área verde do ficheiro EXCEL / Read green area from EXCEL file 
df1 = read_excel("Data_aula3ex1.xlsx",nrows=2,usecols=(['Types of food','Minerals',
                                              'Vitamins','Calcium','Prices']))
print("==> Dataframe 1\n",df1)

# Cria lista com tipos de ração/ Create list with types of food
food_types = list(df1['Types of food'])
print("==> Food types\n",food_types)

# Cria dicionário de sais minerais / Create a dictionary of minerals 
# indexado por tipo de ração       / indexed by food type
minerals = dict(zip(food_types, df1['Minerals']))
print("==> Minerals\n",minerals)

# Cria dicionário de vitaminas / Create a dictionary of vitamins 
# indexado por tipo de ração   / indexed by food type
vitamins = dict(zip(food_types, df1['Vitamins']))
print("==> Vitamins\n",vitamins)

# Cria dicionário de cálcio  / Create a dictionary of calcium 
# indexado por tipo de ração / indexed by food type
calcium = dict(zip(food_types, df1['Calcium']))
print("==> Calcium\n",calcium)

# Cria dicionário de preços  / Create a dictionary of prices 
# indexado por tipo de ração / indexed by food type
prices = dict(zip(food_types, df1['Prices']))
print("==> Prices\n",prices)

# Lê área azul do ficheiro EXCEL / Read blue area from EXCEL file 
df2 = read_excel("Data_aula3ex1.xlsx",nrows=3,usecols=(['Requirements']))
print("==> Dataframe 2\n",df2)

# Cria lista de requisitos nutricionais / Create a list of nutricional requirements 
req = list(df2['Requirements'])
print("==> Requirements\n",req)

# Cria modelo / Create model
model=LpProblem("Dieta_cachorros/Puppies_diet",LpMinimize)

# Cria variáveis de decisão / Create decision variables 
x = LpVariable.dicts("x", food_types, lowBound=0)

# Cria função objetivo / Create objective function
model += lpSum([prices[i]*x[i] for i in food_types])

# Cria restrições / Create constraints
model += lpSum([minerals[i] * x[i] for i in food_types]) >= req[0]
model += lpSum([vitamins[i] * x[i] for i in food_types]) >= req[1]
model += lpSum([calcium[i] * x[i] for i in food_types]) >= req[2]

# Resolve modelo / Solve model                
model.solve()

# Visualizar resultados / Visualize results
print("-------- Resultados / Results ---------")
print(f"Status = {model.status} <=> {LpStatus[model.status]}")
print(f"z* = {value(model.objective)}")
for var in model.variables():
    print(f"{var.name}* = {var.value()}")       
for name,constraint in model.constraints.items():
    print(f"{name}: {constraint.value()}")