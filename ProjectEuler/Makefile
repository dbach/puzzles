# Makefile for ProjectEuler puzzle code

CFLAGS   := -g -Wall
CXXFLAGS := $(CFLAGS)


EXECUTABLES := sumton

all: $(EXECUTABLES)

clean:
	@rm -f $(EXECUTABLES)


# basic single file compile rules

% : %.c
	$(CC) $(CFLAGS)-o $@ $<

% : %.cpp
	$(CXX) $(CXXFLAGS)-o $@ $<
