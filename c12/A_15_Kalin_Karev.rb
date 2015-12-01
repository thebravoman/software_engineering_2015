require 'json'

file = File.read('A_15_Kalin_Karev.json')
new = JSON.parse(file)
new = Hash.new

new.each do |s, o|
		puts "#{school}"
	o.each do |c, n_h|
		puts "{c}"
			n_h.each do |n|
				puts "#{n}"
			end
	end	
end
