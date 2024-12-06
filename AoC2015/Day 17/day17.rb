def parse(path)

  arr = []
  
  File.foreach(path) do |line|
    arr << line.to_i
  end
  puts arr.sort!.inspect
  arr

end

def part1(arr)

  combos = []

  (1..arr.size).each do |x|
    arr.combination(x).each do |combo|
      combos << combo if combo.sum == 150
    end
  end

  combos
end

def part2(cum)

  count = 0
  bot = []

  (1..cum.size).each do |c|
    bot = c if c.size < bot.size
  end

  (1..cum.size).each do |v|

    count += 1 if v.size == bot.size

  end

  count
end


path = "AoC2015/Day 17/input.txt"
data = parse(path)
results = part1(data)
ans = part2(results)

puts results.size
puts ans.size