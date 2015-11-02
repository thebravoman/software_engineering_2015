file = ARGV[0]

finalNames = []

Dir.glob(file + '*').each do |file|
  names = file.split('/').last.split('_')
  if names.length == 3 and !names.include? "~"
    lastname = names[1]
    if lastname.length == 5
      finalNames << [names[0],names[1]]
    end
  end
end

require 'csv'

finalNames.sort! {|a, b| -(a <=> b)}

count = 1

CSV.open("result.csv", "w") do |csv|
  finalNames.each do |name|
    csv << [name[0], name[1]]
    count = count + 1
  end
end
