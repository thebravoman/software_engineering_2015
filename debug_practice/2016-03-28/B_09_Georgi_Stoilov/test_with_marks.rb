result = `ruby B_09_Georgi_Stoilov_RRdWxRiRIZ.rb marks.txt csv`

if result.include? "\"marks\",7"
  puts 1
else
  puts 0
end
