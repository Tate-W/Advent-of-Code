using System;
using System.IO;
using System.Text;

static int GetNum(string input, int digitIndex)
{
    if (!Char.IsAsciiDigit(input[digitIndex])) return -1;

    char[] chars = ".-#$%&*/@+=".ToCharArray();

    int startIndex = input.LastIndexOfAny(chars, digitIndex) + 1;

    int endIndex = input.IndexOfAny(chars, startIndex);
    if (endIndex == -1) endIndex = input.Length;

    string numStr = input.Substring(startIndex, endIndex - startIndex);

    if (int.TryParse(numStr, out int returnValue)) return returnValue;

    return -1;
}

try
{
    const string inputFile = "input.txt";
    const string SYMBOLS = "-#$%&*/@+=";
    const char GEAR = '*';

    List<(int X, int Y)> neighbors = new()
    {
        (-1, 1),  (0, 1),  (1, 1),
        (-1, 0),           (1, 0),
        (-1, -1), (0, -1), (1, -1),
    };

    string[] puzzlein = File.ReadAllLines(inputFile);

    int maxX = puzzlein[0].Length - 1;
    int maxY = puzzlein.Length - 1;

    int part1 = 0;
    int part2 = 0;

    foreach ((int X, int Y) in from charX in Enumerable.Range(0, puzzlein[0].Length)
                              from charY in Enumerable.Range(0, puzzlein.Length)
                              where SYMBOLS.Contains(puzzlein[charY][charX])
                              select (charX, charY))
    {
        HashSet<int> partNums = neighbors
            .Select(n => (nX: X + n.X, nY: Y + n.Y))
            .Where(w => w.nX >= 0 && w.nX <= maxX && w.nY >= 0 && w.nY <= maxY)
                .Select(s => GetNum(puzzlein[s.nY], s.nX))
                .Where(num => num != -1)
                .ToHashSet();
        
        part1 += partNums.Sum();

        if(puzzlein[Y][X] == GEAR && partNums.Count == 2)
        {
            part2 += partNums.Aggregate((x, y) => x * y);
        }
    }

    Console.WriteLine($"Part 1: Sum is {part1}");
    Console.WriteLine($"Part 2: Sum is {part2}");
}
catch(Exception e)
{
    Console.WriteLine(e);
}