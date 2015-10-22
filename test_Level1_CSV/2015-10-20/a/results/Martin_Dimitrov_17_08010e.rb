require 'csv'

CSV.open("result.csv", "w") do |csv|
  Dir.glob(ARGV[0] + ARGV[1] "*").each do |filename|
	name = filename.split("/").last.split(".")
    if (name.size == 2) && (['A'..'Z'].included_in?(name)) && (['a'..'z'].included_in?(name))
		csv << [name[0],name[1], (filename.size) / 2]
		end
    end
end


my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| ,a[1].to_i <=> b[1].to_i }
my_csv.reverse!
CSV.open("result.csv", "w") do |csv|
  my_csv.each {|element| csv << element}
end