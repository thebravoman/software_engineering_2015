result = `ruby -I A_21_Nikolay_Danailov_RRdWxRiRIZ A_21_Nikolay_Danailov_RRdWxRiRIZ.rb test.txt xml`

expected = '<word-counts>
    <marks>3</marks>
    <words>
        <word count="2">hello</word>
        <word count="1">friend</word>
        <word count="1">my</word>
        <word count="1">there</word>
        <word count="1">world</word>
    </words>
</word-counts>
'

if expected == result
  1
else
  0
end