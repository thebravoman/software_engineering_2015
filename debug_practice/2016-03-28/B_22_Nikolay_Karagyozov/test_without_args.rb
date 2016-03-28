result = `ruby -I 11_B_Nikolay_Karagyozov_RRdWxRiRIZ/ 11_B_Nikolay_Karagyozov_RRdWxRiRIZ.rb test.txt`

expected =
'wat,3
asd,1
dsa,1
"marks",3
'

if expected.eql? result
  puts 1
else
  puts 0
end
