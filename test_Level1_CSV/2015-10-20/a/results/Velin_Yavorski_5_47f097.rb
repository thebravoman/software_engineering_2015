require 'csv'

folder1 = ARGV[0]
folder2 = ARGV[1]

arr_folder1 = []
arr_folder2 = []

count = 0
csv_arr = []

Dir.glob(folder1+"*").each do |filename|
  name = filename.split("/").last.split("_")
  first_name = name[0]
  last_name =  name[1]
  arr_folder1 << [first_name, last_name]
end

Dir.glob(folder2+"*").each do |filename|
  name = filename.split("/").last.split("_")
  first_name = name[0]
  last_name =  name[1]
  arr_folder2 << [first_name, last_name]
end

arr_folder1.each do |arr|
  arr_folder2.each do |arr2|
    if(arr == arr2)
      count+=1
    end
  end
  if(count == 0)
      csv_arr << arr
  end
end

csv_arr = csv_arr.sort_by {|c| c[1]}.reverse

CSV.open("result.csv", "w") do |csv|
	  csv_arr.each {|element| csv << element}
end












