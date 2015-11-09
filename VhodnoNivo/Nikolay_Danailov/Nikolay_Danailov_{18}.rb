require 'prime'

x = 0

loop do
  puts 'Enter a number that is equal to 0 or bigger'
  x = gets.to_i

  break if x >= 0
end

dividers = []

curr_num = 1
while dividers.size < 10 && curr_num <= x
  dividers[dividers.size] = curr_num if curr_num.odd? if x % curr_num == 0

  curr_num += 1
end

puts "Dividers: #{dividers}"

prime_dividers = []
dividers.each do |div|
  prime_dividers[prime_dividers.size] = div if Prime.prime?(div)
end

puts "Prime dividers: #{prime_dividers}"
