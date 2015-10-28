require 'csv'

my_csv = []
Dir.glob(ARGV[0] + "*").each do |x|
  data = x.split("/").last.split("_")
  if data[1].to_s.length == 10
    my_csv << [data[0], data[1]]
  end
end

my_csv.sort! {|a,b| a[1].to_s <=> b[1].to_s }

CSV.open('result.csv', 'w') do |csv|
  my_csv.each { |e| csv << e  }
end
