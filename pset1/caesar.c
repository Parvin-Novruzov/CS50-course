#include <stdio.h>
#include <cs50.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h> //CAESAR.C, scroll to bottom to see full summary

const char upperalphabet[26] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
const  char loweralphabet[26] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};


int main(int argc, string argv[])
{
    if (argc < 2)
    {
        return 1;
    }
    else if (argv[1] < 0)
    {
        return 1;
    }

    int key = atoi(argv[1]);

    string plaintext = get_string("plaintext: ");
    printf("\n ciphertext: ");

    for (int n = 0; n < strlen(plaintext); n++)
    {
        if (isalpha(plaintext[n]))
        {
            if (isupper(plaintext[n]))
            {
                int z;
                for (z = 0; plaintext[n] != upperalphabet[z]; z++)
                    ;

                int ciphernumber = ((z + key) % 26);
                printf("%c", upperalphabet[ciphernumber]);
            }
            else if (islower(plaintext[n]))
            {
                int z;
                for (z = 0; plaintext[n] != loweralphabet[z]; z++)
                    ;

                int ciphernumber = ((z + key) % 26);
                printf("%c", loweralphabet[ciphernumber]);
            }
        }
        else
        {
            printf("%c", plaintext[n]); //non-alphabetical plaintext array elements get printed here
        }
    }
    printf("\n");
    return 0;
}