x = ARGV[0].to_i

if x > 0 && x < 10
  result = Array.new
  (1..10).each do |n|
    sum = (0...1000).inject(0) { |sum, i| i % (n * x) == 0 ? sum + i : sum }
    result.push(sum)
  end

  puts "#{result}"
else
  raise "Argument should be in the range 0 < x < 10."
end
