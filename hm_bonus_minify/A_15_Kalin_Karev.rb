require 'csv'

filename=ARGV[0].to_s 
file_csv = CSV.read(filename)

$data_work = nil
$account = nil
$sum = 0;

ARGV[1]
if (!ARGV[1].include?("/") && !(ARGV[1] =~ /\d/) && (ARGV[1] != "xml"))
	$account = ARGV[1]
else 
	$data_work = ARGV[1]
end

$value = ARGV[2].to_i;

def sum_account val 
	if (val[1] == $account)
		puts val.join(",")
		$sum += val[3].to_f
	end
end


def data_print? val 
	if $value != nil
		puts val.join(",") if ((val[0] == $data_work) && (val[3].to_i.between?($value-10, $value+10)))
	else 
		puts val.join(",") if val[0] == $data_work
	end
end


file_csv.sort_by! do |f|
	t = f[0].split("/") 
	[t[2].to_i, t[1].to_i, t[0].to_i];
end


file_csv.each do |row|
	if ($data_work != nil)
		data_print? row
	else 
		sum_account row if($account != nil)
	end 
end

puts $sum;
