def find_factor(x)
factx = Array.new
(1..x).each{|n| 
    if x % n == 0
        factx.push n
    end
}
return factx
end

factx2 = find_factor(ARGV.first.to_i)

puts factx2


