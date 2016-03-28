result = `ruby B_09_Georgi_Stoilov_RRdWxRiRIZ.rb without_marks.txt csv`

if result.include? "\"marks\""
  puts 0
else
  puts 1
end
