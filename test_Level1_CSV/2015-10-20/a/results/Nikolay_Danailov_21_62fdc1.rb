require 'csv'

RESULT_FILE = "result.csv"

folder1 = ARGV[0]
folder2 = ARGV[1]
ARGV.clear

checked_students = []

CSV.open(RESULT_FILE, "w") do |csv|
	Dir.glob(folder1+"/*").each do |file_path|
		file_name = file_path.split("/").last
		student_first_name = file_name.split("_").first
		student_last_name = file_name.split("_")[1]
		checked_students << [student_first_name, student_last_name]
	end

	Dir.glob(folder2+"/*").each do |file_path|
		file_name = file_path.split("/").last
		student_first_name = file_name.split("_").first
		student_last_name = file_name.split("_")[1]

		if !checked_students.include? [student_first_name, student_last_name]
      csv << [student_last_name, student_first_name]
		end
	end
end

my_csv = CSV.read RESULT_FILE
my_csv = my_csv.sort_by { |a| a[1] }.reverse
CSV.open(RESULT_FILE, "w") do |csv|
  my_csv.each {|element| csv << element}
end