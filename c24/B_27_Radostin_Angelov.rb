n = 500

def get_divisors(n)
    for i in 1..n
        if (n % i == 0)
            p i
        end
    end
end

def get_gcd (a, b)
    greatest = 1;
    bigger = a > b ? a : b
    for i in 1..(bigger - 1)
        if (b % i == 0 and
            a % i == 0)
            greatest = i
        end
    end

    puts greatest
end

get_divisors(ARGV[0].to_i)
get_gcd(ARGV[0].to_i, ARGV[0].to_i)
