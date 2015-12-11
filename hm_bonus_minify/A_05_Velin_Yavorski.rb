require 'csv'

filename = ARGV[0]
$date = nil
$account = nil
my_csv = CSV.read(filename)
 
if (!ARGV[1].include?("/")) && !(ARGV[1] =~ /\d/) && (ARGV[1] != "xml")
	$account = ARGV[1]
	$sum_value = 0
else
	$date = ARGV[1] 
end
$value = ARGV[2].to_i

def date_value_print? line
	if ARGV[2]
		puts line.join(",") if ( (line[0] == $date) && (line[3].to_i.between?($value-10, $value+10)))
	else
		puts line.join(",") if line[0] == $date
	end
end


def account_sum line
	if(line[1] == $account)
		puts line.join(",")
		$sum_value+=line[3].to_f
	end 
end

my_csv.sort_by! do |e|
  d = e[0].split("/")
  [d[2].to_i, d[1].to_i, d[0].to_i]
end

my_csv.each do |line|
	if($date != nil) 
		date_value_print? line
	else
		account_sum line if($account != nil)
	end
end

puts $sum_value.round(2) if($account != nil)