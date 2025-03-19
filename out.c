#include <stdio.h>


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

int main() 
{
    int n;

    /* Askin
    printf("GCD of given numbers is: %d\n", result);

    return 0;
}g the user for the number of elements
    /* amnasasas
       and storing the input in 'n' */
    printf("Enter the number of elements: "); 
    scanf("%d", &n);                          

    int numbers[n];                  
    printf("Enter %d numbers: ", n); 

    
    for (int i = 0; i < n; i++) 
    {
        scanf("%d", &numbers[i]); 
    } /* amnasasas
        and storing the input in 'n' */

    
    int result = numbers[0];    
    for (int i = 1; i < n; i++) 
    {
        result = gcd(result, numbers[i]); 
    }
    return 0;
}
