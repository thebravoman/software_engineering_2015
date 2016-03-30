result = `ruby -I B_22_Nikolay_Karagyozov_RRdWxRiRIZ B_22_Nikolay_Karagyozov_RRdWxRiRIZ.rb https://raw.githubusercontent.com/thebravoman/software_engineering_2015/master/hm_count_words/text.txt`

expected = 'sentence,1
some,1
"marks",1
'

if expected.eql? result
 puts 1
else
 puts 0
end
