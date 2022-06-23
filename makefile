flags=-std=c++11 -Wall -Wextra -Wundef -Werror -Wuninitialized -Winit-self
CC=g++
exe=prueba
rutapython=/Applications/Xcode.app/Contents/Developer/Library/Frameworks/Python3.framework/Versions/3.8/include/python3.8

	
_libpbn.so: lib_wrap.cxx grafo.o
	$(CC) -fPIC -c lib_wrap.cxx -o lib_wrap.o -I$(rutapython)
	$(CC) -shared lib_wrap.o grafo.o -undefined suppress -flat_namespace -o _libpbn.so -L$(rutapython)

grafo.o: grafo.cpp
	g++ $(flags) -c -o grafo.o grafo.cpp

lib_wrap.cxx: lib.i grafo.h
	swig -python -c++ lib.i

clean:
	rm -f *.o $(exe) *.so *.so *.cxx libpbn.py
	rm -r -f __pycache__
