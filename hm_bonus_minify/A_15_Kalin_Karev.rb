require 'csv'

filename=ARGV[0].to_s 
$data_work = nil
$account = nil
$sum = 0;

ARGV[1]
if (ARGV[1].include?("/"))
	$data_work = ARGV[1]
else 
	$account = ARGV[1]
end

$value = ARGV[2].to_i;

def data_print? val 
	if $value != nil
		puts val.join(",") if ((val[0] == $data_work) && (val[3].to_i.between?($value-10, $value+10)))
	else 
		puts val.join(",") if val[0] == $data_work
	end
end

def sum_account val 
	if (val[1] == $account)
		puts val.join(",")
		$sum += val[3].to_f
	end
end

CSV.read(filename).each do |row|
	if ($data_work != nil)
		data_print? row
	else 
		sum_account row if ($account != nil)
	end 
end

puts $sum.round(2) if ($acount != nil) 
