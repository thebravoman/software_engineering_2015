require 'prime'

x = ARGV[0].to_i

if x > 0 && x < 10
  result = Prime.lazy.select { |p| p % 10 == x }.take(10).to_a
  puts "#{result}"
else
  raise "Argument should be in the range 0 < x < 10."
end
