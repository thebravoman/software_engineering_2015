require 'csv'

folder = ARGV[0]

students = []

Dir.glob(folder + '/*').each do |filename|
    firstname = filename.split('/').last.split('_')[0]
    lastname = filename.split('/').last.split('_')[1]
    students.push([firstname, lastname])
end

five_letter_students = students.select { |x| x[1].length == 5 }
five_letter_students.sort! { |x, y| y[0] <=> x[0] }

CSV.open('result.csv', 'w') do |csv|
  five_letter_students.each_with_index do |entry, index|
    indexed_entry = [entry[0] + (index + 1).to_s, entry[1]]
    csv << indexed_entry
  end
end
