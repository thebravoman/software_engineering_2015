q = 1
p = 352
arr = []

while(q <= 352)
  n = q.gcd(p)
  if n == 1
    arr << q
  end
  q += 1
end

puts arr.max

n = Random.new
puts "random: #{arr[n.rand(arr.size())]}"
