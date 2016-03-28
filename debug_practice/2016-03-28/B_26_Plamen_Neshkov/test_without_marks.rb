require_relative 'check_contents'

`ruby -I B_26_Plamen_Neshkov_RRdWxRiRIZ/ B_26_Plamen_Neshkov_RRdWxRiRIZ.rb test_without_marks.txt > result`

correct_contents = '
amet,2
dolor,2
ipsum,2
lorem,2
sit,2
'

if check_contents(correct_contents) == true
  exit(1)
end
