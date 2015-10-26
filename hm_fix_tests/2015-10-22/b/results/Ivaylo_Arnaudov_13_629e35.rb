require 'csv'

folder = ARGV[0]

students = []

Dir.glob(folder + '*.rb').each do |filename|
    firstname = filename.split('/').last.split('_')[0]
    lastname = filename.split('/').last.split('_')[1]
    if firstname != nil && lastname != nil
      students.push([firstname, lastname])
    end
end

five_letter_students = students.select { |x| x[1].length == 5 }
five_letter_students.sort! { |x, y| y[0] <=> x[0] }

CSV.open('result.csv', 'w') do |csv|
  five_letter_students.each do |student|
    csv << student
  end
end
