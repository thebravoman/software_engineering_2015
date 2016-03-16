num = ARGV[0].to_i
count = 0

(2...num).each do |i|
  if num % i == 0
    print "#{i} "
    count += 1
  end
end

puts
puts "The number #{num} has #{count} devisers"