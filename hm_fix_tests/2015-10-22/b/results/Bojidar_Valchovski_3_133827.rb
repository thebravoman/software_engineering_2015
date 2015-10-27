require 'csv'

path_one = ARGV[0]
path_two = ARGV[1]

my_csv = []

Dir.glob(path_one + "*").each do |filename|
  name = filename.split("/").last
  if name.to_s.count("0-9") == 7
    length = name.length / 2
    my_csv << [name, length]
  end
end

Dir.glob(path_two + "*").each do |filename|
  name = filename.split("/").last
  if name.to_s.count("0-9") == 7
    length = name.length / 2
    my_csv << [name, length]
  end
end

my_csv.sort! { |a, b| b[0] <=> a[0] }
my_csv.uniq!

CSV.open("result.csv", "w") do |csv|
  my_csv.each { |line| csv << line }
end
