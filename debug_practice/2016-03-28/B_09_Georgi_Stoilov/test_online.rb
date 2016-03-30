result = `ruby B_09_Georgi_Stoilov_RRdWxRiRIZ.rb https://raw.githubusercontent.com/thebravoman/software_engineering_2015/master/hm_count_words/text.txt csv`

expected = 'sentence,1
some,1
"marks",1
'

if result == expected
  puts 1
else
  puts 0
end
