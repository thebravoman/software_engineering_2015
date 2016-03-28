result = `ruby -I A_21_Nikolay_Danailov_RRdWxRiRIZ A_21_Nikolay_Danailov_RRdWxRiRIZ.rb test.txt xml`

expected = '<word-counts>
    <marks>3</marks>
    <words>
        <word count="4">hello</word>
        <word count="2">friend</word>
        <word count="2">my</word>
        <word count="2">there</word>
        <word count="2">world</word>
    </words>
</word-counts>
'

if expected == result
  puts 'XML works correctly!'
else
  puts "XML doesn't work correctly!"
end