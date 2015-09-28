require 'prime'

x = ARGV[0].to_i
y = ARGV[1].to_i

if x < y
  (x..y).each do |n|
    if n % 10 == 3 && Prime.prime?(n)
      puts n
    end
  end
else
  raise "First argument should be smaller than the second."
end
