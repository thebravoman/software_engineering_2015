require 'json'

contents = File.read('B_13_Ivaylo_Arnaudov.json')
data_hash = JSON.parse(contents)

school = data_hash['school']
puts "School name: #{school['name']}"
school["classes"].each do |c|
  puts "- #{c["name"]}"
  c["students"].each do |s|
    puts "-- #{s}"
  end
end
