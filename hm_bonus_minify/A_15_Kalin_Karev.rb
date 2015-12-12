require 'rexml/document'
require 'csv'

filename=ARGV[0].to_s 
file_csv = CSV.read(filename)

$data_work = nil
$account = nil
$sum = 0;


def xml_convertor file_csv
	final_xml = REXML::Document.new("")
  	minify = final_xml.add_element("minify")
	file_csv[1 .. -1] = file_csv[1 .. -1].sort_by! do |f|
		t = f[0].split("/")
		[f[1], t[2].to_i, t[1].to_i, t[0].to_i, f[3]];
	end  
   	
   	file_csv[1 .. -1].each do |f|
   		account = minify.add_element("account");
   		account.add_text f[1];
   		data_work = account.add_element("data");
   		data_work.add_text f[0];
   		amount = data_work.add_element("amount");
   		amount.add_text f[3].to_s;
   	end
   	look = REXML::Formatters::Pretty.new(4);
   	look.compact = true;
   	look.write(final_xml, $stdout);
end

ARGV[1]
if (!ARGV[1].include?("/") && !(ARGV[1] =~ /\d/) && (ARGV[1] != "xml"))
	$account = ARGV[1]
else if(ARGV[1] == "xml") 
		xml_convertor file_csv
	else 
		$data_work = ARGV[1]
	end
end

$value = ARGV[2].to_i;

def sum_account val 
	if (val[1] == $account)
		puts val.join(",")
		$sum += val[3].to_f
	end
end


def data_print? val 
	if $value
		puts val.join(",") if ((val[0] == $data_work) && (val[3].to_i.between?($value-10, $value+10)))
	else 
		puts val.join(",") if val[0] == $data_work
	end
end

def sort file_csv
	file_csv.sort_by! do |f|
	t = f[0].split("/");
	[t[2].to_i, t[1].to_i, t[0].to_i];
	end
end


file_csv.each do |row|
	if ($data_work != nil)
		data_print? row
	else 
		sum_account row if($account != nil)
	end 
end

if ARGV[1] != "xml"
	sort file_csv
	file_csv.each do |l|
		if ($data_work != nil)
			data_print? l
		else
			sum_account l if ($account != nil)
		end
	end
end


puts #$sum;
