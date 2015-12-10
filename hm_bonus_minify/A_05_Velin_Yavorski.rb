require 'csv'

$filename = ARGV[0] 
$date = ARGV[1]
$value = ARGV[2].to_i

def date_value? line
	if ARGV[2]
			puts line.join(",") if ( (line[0] == $date) && (line[3].to_i.between?($value-10, $value+10)))
	else
		puts line.join(",") if line[0] == $date
	end
end


CSV.open($filename, "r") do |line|
	date_value? line
end


