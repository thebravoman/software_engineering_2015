require 'csv'
csv = CSV.read(ARGV[0])
date = ARGV[1]
value = ARGV[2].to_i
#puts date
csv.each do |line|
	if line[0]==date
		if ARGV[2]
		  if line[3].to_i.between?((value-10),(value+10))
		  	puts line.join(' ')
		  end
	    else
	    	puts line.join(' ')
	    end
	end
end