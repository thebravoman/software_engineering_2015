require 'csv'

input = "this time this time things'll work out just fine we won't let you slip away this time this time things'll work out just fine we won't let you leave this way if you want you can will it"

output = "this,5\ntime,4\nyou,4\nfine,2\njust,2\nlet,2\nout,2\nthings'll,2\nwe,2\nwon't,2\nwork,2\naway,1\ncan,1\nif,1\nit,1\nleave,1\nslip,1\nwant,1\nway,1\nwill,1\n"

File.open("text","w") do |file|
	file.write(input)
end

CSV.open("result.csv","w") do |csv_arr|
	Dir.glob(ARGV[0]+"*").each do |file|
		name = file.split("/").last.split("_");
		result = `ruby #{file} text`

		ok=0
		if(result==output)
			ok=1
		end

		csv_arr << [name[0],name[1],name[2],name[3].split(".").first,ok]
	end
end

csv_file = CSV.read("result.csv")
csv_file.sort! do | a , b |
	(a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i) : (a[0] <=> b[0])
end

CSV.open("result.csv","w") do |csv_arr|
	csv_file.each do |row|
		csv_arr << row
	end
end
