require 'csv'

namelist = Array.new

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
	    if name.size == 4
	    	clazz = name[0]
	    	number = name[1]
	    	f_name = name[2]
	    	l_name = name[3].split(".").first
	    		if	namelist.include?(f_name + l_name) == false
						p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
						result= `ruby #{filename} 1 3 2`
					  	solved = 0
					  	if result.strip=="-2.0,-1.0"
					  		solved = 1
					  	end
					  	csv_array << [name[0],name[1],name[2],name[3].split(".").first,solved]

	  			else namelist = (f_name + l_name)
	  		end
	  	end
	end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| [a[0],a[1]] <=> [b[0],b[1]] }
CSV.open("result.csv", "w") do |csv|
  my_csv.each {|element| csv << element}
end








