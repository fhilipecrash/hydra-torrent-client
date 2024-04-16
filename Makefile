# Compiler and Linker
CXX = g++

# Include and Library paths
# Linux
#INCLUDES = -I /usr/include/
#LIBDIRS = -L /usr/local/lib
# Windows
INCLUDES = -I C:\msys64\mingw64\include
LIBDIRS = -L C:\msys64\mingw64\lib

# Libraries to link against
# Linux
#LIBS = -lboost_system -lpthread -lboost_thread -ltorrent-rasterbar
# Windows
LIBS = -lboost_system-mt -lpthread -lboost_thread-mt -ltorrent-rasterbar -lwsock32

# Source files and output binary
SRCS = main.cpp
TARGET = hydra-torrent-client

# Compiler flags
CXXFLAGS = -Wall $(INCLUDES)
LDFLAGS = $(LIBDIRS) $(LIBS)

# Default rule to build the whole project
all: $(TARGET)

# Rule to link the program
$(TARGET): $(SRCS)
	$(CXX) $(CXXFLAGS) $(SRCS) -o $@ $(LDFLAGS)

# Rule to clean up generated files
clean:
	rm -f $(TARGET)

.PHONY: all clean