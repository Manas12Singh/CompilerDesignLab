#include <stdio.h>

// Function to find the GCD of two numbers
int gcd(int a, int b)
{
    while (b != 0)
    {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

int main() //
{
    int n;

    /* Askin
    printf("GCD of given numbers is: %d\n", result);

    return 0;
}g the user for the number of elements
    /* amnasasas
       and storing the input in 'n' */
    printf("Enter the number of elements: "); // Reading the numbers from user input
    scanf("%d", &n);                          // Reading the numbers from user input

    int numbers[n];                  // Reading the numbers from user input
    printf("Enter %d numbers: ", n); // Reading the numbers from user input

    // Reading the numbers from user input
    for (int i = 0; i < n; i++) // Reading the numbers from user input
    {
        scanf("%d", &numbers[i]); // Reading the numbers from user input
    } /* amnasasas
        and storing the input in 'n' */

    // Finding GCD of all numbers
    int result = numbers[0];    // Reading the numbers from user input
    for (int i = 1; i < n; i++) // Reading the numbers from user input
    {
        result = gcd(result, numbers[i]); // Reading the numbers from user input
    }
    return 0;
}
// Printing the final GCD result