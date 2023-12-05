require 'digest'

md5 = Digest::MD5.new
line = "yzbqklnj"
num = 0
key = line + num.to_s
md5 << key
answer = md5.hexdigest

until answer[0..5] == "000000"
    md5.reset
    num = (num.to_i + 1)
    key = line + num.to_s
    md5 << key
    answer = md5.hexdigest
end
puts answer

puts key