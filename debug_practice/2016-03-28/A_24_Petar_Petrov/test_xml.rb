result = `ruby -I A_24_Petar_Petrov_RRdWxRiRIZ/ A_24_Petar_Petrov_RRdWxRiRIZ.rb ../../../hm_count_words/text.txt xml`
`rm B_13_Ivaylo_Arnaudov.db`
expected = '<word-counts>
    <marks>1</marks>
    <words>
        <word count="1">sentence</word>
        <word count="1">some</word>
    </words>
</word-counts>
'
if result == expected
  1
else 
  0
end
