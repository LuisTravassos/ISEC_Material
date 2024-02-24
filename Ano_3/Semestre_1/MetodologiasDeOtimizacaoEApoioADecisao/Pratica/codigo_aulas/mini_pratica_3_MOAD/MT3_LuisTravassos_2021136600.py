# Importar biblioteca PuLP
from pulp import *

# Importar sub-modulo Pyplot da biblioteca Matplotlib
import matplotlib.pyplot as plt 

# Inicializar duas listas para guardar pontos extremos (PE) da região 
# eficiente e respetivos valores de z1 e z2
X=[]
Z=[]

# Criar variáveis de decisão
x1=LpVariable("x1",lowBound=0)
x2=LpVariable("x2",lowBound=0)

# Para determinar PE usa abordagem da soma ponderada das duas funções objetivo
# Definir incremento de  alpha
step = 0.1

# Numero total de amostras
n = int(1/step)

# Iterar para valores de alpha (peso) entre 0 e 1 
for i in range(0,n+1):
    
        # Calcula valor de alpha
        alpha=i/n
        
        # Criar novo modelo
        model=LpProblem("MT3_LuisTravassos",LpMaximize)
        
        # Adicionar funcao objetivo z = alpha*z1 + (1-alpha)*z2 
        model += alpha*(x2)+(1-alpha)*(x1-3*x2)
        
        # Adicionar restricoes
        model += -2*x1 + x2 <= 8
        model += 2*x1 + 3*x2 <= 30
        model += 5*x1 + 4*x2 <= 60
        model += x1 - 2*x2 <= 6
        
        # Resolver modelo
        model.solve()
        
        # Guardar cada nova solução determinada pois é PE da região eficiente
        if X.count([value(x1),value(x2)]) == 0:
                X=X+[[value(x1),value(x2)]]
                
# Mostra PE da região eficiente
print("Extreme points of the efficient region:\n",X)

# Calcula valores correspondentes de z1 e z2 
for i in range(0, len(X)):
    Z=Z+[[X[i][1],X[i][0]-3*X[i][1]]]
    
# Mostra imagem dos PE no espaço das funcoes objetivo 
print("Images of these EP in objective function space:\n",Z)            

# Constroi vetores para os graficos
XX1=[] # Valores do eixo de x1
XX2=[] # Valores do eixo de x2
ZZ1=[] # Valores do eixo de z1
ZZ2=[] # Valores do eixo de z2
for i in range(0, len(X)):
    XX1=XX1+[X[i][0]]
    XX2=XX2+[X[i][1]]
    ZZ1=ZZ1+[Z[i][0]]
    ZZ2=ZZ2+[Z[i][1]]
 
# Soluções ideal e anti-ideal
ideal=[max(ZZ1),max(ZZ2)]
anti_ideal=[min(ZZ1),min(ZZ2)] 
print("---> Ideal solution =",ideal)
print("---> Anti-ideal solution =",anti_ideal)

# Grafico no espaço das variaveis de decisao
# -- Inicializar tamanho da figura
plt.figure(figsize=(20,10))

# -- Criar grafico de linhas
plt.plot(XX1,XX2,color="green")
plt.scatter(XX1,XX2,color="red",linewidth=6.0)

# -- Adicionar legendas dos eixos
plt.xlabel("x1",size=20)
plt.ylabel("x2",size=20)

# -- Adicionar titulo ao grafico
plt.title("Efficient region",size=32)

# -- Mostrar coordenadas dos PE
for i, j in zip(XX1,XX2):
   plt.text(i,j,'({}, {})'.format(round(i,2), round(j,2)))
   
# -- Mostrar grafico
plt.show()
input("Press ENTER to continue...")

# Grafico no espaço das funcoes objetivo
# -- Inicializar tamanho da figura
plt.figure(figsize=(20,10))

# -- Criar grafico de linhas
plt.plot(ZZ1,ZZ2,color="blue")
plt.scatter(ZZ1,ZZ2,color="red",linewidth=6.0)

# -- Adicionar legendas dos eixos
plt.xlabel("z1",size=20)
plt.ylabel("z2",size=20)

# -- Adicionar titulo ao grafico
plt.title("Non-dominated region",size=32)

# -- Mostrar coordenadas dos PE
for i, j in zip(ZZ1,ZZ2):
    plt.text(i,j,'({}, {})'.format(round(i,2), round(j,2)))
    
# -- Mostrar grafico
plt.show()

"""
Interpretação dos resultados
Os resultados anteriores traduzem as conclusões que foram obtidas no início 
(e na aula teórico-prática): o conjunto das soluções eficientes 
(ou região eficiente) corresponde à aresta formada pelos pontos B e E, 
sendo que o conjunto das soluções não dominadas (ou região não dominada) 
corresponde à aresta delimitada pelas imagens desses pontos no espaço z1 z2
"""

