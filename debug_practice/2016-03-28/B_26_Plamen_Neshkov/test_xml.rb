require_relative 'check_contents'

`ruby -I B_26_Plamen_Neshkov_RRdWxRiRIZ/ B_26_Plamen_Neshkov_RRdWxRiRIZ.rb test_without_marks.txt xml > result`

correct_contents = '
<word-counts>
    <marks>0</marks>
    <words>
        <word count="2">amet</word>
        <word count="2">dolor</word>
        <word count="2">ipsum</word>
        <word count="2">lorem</word>
        <word count="2">sit</word>
    </words>
</word-counts>
'

if check_contents(correct_contents) == true
  exit(1)
end
