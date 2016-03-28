require_relative 'check_contents'

`ruby -I B_26_Plamen_Neshkov_RRdWxRiRIZ/ B_26_Plamen_Neshkov_RRdWxRiRIZ.rb > result`

correct_contents = '
No arguments provided
'

if check_contents(correct_contents) == true
  exit(1)
end
