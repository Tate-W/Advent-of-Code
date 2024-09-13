def part1(path)
  
  File.foreach(path) do |line|
    count = 0
    count += 1 if line =~ /children:\s*3/
    count += 1 if line =~ /cats:\s*7/
    count += 1 if line =~ /samoyeds:\s*2/
    count += 1 if line =~ /pomeranians:\s*3/
    count += 1 if line =~ /akitas:\s*0/
    count += 1 if line =~ /vizslas:\s*0/
    count += 1 if line =~ /goldfish:\s*5/
    count += 1 if line =~ /trees:\s*3/
    count += 1 if line =~ /cars:\s*2/
    count += 1 if line =~ /perfumes:\s*1/

    if count == 3
      puts line
      
    end

  end

end

def part2(path)
  
  File.foreach(path) do |line|
    count = 0
    count += 1 if line =~ /children:\s*3/
    count += 1 if line =~ /cats:\s*([8-9]|[1][0])/
    count += 1 if line =~ /samoyeds:\s*2/
    count += 1 if line =~ /pomeranians:\s*([0-2],)/
    count += 1 if line =~ /akitas:\s*0/
    count += 1 if line =~ /vizslas:\s*0/
    count += 1 if line =~ /goldfish:\s*([0-4],)/
    count += 1 if line =~ /trees:\s*([4-9]|[1][0])/
    count += 1 if line =~ /cars:\s*2/
    count += 1 if line =~ /perfumes:\s*1/

    if count == 3
      puts line
      
    end

  end

end


path = "AoC2015/Day 16/input.txt"
part1(path)
part2(path)