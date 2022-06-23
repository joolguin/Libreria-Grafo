#include <list>

using namespace std;

class Grafo{
    int v; // numero de nodos que tendra el grafo 
    list<int> *adj;
	list<int> *adjnew;
    public:
    Grafo();
    Grafo(int V);
    void add_arco(int d, int h); 
	int add_nodo(); 
    bool hay_arco(int d, int h); 
    bool hay_camino(int d, int h);
    };

