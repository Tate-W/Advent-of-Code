def parse(path)
  regex = /-?\d+/
  data = []

  File.foreach(path) do |line|

    ing, rest = line.split(": ")
    matches = rest.scan(regex).map(&:to_i)
    data << matches
  end

  data
end

def part1(info)

  # Removes the calorie data, not needed for this part
  info.each { |sub| sub.pop}

  top = 0
# Balances the ingredients and stays under 100 total
  (0..100).each do |spr|
    (0..(100 - spr)).each do |pb|
      (0..(100 - spr - pb)).each do |fros|

        sug = 100 - spr - pb - fros

        tbs = [spr, pb, fros, sug]

        cap = dur = flav = text = 0

        tbs.each_with_index do |tb, i|
          # Calculates the individual attribute values
          cap += tb * info[i][0]
          dur += tb * info[i][1]
          flav += tb * info[i][2]
          text += tb * info[i][3]

        end
        # Zeros out any negative values
        cap = 0 if cap < 0
        dur = 0 if dur < 0
        flav = 0 if flav < 0
        text = 0 if text < 0
        # Calculate final score
        score = cap * dur * flav * text
        # Compare previous high score and replace if new score is higher
        top = score if (top < score)

      end
    end
  end

  puts top

end

path = "AoC2015/Day 15/input.txt"
data = parse(path)

part1(data)
