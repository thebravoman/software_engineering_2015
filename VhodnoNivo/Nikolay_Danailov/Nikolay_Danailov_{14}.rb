# get "count"-th divisable of the divident
# count starts from 0
def find_divisable(divident, count)
  divident * count
end

def find_sum(last_num)
  sum = 0

  (1..last_num).each do |i|
    sum += i
  end

  sum
end

x = 0

loop do
  puts 'Enter a number between 0 and 10'
  x = gets.to_i

  break if x > 0 && x < 10
end

arr = []

(0..9).each do |i|
  n = find_divisable(x, i)
  arr[i] = find_sum(n)
end

puts arr
