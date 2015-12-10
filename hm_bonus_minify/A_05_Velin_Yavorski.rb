require 'csv'

$filename = ARGV[0]
$date = nil
$account = nil
 
ARGV[1]
if (ARGV[1].include?("/"))
	$date = ARGV[1] 
else
	$account = ARGV[1]
	$sum_value = 0
end

$value = ARGV[2].to_i


def date_value_print? line
	if $value != nil
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


CSV.read($filename)[1 ..-1].each do |line|
	if($date != nil) 
		date_value_print? line
	else
		account_sum line if($account != nil)
	end
end

puts $sum_value.round(2) if($account != nil)
