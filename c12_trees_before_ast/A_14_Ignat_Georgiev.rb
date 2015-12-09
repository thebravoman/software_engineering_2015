require 'json'

content = File.read("A_14_Ignat_Georgiev.json")
parsed = Hash.new
parsed = JSON.parse(content)


parsed.each do |school, other|
	puts "#{school}"
  other.each do |classes, name_hash|
  	puts " #{classes}"
    name_hash.each do |name|
      puts "  #{name}"
    end
  end
end