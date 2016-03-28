result = `ruby -I B_27_Radostin_Angelov_RRdWxRiRIZ B_27_Radostin_Angelov_RRdWxRiRIZ.rb test_no_marks.txt`

expected = 'sentence,1
some,1
'

if expected == result
  1
else
  0
end
