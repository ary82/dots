#!/bin/bash
# COMPILE AND RUN C OR C++ FILES

# Name of output executable
EXECNAME=$(cut --delimiter=. --fields=1 <<<$1)

# create build dir if it does not exist
if ! [ -d "../build" ]; then
	printf "%s\n\n" "Making build dir as sibling to current dir"
	mkdir "../build"
fi
# remove executable if it exists
if [ -f "../build/$EXECNAME" ]; then
	printf "%s\n\n" "Removed previous executable"
	rm "../build/$EXECNAME"
fi

# Compile
g++ -ggdb -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror $1 -o "../build/$EXECNAME" &&
	# Make executable
	chmod +x "../build/$EXECNAME" &&
	# run
	../build/$EXECNAME
