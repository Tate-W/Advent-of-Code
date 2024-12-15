

def part1():
    left_list = []
    right_list = []
    
    with open('AoC2024/Day1/input.txt', 'r') as file:
        for line in file:
            
            l, r = line.split()        
            
            left_list.append(int(l))
            right_list.append(int(r))
        
        left_list.sort()
        right_list.sort()
        
        i = 0
        dist = 0
        
        while i != 1000:

            dist += abs(left_list[i] - right_list[i])
            i += 1
        
        print(dist)
        
def part2():
    left_list = []
    right_list = []
    
    with open('AoC2024/Day1/input.txt', 'r') as file:
        for line in file:
            
            l, r = line.split()        
            
            left_list.append(int(l))
            right_list.append(int(r))
        
        calc = 0
        for i in left_list:
            calc += i * right_list.count(i)
        print(calc) 

part2()