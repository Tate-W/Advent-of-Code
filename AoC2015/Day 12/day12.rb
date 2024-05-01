def part1(input)
    regex = /-?\d+/
    sum = 0

    file = File.read(input)
    sum = (file.scan(regex)).map(&:to_i).sum
    puts "Part 1: #{sum}"
end


input = "AoC2015/Day 12/input.txt"
part1(input)