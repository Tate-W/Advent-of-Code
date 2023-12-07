def part1(input)
    array = []
    distance = []
    time = []
    x = 0

    input.each_line do |line|

        array = line.split(" ")
        array.shift

        if (x > 0)
            distance = array.map(&:to_i)
        else
            time = array.map(&:to_i)
        end
        x += 1
        
    end


    count = [0, 0, 0, 0]
    z = 3
    while z >= 0
        speed = 0
        until time[z] == 0
            traveled = 0
            traveled = time[z] * speed
            
            time[z] -= 1
            speed += 1
            
            if (traveled > distance[z])
                count[z] += 1
            end

        end
        
        z -= 1
        
    end
    
    puts "Part 1: #{count.reduce(:*)}"

end

def part2(input)
    array = []
    time_s = ""
    distance_s = ""
    z = 1
    input.each_line do |line|

        array = line.split(" ")
        array.shift
        
        if z > 0 
            time_s = array.map(&:to_s).join
        else
            distance_s = array.map(&:to_s).join
        end

        z -= 1
    end

    time = time_s.to_i
    distance = distance_s.to_i

    count = 0
    speed = 0
    
    until time == 0
        traveled = 0
        traveled = time * speed

        time -= 1
        speed += 1

        if traveled > distance
            count += 1
        end

    end

    puts "Part 2: #{count}"

end

input = File.read("AoC2023/Day 6/input.txt")
part1(input)
part2(input)