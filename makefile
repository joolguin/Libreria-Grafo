flags=-std=c++11 -Wall -Wextra -Wundef -Werror -Wuninitialized -Winit-self
CC=g++
exe=prueba
rutapython=/Applications/Xcode.app/Contents/Developer/Library/Frameworks/Python3.framework/Versions/3.8/include/python3.8

	
_grafo.so: grafo_wrap.cxx grafo.o
	$(CC) -fPIC -c grafo_wrap.cxx -o grafo_wrap.o -I$(rutapython)
	$(CC) -shared grafo_wrap.o grafo.o -undefined suppress -flat_namespace -o _grafo.so -L$(rutapython)

grafo.o: grafo.cpp
	g++ $(flags) -c -o grafo.o grafo.cpp

grafo_wrap.cxx: grafo.i grafo.h
	swig -python -c++ grafo.i

clean:
	rm -f *.o $(exe) *.so *.so *.cxx grafo.py
	rm -r -f __pycache__
