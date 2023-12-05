File.open("Day 2/input.txt") do |input|
    total = 0
    ribbon = 0
    input.each_line do |line|
        
        values = line.split('x')
        l = Integer(values[0])
        w = Integer(values[1])
        h = Integer(values[2])

        x = l*w
        y = w*h
        z = h*l

        s = ((x < y)?((x < z)?x : z) : ((y < z)?y : z))

        total = total + (2*x + 2*y + 2*z + s)

        #Part 2
        cf = l*w*h

        max = ((l > w)?((l > h)?l : h) : ((w > h)?w : h))

        if max == l
            ribbon += w*2 + h*2 + cf
        elsif max == w
            ribbon += l*2 + h*2 + cf
        else
            ribbon += l*2 + w*2 + cf
        end
        
    end
    puts total
    puts ribbon
end