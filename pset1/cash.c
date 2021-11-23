#include <stdio.h>
#include <cs50.h>
#include <math.h>

int main(void)
{
    float dollar;
    int cent;

    // Prompts the user to input the amount owed (in dollars)
    do
    {
        dollar = get_float("Please enter the amount: ");
        cent = round(dollar * 100);
    }
    while (dollar < 0.0);

    // Initialize the number of coins (zero initially)
    int coins = 0;

    // Increments the coins count if the owed amount is greater than 25 cents
    while (cent >= 25)
    {
        coins++;
        cent = cent - 25;
    }

    // Increments the coins count if the owed amount is less than 25 cents and greater than 10 cents
    while (cent >= 10 && cent < 25)
    {
        coins++;
        cent = cent - 10;
    }

    // Increments the coins count if the owed amount is less than 10 cents and greater than 5 cents
    while (cent >= 5 && cent < 10)
    {
        coins++;
        cent = cent - 5;
    }

    // Increments the coins count if the owed amount is less than 5 cents and greater than 1 cent
    while (cent >= 1 && cent < 5)
    {
        coins++;
        cent = cent - 1;
    }

    // Prints the number of coins used to return the change
    printf("Minimum number of coins required: %i\n", coins);
}