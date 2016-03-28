xml = `ruby -I B_22_Nikolay_Karagyozov_RRdWxRiRIZ/ B_22_Nikolay_Karagyozov_RRdWxRiRIZ.rb test.txt xml`

expected =
'<word-counts>
    <marks>3</marks>
    <words>
        <word count="3">wat</word>
        <word count="1">asd</word>
        <word count="1">dsa</word>
    </words>
</word-counts>
'

if expected.eql? xml
  puts 1
else
  puts 0
end
