x = ARGV[0].to_i

if x > 0 && x < 10
  cosines = Array.new(x, 0)
  cosines.map!.with_index { |n, i| Math::cos(i) }

  puts "#{cosines}"
  sorted_cosines = cosines.sort { |x, y| y <=> x }
  puts "#{sorted_cosines}"
else
  raise "Argument should be in the range 0 < x < 10."
end
