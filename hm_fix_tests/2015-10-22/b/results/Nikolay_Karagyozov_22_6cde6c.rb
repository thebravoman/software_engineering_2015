require 'csv'

first_folder = ARGV[0]
second_folder = ARGV[1]

people_in_first_dir = []
Dir.glob(first_folder + "*") do |filename|
  filename = filename.split('/').last
  student_name = filename.split('_')[0] + ' ' + filename.split('_')[1]
  people_in_first_dir.push(student_name)
end

result = []

Dir.glob(second_folder + "*") do |filename|
  filename = filename.split('/').last
  student_name = filename.split('_')[0] +  ' ' + filename.split('_')[1]

  included = false
  people_in_first_dir.each do |person|
    included = true if (person.downcase == student_name.downcase)
  end

  result.push(student_name) if !included
end

result.sort_by { |a| [a.split(' ').first.downcase]}

CSV.open("result.csv", "w") do |csv|
  index = 1
  result.each do |item|
    first_name = item.split(' ').first
    last_name = item.split(' ').last
    csv << [last_name + index.to_s, first_name + index.to_s]
    index += 1
  end
end
