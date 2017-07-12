TARGET = main
SOURCE = $(wildcard *.cpp)			# Find file names with .cpp
OBJECT = $(SOURCE:.cpp=.o)			# replace .cpp to .o file
CC = gcc
CXXFLAGS += -g -std=c++11 -Wall -Wextra 		
$(TARGET) : $(OBJECT)
	@echo "Linking ....."
	$(CC) -o $@ $(OBJECT)			# $@ = Target name 

%.o :  %.cpp						# Create all .o files from all .cpp files
	@echo "Compiling ....."
	$(CC) $(CXXFLAGS) -c $< -o $@	# $< name of first prerequisite  

.PHONY : help clean run

run : $(TARGET)
	@echo "Runing ......."
	./$(TARGET)
clean :
	rm -f $(TARGET) $(OBJECT)
help :
	@echo "target: $(TARGET)"
	@echo "source: $(SOURCE)"
	@echo "object: $(OBJECT)"


# hello-cpp-world : hello-cpp-world.o led.o
# 	g++ -o hello-cpp-world hello-cpp-world.o led.o

# hello-cpp-world.o : hello-cpp-world.cpp
# 	g++ -c hello-cpp-world.cpp -o hello-cpp-world.o

# led.o : led.cpp
# 	g++ -c led.cpp -o led.o

# .PHONY : clean run

# run : hello-cpp-world
# 	./hello-cpp-world

# clean :
# 	rm -f hello-cpp-world led.o hello-cpp-world.o
	


# If you use gcc instead of g++ you need to add explicit linking -lstdc++