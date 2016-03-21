num = ARGV[0].to_i
d = ARGV[1].to_i
n = ARGV[2].to_i
m = (num**d) % n
puts "Your decryption is #{m}"
