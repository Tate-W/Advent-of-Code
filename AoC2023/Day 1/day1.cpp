#include <iostream>
#include <stdio.h>
#include <string>
#include <fstream>
#include <regex>
#include <unordered_map>

using namespace std;

int main() 
{
    ifstream input;
    string line = "";
    regex firstdigit("(?:zero|one|two|three|four|five|six|seven|eight|nine|\\d)");
    regex lastdigit("(?:(?!.+(?:zero|one|two|three|four|five|six|seven|eight|nine|\\d)))(?:zero|one|two|three|four|five|six|seven|eight|nine|\\d)");
    string first, last, combined;
    int num[1000], i, sum;

    unordered_map < string, string > hashmap;

    hashmap["zero"] = "0";
    hashmap["one"] = "1";
    hashmap["two"] = "2";
    hashmap["three"] = "3";
    hashmap["four"] = "4";
    hashmap["five"] = "5";
    hashmap["six"] = "6";
    hashmap["seven"] = "7";
    hashmap["eight"] = "8";
    hashmap["nine"] = "9";



    input.open("input.txt");
    if (input.is_open())
    {
        i = 0;
        while (getline(input, line))
        {
            smatch temp;
            if (regex_search(line, temp, firstdigit))
            {
                first = temp.str();
            }
            
            if (regex_search(line, temp, lastdigit))
            {
                last = temp.str();
            }

            if (!first.empty() && !last.empty())
            {
                if (first.length() != 1)
                {
                    first = hashmap[first];
                    
                }
                if (last.length() != 1)
                {
                    last = hashmap[last];
                }

                num[i] = stoi(first + last);                
            }
            cout << num[i] << "\n";
            i++;
            first.clear();
            last.clear();
        }
        sum = 0;
        input.close();
        for (int x = 0; x < 1000; x++)
        {
            sum = sum + num[x];
        }
        
        cout << sum;
    }
    return 0;
}