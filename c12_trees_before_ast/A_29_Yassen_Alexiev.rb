require 'json'

file_contents = File.read('A_29_Yassen_Alexiev.json')
hash = JSON.parse(file_contents)

school = hash['school']
puts "#{school['name']}"
school["classes"].each do |c|
  puts " #{c["name"]}"
  c["students"].each do |s|
    puts "   #{s}"
  end
end
