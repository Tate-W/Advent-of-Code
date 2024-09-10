#Class to handle organizing the fliers name and data
class Fliers
    attr_accessor :name, :speed, :flyTime, :restTime

  def initialize(name, speed, flyTime, restTime)
    @name = name
    @speed = speed
    @flyTime = flyTime
    @restTime = restTime
  end
#Used for Part 2
  def distance_at_time(seconds)
    cycle_time = flyTime + restTime
    full_cycles = seconds / cycle_time
    remaining_time = seconds % cycle_time

    total_flying_time = full_cycles * flyTime + [remaining_time, flyTime].min
    total_flying_time * speed
end

end
#Parses the input file into usable data 
#Creates new class objects for each reindeer
def parse(path)

    fliers = []
    File.foreach(path) do |line|

        name, rest = line.split(" can fly ")
        speed, rest = rest.split(" km/s for ")
        flyTime, rest = rest.split(" seconds, but then must rest for ")
        restTime, rest = rest.split(" ")

        speed = speed.to_i
        flyTime = flyTime.to_i
        restTime = restTime.to_i

        fliers << Fliers.new(name, speed, flyTime, restTime)
    end
    fliers

end

def part1(data)

    final = []

    data.each do |deer|
        time = 2503
        total = 0
        
        while time != 0
            flyTime = deer.flyTime
            restTime = deer.restTime
            while flyTime != 0

                if time == 0
                    break
                end

                time -= 1
                flyTime -= 1
                total += deer.speed

            end

            while restTime != 0

                if time == 0
                    break
                end

                time -= 1
                restTime -= 1
            end

        end
        final << total
    end

    final

end

def part2(data)
    # ******* AI ********
    #I realize now after using ChatGPT that my Part 1 could be done a lot cleaner
    #In respect to my documentation, I won't be changing my part 1 code at all
    #This was a good way to see how else I could have worked Part 1 
    #I am going to leave comments here with my interpretation of what is going on
    
    # add an attribute to the class called points and init to 0 for each deer
    data.each { |deer| deer.instance_variable_set(:@points, 0) }

    # Total race time
    total_time = 2503

    # Loop through each second of the race
    (1..total_time).each do |second|
        #Use the function within the class to determine distance at the given second
        #Seems this is being taken from a map of data
        distances = data.map { |deer| [deer, deer.distance_at_time(second)] }

        # Find the maximum distance at this second
        max_distance = distances.map { |_, distance| distance }.max

        # Award points to the deer(s) with the maximum distance
        distances.each do |deer, distance|
            deer.instance_variable_set(:@points, deer.instance_variable_get(:@points) + 1) if distance == max_distance
        end
    end

    # Find the deer with the most points
    winner = data.max_by { |deer| deer.instance_variable_get(:@points) }
    winner.instance_variable_get(:@points)

end

path = "/home/tatew/Desktop/Advent-of-Code/AoC2015/Day 14/input.txt"

#Data is an array of the reindeers and speed data
data = parse(path)
final = part1(data)
puts final.max
puts part2(data)