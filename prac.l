%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to validate each octet in an IPv4 address
int validate_octet(char* octet) {
    int num = atoi(octet);
    if (num < 0 || num > 255) {
        return 0;
    }
    if (octet[0] == '0' && strlen(octet) > 1) {
        return 0;
    }
    return 1;
}
%}

%%

([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3}) {
    char ip[100];
    strcpy(ip, yytext);
    char* token = strtok(ip, ".");
    int is_valid = 1;

    while (token != NULL) {
        if (!validate_octet(token)) {
            is_valid = 0;
            break;
        }
        token = strtok(NULL, ".");
    }

    if (is_valid) {
        printf("Valid IPv4 address: %s\n", yytext);
    } else {
        printf("Invalid IP address\n");
    }
}

([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4} {
    printf("Valid IPv6 address: %s\n", yytext);
}

\n  ; // Ignore newline

.* {
    printf("Invalid IP address\n");
}

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
