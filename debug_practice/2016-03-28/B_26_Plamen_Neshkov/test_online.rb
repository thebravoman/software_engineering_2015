require_relative 'check_contents'

`ruby -I B_26_Plamen_Neshkov_RRdWxRiRIZ/ B_26_Plamen_Neshkov_RRdWxRiRIZ.rb https://google.com > result`

correct_contents = '
moved,6
302,4
document,2
has,2
here,2
the,2
'

if check_contents(correct_contents) == true
  exit(1)
end
