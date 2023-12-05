def work(input)
    grid_size = 1000
    grid = Array.new(grid_size) { Array.new(grid_size, 0) }

    input.each_line do |line|
        action, start_x, start_y, end_x, end_y = parse_command(line)
        
        (start_x..end_x).each do |x|
            (start_y..end_y).each do |y|

                case action
                when "toggle"
                    grid[x][y] += 2
                when "turn on"
                    grid[x][y] += 1
                when "turn off"
                    if grid[x][y] > 0
                        grid[x][y] -= 1
                    end
                end
            end
        end
    end
    brightness = 0
    (0..999).each do |a|
        (0..999).each do |b|
            brightness += grid[a][b]
        end
    end

    puts brightness
end

def parse_command(command)

    regex = /^(toggle|turn off|turn on) (\d+),(\d+) through (\d+),(\d+)$/

    match = regex.match(command)

    if match
        action = match[1]
        start_x = match[2].to_i
        start_y = match[3].to_i
        end_x = match[4].to_i
        end_y = match[5].to_i

        return [action, start_x, start_y, end_x, end_y]

    end
end

input = File.read("Day 6/input.txt")
puts work(input)