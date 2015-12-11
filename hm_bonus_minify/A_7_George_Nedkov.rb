require 'csv'

read = CSV.read ARGV[0]

	a = ARGV[1]

	b = ARGV[2]

		read.each do |column|
			if column[0] == a and column[2].to_i >= b.to_i - 10 and column[2].to_i <= b.to_i + 10 
				puts column
	


	    end

end
