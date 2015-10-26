require 'csv'

input_folder_1 = ARGV[0]
input_folder_2 = ARGV[1]
def is_digit? (digit)
  digit =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
end
help = []
CSV.open("result.csv", "w") do |csv_array|
  Dir.glob(input_folder_1 + "*").each do |files|
    names = files.split("/").last.split("_")
    if names.size == 3
      name1 = names[0]
      name2 = names[1]
      digit = names[2].split(".").first
      ext = names[2].split(".").last
      if (ext != "rb") or (is_digit?(digit) != 0) or (name1 == nil) or (name2 == nil)
				len = files.length
        csv_array << [files.split("/").last,len]
      end
		elsif
			len = files.length
			csv_array << [files.split("/").last,len]
		end
end
	Dir.glob(input_folder_2 + "*").each do |files|
		names = files.split("/").last.split("_")
		if names.size == 3
			name1 = names[0]
			name2 = names[1]
			digit = names[2].split(".").first
			ext = names[2].split(".").last
			if (ext != "rb") or (is_digit?(digit) != 0) or (name1 == nil) or (name2 == nil)
				len = files.length
				csv_array << [files.split("/").last,len]
			end
		elsif
			len = files.length
			csv_array << [files.split("/").last,len]
		end

	end
end
my_csv = CSV.read 'result.csv'
help = my_csv
help.sort! { |a, b| (a[1] == b[1]) ? (a[0] <=> b[0]) : (b[1] <=> a[1]) }
help.uniq!
CSV.open("result.csv","w") do |csv|
	help.each{|element| csv << element}
end
