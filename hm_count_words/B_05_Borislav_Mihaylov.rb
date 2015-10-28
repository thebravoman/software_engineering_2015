file = File.open(ARGV[0], "r")
h = Hash.new
	
	marks = IO.read(file).scan(/[[:punct:]]/).length

	text = IO.read(file).downcase.tr('^A-Z ^0-9 ^a-z', '').split(' ')

h.sort{|a,b| a[1]<=>b[1]}.each { |elem|  
	puts "#{elem[0]},#{elem[1]}"
}

if (marks!=0)
	puts "\"marks\",#{marks}"
end
