require 'csv'

folder = ARGV[0]
CSV.open("result.csv", "w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |folder|
		name = folder.split("/").last.split("_")
		if name.size == 3
			fname = name[0]
			lname = name[1]
			number= name[2].split(".").first
			if fname.size == 10
				puts "#{fname},#{lname}"
				csv << [fname,lname]
			end
		end
	end
end

my_csv = CSV.read 'result.csv'

my_csv.sort! { |a,b| b[1] <=> a[1] }
CSV.open("result.csv", "w") do |csv|
    my_csv.each {|element| csv << element}
end
