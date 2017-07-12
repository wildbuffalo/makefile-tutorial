TARGET = hello-cpp-world

SRC = src
#INC = src
#-Iinc -I../googletest -I../googletest/include
INC	= ../make

BIN = bin
DEPS = $(wildcard $(INC)/*.h)
SOURCE = $(wildcard $(SRC)/*.cpp)		
#OBJECT = $(SOURCE:.cpp=.o)	
#OBJECT = $(notdir $(SOURCE:.cpp=.o))
OBJECT = $(patsubst %,$(BIN)/%,$(notdir $(SOURCE:.cpp=.o))) 		# $(patsubst pattern,replacement,text)
CC = g++

CXXFLAGS += -g -Wall -Wextra  -Iinc	#-I$(INC)

						
$(BIN)/$(TARGET) : $(OBJECT)
	@echo "Linking ....."
	$(CC) -o $@ $(OBJECT) 											# $@ = Target name 

$(BIN)/%.o :  $(SRC)/%.cpp 											# Create all .o files from all .cpp files
	@echo "Compiling ....."
	$(CC) $(CXXFLAGS) -c $< -o $@									# $< name of first prerequisite  
	
	
.PHONY : help clean run

run : $(BIN)/$(TARGET)
	@echo "Runing ......."
	./$(BIN)/$(TARGET)
clean :
	rm -f $(BIN)/$(TARGET) $(OBJECT)
help :
	@echo "target: $(TARGET)"
	@echo "source: $(SOURCE)"
	@echo "object: $(OBJECT)"
	@echo "CXXFLAGS: $(CXXFLAGS)"
	@echo "DEPS: $(DEPS)"
