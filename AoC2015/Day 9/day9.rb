def parse(path)
    
    dists = {}
    File.foreach(path) do |line|
        towns, distance = line.split(" = ")
        town1, town2 = towns.split(" to ")
        dists[[town1.strip, town2.strip]] = distance.to_i
    end

    dists
    
end

def calc(path, dists)

    total_dist = 0
    path.each_cons(2) do |start, dest|
        total_dist += dists[[start, dest]] || dists[[dest, start]]
    end

    total_dist

end

path = "AoC2015/Day 9/input.txt"
dists = parse(path)

towns = dists.keys.flatten.uniq

routes = towns.permutation.to_a

shortest = Float::INFINITY

longest = 0

routes.each do |route|

    total_dist = calc(route, dists)

    shortest = [shortest , total_dist].min
    longest = [longest, total_dist].max
end


puts shortest
puts longest