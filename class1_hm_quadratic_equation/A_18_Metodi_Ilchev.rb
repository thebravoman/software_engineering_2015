a=ARGV[0].to_i
b=ARGV[1].to_i
c=ARGV[2].to_i

d=b*b-4*a*c
if d>0
sqd=Math.sqrt(d)
puts "#{(-b+sqd)/(2*a)}, #{(-b-sqd)/(2*a)}"
elsif d==0
puts "#{-b/(2*a)}"
else
puts "Nope"
end
