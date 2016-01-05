require 'json'

f = File.read("A_28_Hristo_Ezekiev.json")
par = JSON.parse(f)

def parserino(par)
	par.each do |a, val1|
		puts a
		val1.each do |b, val2|
			puts "   " + b
			val2.each do |c, val3|
				puts "      " + c
				val3.each do |d, val4|
					puts "          " + d
					val4.each do |e, val5|
						puts "             " + e
					end
				end
			end
		end
	end
end

parserino(par)
