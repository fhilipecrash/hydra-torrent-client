# Compiler and Linker
CXX = g++

# Detect OS
OS := $(shell uname -s)

# Conditional configuration depending on the operating system
ifeq ($(OS), Linux)
    # Include and Library paths for Linux
    INCLUDES = -I/usr/include/
    LIBDIRS = -L/usr/local/lib

    # Libraries to link against for Linux
    LIBS = -lboost_system -lpthread -lboost_thread -ltorrent-rasterbar
else
    # Include and Library paths for Windows
    INCLUDES = -I C:\msys64\urtc64\include
    LIBDIRS = -L C:\msys64\urtc64\lib

    # Libraries to link against for Windows
    LIBS = -lboost_system-mt -lpthread -lboost_thread-mt -ltorrent-rasterbar -lwsock32
endif

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
	$(CXX) $(CXXFLAGS) $(SRCS) -o out/$@ $(LDFLAGS)

# Rule to clean up generated files
clean:
	rm -f $(TARGET)

.PHONY: all clean
