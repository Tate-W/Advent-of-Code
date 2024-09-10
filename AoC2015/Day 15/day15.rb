def parse(path)
  regex = /-?\d+/
  data = []
  File.foreach(path) do |line|

    ing, rest = line.split(": ")
    matches = rest.scan(regex).map(&:to_i)
    #Pops off calories for Part 1
    #CHANGE THIS SO ITS NOT FOR ALL PARSING
    matches.pop if matches.any?
    
    data << matches
  end
  data
end

def part1(data)

  #change balance of ings
  #mult amount of ing by attribute value
  #add like attributes between ings
  #negatives are zeroed
  #mult all attribute totals together for final score
  #general idea at least lol

end

path = "/home/tatew/Desktop/Advent-of-Code/AoC2015/Day 15/input.txt"
data = parse(path)
part1(data)
