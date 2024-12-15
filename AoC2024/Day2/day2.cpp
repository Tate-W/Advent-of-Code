#include <iostream>
#include <stdio.h>
#include <string>
#include <regex>
#include <fstream>

using namespace std;

int main()
{
    ifstream input;
    string line = "";


    input.open("../input.txt");

    if (input.is_open())
    {

        string str;
        int num, x;

        while (getline(input, line))
        {
            stringstream ss(line);
            int arr[] = {};

            while (getline(ss, str, ' '))
            {
                
                num = stoi(str);

                arr[x] = num;
                x++;
            }
            cout << *arr << '\n';            
        }

        input.close();
    }

    return 0;
}