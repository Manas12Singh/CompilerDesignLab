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


filename=$(basename -- "$1")
filename_no_ext="${filename%.*}"
lex "$filename_no_ext".l
yacc -d "$filename_no_ext".y
gcc lex.yy.c y.tab.c


# Print commands to simulate shell activity
echo
echo -e "\e[32m@User ➜ \e[1;34m/workspaces/CompilerDesignLab \e[31m(main) \e[0m$ lex $filename_no_ext.l"
echo -e "\e[32m@User ➜ \e[1;34m/workspaces/CompilerDesignLab \e[31m(main) \e[0m$ yacc -d $filename_no_ext.y"
echo -e "\e[32m@User ➜ \e[1;34m/workspaces/CompilerDesignLab \e[31m(main) \e[0m$ gcc lex.yy.c y.tab.c"
echo -e "\e[32m@User ➜ \e[1;34m/workspaces/CompilerDesignLab \e[31m(main) \e[0m$ ./a.out"

# Run the compiled output
./a.out

echo
