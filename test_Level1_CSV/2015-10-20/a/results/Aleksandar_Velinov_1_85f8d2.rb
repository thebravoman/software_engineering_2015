require 'csv'

def get_names filename
	filename.split("/").last.split("_")
end

checked_files = []

def sort_result
    my_csv = CSV.read 'result.csv'
    my_csv.sort! { |a,b| a[1]] <=> b[1]] }
    CSV.open("result.csv", "w") do |csv|
      my_csv.each {|element| csv << element}
    end
end

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = get_names filename
		if name.size == 2
			last_name = name[1]
			first_name = name[0]
			digits = name[2].split(".").first
			if !student_checked? checked_files,first_name,last_name
				p "#{first_name},#{last_name},#{number}"
				if last_name.size == 10
					csv_array << [first_name,last_name]
					checked_files << [first_name, last_name]
				end
			end	
		end
	end
end

sort_result
