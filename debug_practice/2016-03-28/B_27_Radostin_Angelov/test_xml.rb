result = `ruby -I B_27_Radostin_Angelov_RRdWxRiRIZ B_27_Radostin_Angelov_RRdWxRiRIZ.rb test.txt xml`

expected = '<word-counts>
    <marks>1</marks>
    <words>
        <word count="1">sentence</word>
        <word count="1">some</word>
    </words>
</word-counts>
'

if expected == result
  1
else
  0
end
