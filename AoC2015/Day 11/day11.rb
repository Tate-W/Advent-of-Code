def is_valid(input)
    
    straight = false
    (0..(input.length - 3)).each do |i|
        if input[i].ord == input[i + 1].ord - 1 && input[i + 1].ord == input[i + 2].ord - 1
            straight = true
            break
        end
    end
    return false unless straight
    
   
    return false if input.include?('i') || input.include?('o') || input.include?('l')
    
    
    pair_count = 0
    i = 0
    while i < input.length - 1
        if input[i] == input[i + 1]
            pair_count += 1
            i += 2  
        else
            i += 1
        end
    end
    return false if pair_count < 2
    
    return true
end

def increment_input(input)
    input_array = input.chars
    
    
    i = input_array.length - 1
    while i >= 0
        if input_array[i] == 'z'
            input_array[i] = 'a'  
            i -= 1
        else
            input_array[i] = (input_array[i].ord + 1).chr  
            break  
        end
    end
    
    return input_array.join
end

def find_next_input(current_input)
    next_input = current_input
    loop do
        next_input = increment_input(next_input)
        break if is_valid(next_input)
    end
    return next_input
end


current_input = "hxbxxyzz"
next_input = find_next_input(current_input)
puts next_input
