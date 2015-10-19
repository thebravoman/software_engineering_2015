require 'csv'
result = ARGV[0]
cmd = ARGV[1]
oo = ARGV[2]
ot = ARGV[3]

csv_file = CSV.read result

if cmd == "sort"
	clmn = oo.to_i
	ordr = ot.to_s
	if clmn == 0
		csv_file.sort! { |a,b| [a[clmn].to_s.downcase] <=> [b[clmn].to_s.downcase] }
	end
	if clmn == 1
		csv_file.sort! { |a,b| a[clmn] <=> b[clmn] }
	end
	if clmn == 2
		csv_file.sort! { |a,b| a[clmn].to_i <=> b[clmn].to_i }
	end
	if ordr == "DESC"
		csv_file.reverse!
	end
end
if cmd == "filter_cost"
	minimal = oo.to_i
	maximum = ot.to_i;
	CSV.open("result.csv", "wb") do |csv|
		csv_file.each do |line|
			if line[2].to_i >= minimal and line[2].to_i <= maximum
				csv << line
			end
		end
	end
end