def work(input)
    result = ""
    i = 0

    while i < input.length
        count = 1

        while i + 1 < input.length && input[i] == input[i + 1]
            i += 1
            count += 1
        end

        result += count.to_s + input[i]
        i += 1
      
    end

    result

end


input = "3113322113"

50.times do
    input = work(input)
end

puts input.length