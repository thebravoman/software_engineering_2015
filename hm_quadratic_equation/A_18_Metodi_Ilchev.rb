a=ARGV[0].to_f
b=ARGV[1].to_f
c=ARGV[2].to_f

d=b*b-4*a*c
if d>0
	sqd=Math.sqrt(d)
	lex1=(-b+sqd)/(2*a)
	lex2=(-b-sqd)/(2*a)
	if lex1>lex2
		puts "#{lex2},#{lex1}"
	else
		puts "#{lex1},#{lex2}"
	end
elsif d==0
	puts "#{-b/(2*a)}"
else
	
end
