result = `ruby B_28_Toma_Marinov.rb file.txt json`

result = result.split.join(' ')
result = result.gsub(' ', '')

if result == '{"marks":3,"words":[["hehe",2],["heh",1]]}'
	puts 1
end