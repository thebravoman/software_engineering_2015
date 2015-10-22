require 'csv'
folder1 = ARGV[0]
folder2 = ARGV[1]

my_csv = []
my_csv2 = []

Dir.glob(folder2 + '*').each do |file|
  filename = file.split("/").last.split("_")
  my_csv2 << [filename[0], filename[1], filename[2].split(".").first]
end

Dir.glob(folder1 + '*').each do |file|
  filename = file.split("/").last.split
  if !my_csv2.include?(filename[0]) && my_csv2.include?(filename[1])
    my_csv2 << [filename[0], filename[1], filename[2].split(".").first]

  end
end
  my_csv.sort! {|a,b| a[1] <=> b[1]}
  CSV.open('result.csv', 'w') do |csv|
  my_csv.each { |line| csv << line }
end
