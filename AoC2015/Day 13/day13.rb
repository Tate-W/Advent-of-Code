def part1(seating, changes)

    total = 0

    seating.each_with_index do |person, index|
        left = seating[(index - 1) % seating.length]
        right = seating[(index + 1) % seating.length]
        total += changes[person][left]
        total += changes[person][right]
    end

    total

end

input = File.readlines("AoC2015/Day 13/input.txt").map(&:chomp)

me = "me"
people = input.map {|line| line.match(/(\w+) would (gain|lose) (\d+) happiness units by sitting next to (\w+)\./)[1]}.uniq
people.push(me)

changes = Hash.new {|hash, key| hash[key] = Hash.new(0)}

input.each do |line|
    match = line.match(/(\w+) would (gain|lose) (\d+) happiness units by sitting next to (\w+)\./)
    
    person1 = match[1]
    action = match[2]
    change = match[3].to_i
    person2 = match[4]

    change *= -1 if action == "lose"

    changes[person1][person2] = change

end

people.each do |person|
    changes[me][person] = 0
    changes[person][me] = 0
end

best = 0
people = changes.keys

people.permutation.each do |seating|
    total = part1(seating, changes)
    best = [best, total].max

end

puts best
