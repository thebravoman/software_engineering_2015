result = `ruby -I B_25_Petio_Tsvetkov_RRdWxRiRIZ B_25_Petio_Tsvetkov_RRdWxRiRIZ.rb test.txt xml`

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
