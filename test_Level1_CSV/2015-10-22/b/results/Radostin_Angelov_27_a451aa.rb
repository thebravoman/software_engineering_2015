file = ARGV[0]

finalNames = Hash.new

Dir.glob(file + '*').each do |file|
  names = file.split('_')
  if names.length == 3
    lastname = names[1]

    if lastname.to_s.length == 5
      finalNames["#{names[0]}".gsub("./", "")] = "#{names[1]}"
    end
  end
end

#finalNames.each do |name|

#finalNames.sort! {|a, b| a <=> b}

require 'csv'

CSV.open("result.csv", "w") do |csv|
  Hash[finalNames.sort].each {|element| csv << element}
end
