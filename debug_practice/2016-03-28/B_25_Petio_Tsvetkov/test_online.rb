result = `ruby -I B_25_Petio_Tsvetkov_RRdWxRiRIZ B_25_Petio_Tsvetkov_RRdWxRiRIZ.rb https://raw.githubusercontent.com/thebravoman/software_engineering_2015/master/hm_count_words/text.txt`

expected = 'sentence,1
some,1
"marks",1
'

if expected == result
 puts 1
else
 puts 0
end
