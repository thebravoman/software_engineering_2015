require 'csv'

CSV.open("result.csv", "w") do |this_csv|
  Dir.glob(ARGV[0]+"*").each do |filename|
    name = filename.split("/").last.split("_")
	 if name.length == 3 && name.last.split(".").last == "rb" && name[2].length == 5
		this_csv << [name[0],name[1]]
	 end
  end
end

my_csv = CSV.read 'result.csv'

my_csv.sort! { |a, b| a[1] <=> b[1]}
my_csv.uniq!(&:first)

my_csv.each { |line| p line }
