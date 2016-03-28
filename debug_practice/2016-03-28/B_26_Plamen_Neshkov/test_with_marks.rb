require_relative 'check_contents'

`ruby -I B_26_Plamen_Neshkov_RRdWxRiRIZ/ B_26_Plamen_Neshkov_RRdWxRiRIZ.rb test_with_marks.txt > result`

correct_contents = '
adipiscing,2
amet,2
consectetur,2
dolor,2
elit,2
ipsum,2
lorem,2
sit,2
"marks",6
'

if check_contents(correct_contents) == true
  exit(1)
end
