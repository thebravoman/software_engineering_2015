require 'prime'

x = ARGV[0].to_f

if x > 0 && x < 1
  ratio = 1.0
  i = 3.0
  last_prime = 0.0

  loop do
    if Prime.prime?(i)
      if last_prime == i - 2
        ratio = 1 / i + 1 / last_prime
        if ratio < x
          break
        else
          puts ratio
        end
      end

      last_prime = i
    end

    i += 1
  end
else
  raise "Argument should be in the range (0;1)"
end
