result = `ruby B_09_Georgi_Stoilov_RRdWxRiRIZ.rb test.txt xml`

expected = '<word-counts>
    <marks>2</marks>
    <words>
        <word count="2">am</word>
        <word count="2">i</word>
        <word count="1">george</word>
        <word count="1">seventeen</word>
    </words>
</word-counts>
'

if result == expected
  puts 1
else
  puts 0
end
