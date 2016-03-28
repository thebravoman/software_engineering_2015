require 'prime'
class Crypting
  attr_accessor :p ,:q
  def is_prime? p,q
    if !p.prime? || !q.prime?
      puts "They are not prime!"
    end
  end

  def computing p,q
    n = p * q
  end

  def totient p,q
    tot = (p - 1) * (q - 1)
  end

  def chosing tot
    while true
      e = rand(2..tot)
      if e.prime? && !(tot % e).zero?
          return e
      end
    end
  end

  def calculating tot, e
    for d in 0..tot - 1
      if (d * e) % tot == 1
        return d
      end
    end
  end
end

crypting = Crypting.new
crypting.p = ARGV[0].to_i
crypting.q = ARGV[1].to_i
puts "1. Chose primes #{crypting.p},#{crypting.q}"
crypting.is_prime? crypting.p , crypting.q
n =  crypting.computing crypting.p , crypting.q
puts "2. #{n}"
tot = crypting.totient crypting.p , crypting.q
puts "3. #{tot}"
e = crypting.chosing tot
puts "4. #{e}"
d = crypting.calculating tot,e
puts "5. #{d}"
puts "Your public key is #{n} and #{e}"
puts "Your private key is #{d}"
