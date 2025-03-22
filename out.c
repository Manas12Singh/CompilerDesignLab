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

    
    printf("Enter the number of elements: "); 
    scanf("%d", &n);                          

    int numbers[n];                  
    printf("Enter %d numbers: ", n); 

    
    for (int i = 0; i < n; i++) 
    {
        scanf("%d", &numbers[i]); 
    } 

    
    int result = numbers[0];    
    for (int i = 1; i < n; i++) 
    {
        result = gcd(result, numbers[i]); 
    }
    return 0;
}
