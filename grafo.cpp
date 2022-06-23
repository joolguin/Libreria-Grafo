#include "grafo.h"
#include <list>
#include <iostream>


Grafo::Grafo(int V)
{
    this-> v = V;
    adj = new list<int> [v];
}  

void Grafo::add_arco(int d, int h)
{
    if (d<=v && h<=v){
    adj[d].push_back(h);
    adj[h].push_back(d);
    }
    else cout<<"node out of range"<<endl;     
}
int Grafo::add_nodo(){
    adjnew = new list<int>[v+1];
    list<int>::iterator x;
    for(int i = 0;i < v; i++){
        for(x = adj[i].begin(); x!=adj[i].end();x++){
            adjnew[i].push_back(*x);
        }
    }
    adj = adjnew;
    v += 1;
    return 0;
}

bool Grafo::hay_arco( int d, int h)
{
    list<int>::iterator x;
    for(int i = 0;i < v;i++){
            if (i == d){
                for(x = adj[i].begin(); x != adj[i].end();x++){
                    if(*x == h) return true; 
                }
            }
        }
    return false;
}

bool Grafo::hay_camino(int d, int h)
{   
    if(d<h){
        int c=d+1;
        for(int i = d; i < h; i++){
            if(hay_arco(i,c)==1) c+=1;
            if (c>h) return true;
        }
    }
    if(d>h){
         int x = d-1;
         for(int i = d; i > h; i--){
            if(hay_arco(i,x)==1) x-=1;
            if (x<d) return true;
         }
    }
    return false;
}