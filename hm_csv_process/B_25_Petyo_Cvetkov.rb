require 'csv'

inputFile = ARGV[0]
command = ARGV[1]
columnMin = ARGV[2]
ordMax = ARGV[3]
my_csv = CSV.read inputFile


def write_result my_csv
  CSV.open("result.csv", "w") do |csv|
    my_csv.each {|elements| csv << elements}
  end
end

  def sortResultAsc my_csv , columnMin
    if columnMin == "0"
      my_csv.sort! {|a,b| [a[0].to_s] <=> [b[0].to_s]}
    elsif columnMin == "1"
      my_csv.sort! {|a,b| a[1] <=> b[1]}
    elsif columnMin == "2"
      my_csv.sort! {|a,b| [a[2].to_i] <=> [b[2].to_i]}
    end
    write_result my_csv
  end

if command == "sort" && ordMax == "ASC"
  sortResultAsc my_csv , columnMin
elsif command == "sort" && ordMax == "DESC"
  sortResultAsc my_csv , columnMin
  my_csv.reverse
  write_result my_csv
elsif if command == "filter_cost" || command == "filter_costs"
  my_csv = my_csv.sort_by {|item| item[2].to_i}
  CSV.open("result.csv", "w") do |csv|
    my_csv.each do |item|
      if item[2].to_i >= columnMin.to_i && item[2].to_i <= ordMax.to_i
        csv << row
      end
    end
  end

  my_csv = CSV.read inputFile

end



end
