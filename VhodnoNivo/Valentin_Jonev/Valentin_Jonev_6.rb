x = gets.to_i
arr = Array.new(100)
random = Random.new

for i in 1..100
  arr[i] = random.rand(100)
end

for i in 1..100
  if arr[i].to_s.end_with?(x)
    puts arr[i]

  end
end
