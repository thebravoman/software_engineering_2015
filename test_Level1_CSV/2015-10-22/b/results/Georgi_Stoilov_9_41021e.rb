require 'csv'

pattern = /\b([a-zA-Z]+?)(\..+)/

CSV.open("result.csv", "w") do |csv_array|
  Dir.glob(ARGV[0]+"*").each do |filename|
    s = pattern.match(filename.split('/').last)
    if s
      full_name = s[0]
      length = full_name.size / 2
      csv_array << [full_name, length]
    end  
  end
  Dir.glob(ARGV[1]+"*").each do |filename|
    s = pattern.match(filename.split('/').last)
    if s
      full_name = s[0]
      length = full_name.size / 2
      csv_array << [full_name, length]
    end
  end
end

def sort_result
  my_csv = CSV.read 'result.csv'
  my_csv.sort! { |a,b| [a[1].to_i] <=> [b[1].to_i] }
  CSV.open("result.csv", "w") do |csv|
    my_csv.each {|element| csv << element}
  end
end

my_csv = sort_result
my_csv.uniq!
my_csv.reverse!
CSV.open("result.csv", "w") do |csv|
    my_csv.each {|element| csv << element}
  end
