"""
Carpinteiro / Carpenter
"""
from pandas import read_excel
from pulp import *

# Lê área verde do ficheiro EXCEL
df1 = read_excel("Data_EX5.xlsx",nrows=2,usecols=(['Bench models','Wood',
                                              'Hand labour','Profits']))
print("\n==> Dataframe 1\n",df1)

# Cria lista com modelos de bancos
bench_models = list(df1['Bench models'])
print("\n==> Bench models\n",bench_models)

# Cria dicionário de quantidade de madeira
# indexado por modelo de banco
wood = dict(zip(bench_models,df1['Wood']))
print("\n==> Wood\n",wood)

# Cria dicionário de tempo de mão-de-obra
# indexado por modelo de banco
hand_labour = dict(zip(bench_models,df1['Hand labour']))
print("\n==> Hand labour\n",hand_labour)

# Cria dicionário de lucros unitários
# indexado por modelo de banco
profits = dict(zip(bench_models,df1['Profits']))
print("\n==> Profits\n",profits)

# Lê área azul do ficheiro EXCEL
df2 = read_excel("Data_EX5.xlsx",nrows=2,usecols=(['Resources']))
print("\n==> Dataframe 2\n",df2)

# Cria lista de recursos
resources = list(df2['Resources'])
print("\n==> Resources\n",resources)

# Cria modelo
model=LpProblem("Carpinteiro/Carpenter",LpMaximize)

# Cria variáveis de decisão
x = LpVariable.dicts("x",bench_models,lowBound=0,cat=LpInteger)

# Cria função objetivo
model += lpSum([profits[i]*x[i] for i in bench_models])

# Cria restrições
model += lpSum([wood[i] * x[i] for i in bench_models]) <= resources[0]
model += lpSum([hand_labour[i] * x[i] for i in bench_models]) <= resources[1]

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