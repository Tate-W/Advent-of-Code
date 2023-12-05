def count(direction)
    santa_pos = [0,0]
    robo_pos = [0,0]
    visited = Set.new([santa_pos.dup])

    direction.each_char.each_with_index do |move, index|

        current_pos = index.odd? ? santa_pos : robo_pos

        case move
        when '^'
            current_pos[1] += 1
        when 'v'
            current_pos[1] -= 1
        when '<'
            current_pos[0] += 1
        when '>'
            current_pos[0] -= 1
        end

        visited.add(current_pos.dup)
    end    
    visited.size
end

path = "Day 3/input.txt"
direction = File.read(path)

puts count(direction)