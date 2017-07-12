hello-cpp-world : hello-cpp-world.o led.o
	g++ -o hello-cpp-world hello-cpp-world.o led.o

hello-cpp-world.o : hello-cpp-world.cpp
	g++ -c hello-cpp-world.cpp -o hello-cpp-world.o

led.o : led.cpp
	g++ -c led.cpp -o led.o

.PHONY : clean run

run : hello-cpp-world
	./hello-cpp-world

clean :
	rm -f hello-cpp-world led.o hello-cpp-world.o
	


# If you use gcc instead of g++ you need to add explicit linking -lstdc++