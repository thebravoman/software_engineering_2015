require 'csv'
cf = []
CSV.open("result.csv", "w") do |csv_array|
  Dir.glob(ARGV[0]+"*").each do |filename|
    name = filename.split("/").last.split("_")
    name_r = filename.split("/").last
    num = name_r.length
    if name.size != 3
 	csv_array << [name_r, name_r.length]
	cf << name_r + num.to_s
    end
end
  Dir.glob(ARGV[1]+"*").each do |filename|
    name = filename.split("/").last.split("_")
    name_r = filename.split("/").last
    num = name_r.length.to_s
    if name.size != 3
      if !cf.include?(name_r + num)
        csv_array << [name_r, name_r.length]
     end
    end
  end
end

my_csv = CSV.read 'result.csv'
my_csv = my_csv.sort_by {|a, b| [b, a]}
CSV.open("result.csv", "w") do |csv_arr|
  my_csv.each {|element| csv_arr << element}
end
