num = ARGV[0].to_i
divisers_count = 0

(2...num).each do |i|
  if num % i == 0
    print "#{i} "
    divisers_count += 1
  end
end

puts
puts "The number #{num} has #{divisers_count} devisers"