#include <stdio.h> // For std::min and std::__gcd

class Solution
{
    /**
     * Function to calculate the Least Common Multiple (LCM) of two numbers.
     * Instead of directly multiplying (which can cause overflow), 
     * we use the formula: 
     *      lcm(x, y) = (x / gcd(x, y)) * y
     */
    long long lcm(long long x, long long y)
    {
        return (x / std::__gcd(x, y)) * y; 
    }

    /**
     * Function to count how many numbers in the range [1, i] 
     * are divisible by at least one of {a, b, c}.
     * 
     * Using Inclusion-Exclusion Principle:
     *  - Count multiples of `a`, `b`, and `c`
     *  - Subtract overcounted multiples of (a & b), (a & c), (b & c)
     *  - Add back multiples of (a & b & c) since they were subtracted thrice
     */
    long long findn(long long i, long long a, long long b, long long c)
    {
        return i / a + i / b + i / c              // Individual counts
               - i / lcm(a, b) - i / lcm(a, c) - i / lcm(b, c)  // Remove overcounted pairs
               + i / lcm(lcm(a, b), c);           // Add back LCM of all three
    }

public:
    /**
     * Function to find the nth ugly number.
     * An ugly number is defined as a number that is divisible by at least one of {a, b, c}.
     * We use **Binary Search** to efficiently find the nth such number.
     * 
     * Approach:
     *  - Set search space: [1, 2 * 10^9] (upper bound is large enough)
     *  - Use binary search to find the smallest number that has at least `n` divisors
     */
    int nthUglyNumber(int n, int a, int b, int c)
    {
        long long l = 1, r = 2e9, mid;  // Define search range
        while (l < r)
        {
            mid = l + (r - l) / 2;  // Avoid potential integer overflow

            if (findn(mid, a, b, c) < n)
                l = mid + 1;  // If count is too small, increase lower bound
            else
                r = mid;      // If count is sufficient, reduce upper bound
        }
        return l;  // `l` is the smallest valid number satisfying the condition
    }
};
