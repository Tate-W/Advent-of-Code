x = 0
File.open("Day 1/input.txt") do |input|
    z = 0
    w = 0
    s = 0
    input.each_char do |w|
        z = z + 1
        if w == "("
            x += 1
        end
        if w == ")"
            x -= 1
        end

        if x < 0 && s < 1
            puts "First time in basement: #{z}"
            s = s + 1
        end
    end
end
puts "Final floor: #{x}"
