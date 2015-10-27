require 'csv'
folder1 = ARGV[0]
folder2 = ARGV[1]
checked_files = []
my_csv = []
Dir.glob(folder1 + "*").each do |filename|
	name = filename.split("/").last.split("_")
    if (name.size == 3) && (name[0].size == 5)
		checked_files << name[0] + name[1]
		end
    end
   Dir.glob(folder2 + "*").each do |filename|
	name = filename.split("/").last.split("_")
    if (name.size == 3) && (name[0].size == 5) && checked_files.include?(name[0] + name[1])
		my_csv << [name[1], name[0]]
		end
    end

my_csv.sort! { |a,b| a[1].to_i <=> b[1].to_i }

CSV.open('result.csv', 'w') do |csv|
  my_csv.each { |line| csv << line } 
end
