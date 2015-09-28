x = ARGV[0].to_i
y = ARGV[1].to_i

if !(x < y)
  raise ArgumentError, "X must be smaller than Y."
end

for i in x..y
  if i % 2 == 1
    puts i
  end
end
