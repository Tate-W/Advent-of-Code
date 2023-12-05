def work(file)
    x = 0
    file.each_line do |line|
        #Part 1
        #if (line.scan(/ab|cd|pq|xy/).empty?) && !(line.scan(/(.)\1/).empty?) && !(line.scan(/(\w*[aeuio]\w*){3,}/).empty?) 
        #    x += 1
        #end

        if ( !(line.scan(/([a-z])([a-z])\1/).empty?) && !(line.scan(/([a-z])([a-z]).*(?:\1\2)/).empty?))
           x += 1
        end

    end
    puts x
end

file = File.read("Day 5/input.txt")

puts work(file)