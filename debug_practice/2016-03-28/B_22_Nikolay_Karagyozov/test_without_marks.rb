result = `ruby -I B_22_Nikolay_Karagyozov_RRdWxRiRIZ/ B_22_Nikolay_Karagyozov_RRdWxRiRIZ.rb test_markless.txt`

expected =
'wat,3
asd,1
dsa,1
'

if expected.eql? result
  puts 1
else
  puts 0
end
