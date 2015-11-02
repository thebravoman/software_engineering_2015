require 'prime'

def get_last_digit(num)
  num.to_s[num.to_s.length - 1]
end

x = 0

loop do
  puts 'Enter a number between 0 and 10'
  x = gets.to_i

  break if x > 0 && x < 10
end

arr = []

if x != 5 && x.odd?
  curr_num = 1
  while arr.size < 10
    if Prime.prime?(curr_num)
      arr[arr.size] = curr_num if get_last_digit(curr_num) == x.to_s
    end

    curr_num += 1
  end

  puts arr
else
  puts 'No prime numbers end in that number'
end
