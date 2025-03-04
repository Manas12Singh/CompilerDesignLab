#!/bin/bash
export PS1='\[\e[1;32m\]@HiS \[\e[1;34m\]→ \[\e[1;36m\]\w \[\e[1;31m\](main) \[\e[0m\]$ '

# Check if a file is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <lex file>"
    exit 1
fi

# Check if the provided file exists
if [ ! -f "$1" ]; then
    echo "File not found!"
    exit 1
fi

# Run lex on the provided file
lex "$1"

# Compile the generated lex.yy.c file
gcc lex.yy.c -o lex_output -ll

# Print a string before running the compiled output
echo 
echo "\e[32m@Manas12Singh ➜ \e[1;34m/workspaces/CompilerDesignLab \e[31m(main) \e[0m$ lex $1"
echo "\e[32m@Manas12Singh ➜ \e[1;34m/workspaces/CompilerDesignLab \e[31m(main) \e[0m$ gcc lex.yy.c"
echo "\e[32m@Manas12Singh ➜ \e[1;34m/workspaces/CompilerDesignLab \e[31m(main) \e[0m$ ./a.out"

# Run the compiled output
./lex_output

echo