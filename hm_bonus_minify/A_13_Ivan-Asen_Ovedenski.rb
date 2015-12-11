require 'csv'

def is_date? date_wannabe
	/\d{1,2}\/\d{1,2}\/\d*/.match date_wannabe
end

def match_dates? line, date
	line[0] == date
end

def is_within_value? line, date, value
	(line[3].to_i > (value - 10)) && (line[3].to_i < (value + 10))
end

filename = ARGV[0]
first_argument = ARGV[1]
value = ARGV[2].to_i
output_info = []
sum = 0

my_csv = CSV.read filename

my_csv.each do |line|
	if is_date? first_argument 
		if value == 0
			if	(line[0] == first_argument)
				output_info << line.join(',')
			end
		elsif (is_within_value? line, first_argument, value) && (match_dates? line, first_argument)
			output_info << line.join(',')
		end
	else
		if line[1] == first_argument 
			output_info << line.join(',')
			sum += line[3].to_f
		end
	end
end
p output_info 
output_info.sort! { |a,b| Date.parse(a.split(",").first) <=> Date.parse(b.split(",").first) }
#p Date.parse output_info[0].split(",").first
output_info.each do |element|
	puts element
end
if sum != 0 
	puts sum.round 3
end


