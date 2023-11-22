CC = gcc

#DEBUG = -O0 -g
CFLAGS += -std=c99 -pedantic -Wall -Wextra -Werror
CFLAGS += $(DEBUG)
#UNITY_SUPPORT_64 = -D UNITY_SUPPORT_64
#UNITY_INCLUDE_DOUBLE = -D UNITY_INCLUDE_DOUBLE
#DEFINES =  -D UNITY_OUTPUT_CHAR=putcharSpy
#DEFINES += -D UNITY_OUTPUT_CHAR_HEADER_DECLARATION=putcharSpy\(int\)
#DEFINES += -D UNITY_OUTPUT_FLUSH=flushSpy
#DEFINES += -D UNITY_OUTPUT_FLUSH_HEADER_DECLARATION=flushSpy\(void\)
#DEFINES += $(UNITY_SUPPORT_64) $(UNITY_INCLUDE_DOUBLE)

SRC = main.c \
      Unity/src/unity.c   \
      Unity/memory/src/unity_memory.c   \
      Unity/extras/fixture/src/unity_fixture.c
	  
INC_DIR = -I Unity/src -I Unity/memory/src -I Unity/extras/fixture/src
BUILD_DIR = build
TARGET = build/out

all: default

default: $(BUILD_DIR)
	$(CC) $(CFLAGS) $(DEFINES) $(SRC) $(INC_DIR) -o $(TARGET) -D MACRO_PRINT_INTRO
	./$(TARGET)
	
clean:
	rm -f $(TARGET) $(BUILD_DIR)/*.exe

# These extended flags DO get included before any target build runs
CFLAGS += -Wbad-function-cast
CFLAGS += -Wcast-qual
CFLAGS += -Wconversion
CFLAGS += -Wformat=2
CFLAGS += -Wmissing-prototypes
CFLAGS += -Wold-style-definition
CFLAGS += -Wpointer-arith
CFLAGS += -Wshadow
CFLAGS += -Wstrict-overflow=5
CFLAGS += -Wstrict-prototypes
CFLAGS += -Wswitch-default
CFLAGS += -Wundef
CFLAGS += -Wno-error=undef  # Warning only, this should not stop the build
CFLAGS += -Wunreachable-code
CFLAGS += -Wunused
CFLAGS += -fstrict-aliasing