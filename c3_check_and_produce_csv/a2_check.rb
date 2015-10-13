require 'csv'

<<<<<<< HEAD
arr = []


CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		if name.size == 4
			last_name = name[3].split(".").first
			first_name = name[2]
			if !arr.include?([first_name,last_name])
				p "#{name[0]},#{name[1]},#{first_name},#{last_name}"
				result= `ruby #{filename} 1 3 2`
		
				solved = 0
				if result.gsub(/\s/, "")=="-2.0,-1.0"
					solved = 1
				end
			
				csv_array << [name[0],name[1],first_name,last_name,solved]
				arr << [first_name,last_name]
			end
=======
def student_checked? checked_files, first_name,last_name
	checked_files.include? [first_name,last_name]
end

checked_files = []

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
			name = filename.split("/").last.split("_")
			if name.size == 4
				last_name = name[3].split(".").first
				first_name = name[2]
				number = name[1]
				clazz = name[0]
				if !student_checked? checked_files,first_name,last_name
					p "#{clazz},#{number},#{first_name},#{last_name}"
					result= `ruby #{filename} 1 4 2`
					p result
					solved = 0
					if result.gsub(/\s+/, "")=="-3.414213562373095,-0.5857864376269049"
						solved = 1
					end
					csv_array << [clazz,number,first_name,last_name,solved]
					checked_files << [first_name, last_name]
				end
>>>>>>> 84c28884ff55a3e49066f2452a21bad2597cc19a
		end
	end
end

def sort_csv
	my_csv = CSV.read 'result.csv'
	my_csv.sort! { |a,b| [a[0],a[1]] <=> [b[0],b[1]] }
	CSV.open("result.csv", "w") do |csv|
	  my_csv.each {|element| csv << element}
	end
end

sort_csv









