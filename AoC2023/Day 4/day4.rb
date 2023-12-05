def part1(input)
    total = 0
    input.each_line do |line|
        points = 0
        n = formatting(line)
    
        points = 2**n
        total += points 
    end
    puts total
    
end

def part2(input)
    cards = 0
    x = 0
    i = 0
    matches = []
    ogNums = []
    
    input.each_line do |line|
        n = formatting(line)
        matches[x] = n
        cards += 1
        x += 1
    end
    ogNums = matches.dup

    (matches.length).times do |i|
        z = matches[i]
        z = [z, 204].min
        puts " HEEEEEEREEEEE #{i}, #{z}"

        s = i + z
        s = [s, 204].min
        cards += 1

        until z == 0
            cards += 1

            matches[s] = matches[s] + ogNums[s]

            z -= 1
            s -= 1
        end
    end

    puts cards
end

def formatting(line)
    n = -1
        
    parts = line.split(':')
    nums = parts[1].strip
    lists = nums.split('|')

    winning = lists[0].strip.split.map(&:to_i)
    myNums = lists[1].strip.split.map(&:to_i)

    winning.each do |x|
        myNums.each do |y|
            if x == y
                n += 1
            end
        end
    end

    if n < 0
        n = 0
    end

    return n
end

input = File.read("AoC2023/Day 4/input.txt")
part1(input)
part2(input)