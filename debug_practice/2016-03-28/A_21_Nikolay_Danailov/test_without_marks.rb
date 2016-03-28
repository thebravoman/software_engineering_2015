result = `ruby -I A_21_Nikolay_Danailov_RRdWxRiRIZ A_21_Nikolay_Danailov_RRdWxRiRIZ.rb test.txt`

expected = 'hey,1
there,1
'

if expected == result
  1
else
  0
end