require 'csv'

folder1 = ARGV[0]
folder2 = ARGV[1]

pattern = /\b([a-zA-Z]+?)(\..+)/

my_csv = []
Dir.glob(folder1 + '*').each do |file|
  s = pattern.match(file.split('/').last)
  if s
    full_name = s[0]
    length = full_name.size / 2
    my_csv << [full_name, length]
  end
end

Dir.glob(folder2 + '*').each do |file|
  s = pattern.match(file.split('/').last)
  if s
    full_name = s[0]
    length = full_name.size / 2
    my_csv << [full_name, length]
  end
end

my_csv.sort! { |a, b| b[1] <=> a[1] }
my_csv.uniq!

CSV.open('result.csv', 'w') do |csv|
  my_csv.each { |line| csv << line } 
end
