from collections import defaultdict

def readFile(path):
    games = []
    
    with open(path, 'r') as file:
        for line_num, line in enumerate(file, start=1):
            if line.startswith("Game"):
                data = line.split(":")[1].strip().split(';')
                game_subsets = []
                for subset in data:
                    cube_list = subset.split(',')
                    subset_data = [cube.strip() for cube in cube_list]
                    game_subsets.append(subset_data)
                games.append({"subsets": game_subsets, "line_num": line_num})
    return games

def possible(games, target):
    total_sum = 0
    
    for game in games:
        subsets = game["subsets"]
        total = defaultdict(int)
        
        for subset in subsets:
            for cube in subset:
                count, color = cube.split()
                total[color] = max(total[color], int(count))
                
                product = 1
                for color in total:
                    product *= total[color]
                
        print(f"Game {game['line_num']} - Total: {total} - ", product)        
        
   
        total_sum += product
        print(f"Running Total: {total_sum} (Game {game['line_num']} added)")
                
    return total_sum

path = "Advent of Code/Day 2/input.txt"

games = readFile(path)

target = {"red": 12, "green": 13, "blue": 14}

total_sum = possible(games, target)

print(total_sum)

