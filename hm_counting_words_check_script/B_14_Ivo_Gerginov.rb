require 'csv'

CSV.open("result.csv", "w") do |csv|
  Dir.glob(ARGV[0]+"*").each do |filename|
	name = filename.split("/").last.split("_")
	result = `echo "go go go now now cmon cmon cmon cmon" > "input.txt" && ruby #{filename} ../hm_counting_words_check_script/input.txt`
	solved = 0
	if result.strip == "cmon,4\ngo,3\nnow,2"
	  solved = 1
	end 
	csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
	end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| [a[0],a[1]] <=> [b[0],b[1]] }
CSV.open("result.csv", "w") do |csv|
  my_csv.each {|element| csv << element}
end