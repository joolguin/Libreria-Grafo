from grafo import *

def castellano(booleano):
    if  booleano: 
        return ""
    else:
        return "no "

g=Grafo(3) 
g.add_arco(1,2)
g.add_nodo()
g.add_arco(2,3)



print(castellano(g.hay_arco(2,1)) + "hay arco entre los nodos")
print(castellano(g.hay_camino(1,3)) + "hay camino entre los nodos")
print(castellano(g.hay_camino(0,3)) + "hay camino entre los nodos")
print(castellano(g.hay_camino(3,1)) + "hay camino entre los nodos")
