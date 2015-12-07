require 'json'

file = File.read("A_25_Svetlin_Yordanov.json")
data = Hash.new
data = JSON.parse(file)

data.keys.each do |school, classes|
	puts "#{school}"
	classes.keys.each do |class_name, students|
		puts "#{class_name}"
		students.keys.each do |student_name|
			puts "#{student1}"
			puts "#{student2}"
			puts "#{student3}"
		end
	end
end
