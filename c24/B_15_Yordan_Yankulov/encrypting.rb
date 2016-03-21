num = ARGV[0].to_i
e = ARGV[1].to_i
n = ARGV[2].to_i
c = (num**e) % n
puts "This is your encryption #{c}"
