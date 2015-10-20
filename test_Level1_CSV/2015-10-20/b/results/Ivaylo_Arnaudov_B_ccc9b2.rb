require 'csv'

first_folder = ARGV[0]
second_folder = ARGV[0]

students = []

Dir.glob(ARGV[0]) do |filename|
  file1_firstname = filename.split('_')[0]
  file1_lastname = filename.split('_')[1]
  students.push([file1_firstname, file1_lastname])
end

Dir.glob(ARGV[1]) do |filename|
  file2_firstname = filename.split('_')[0]
  file2_lastname = filename.split('_')[1]
  students.push([file2_firstname, file2_lastname])
end

five_letters_firstname_students = students.select { |x| x[0].length == 5 }
five_letters_firstname_students.uniq!(&:first)
five_letters_firstname_students.sort! { |x, y| x[1] <=> y[1] }

CSV.open('result.csv', 'w') do |csv|
  five_letters_firstname_students.each do |entry|
    csv << entry.reverse!
  end
end
