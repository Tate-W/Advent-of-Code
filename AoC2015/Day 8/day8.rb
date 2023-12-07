def work(path)
    total_part1 = 0
    total_part2 = 0
    File.foreach(path) do |line|
        line.chomp!
        
        chars = line.length
        eval = eval(line)
        mem = eval.length
        total_part1 += chars - mem

        encode = line.dump
        total_part2 += encode.length - chars
    end
    [total_part1, total_part2]
end

path = "AoC2015/Day 8/input.txt"
part1_diff, part2_diff = work(path)


puts "Total: #{part1_diff}"
puts "Total: #{part2_diff}"
