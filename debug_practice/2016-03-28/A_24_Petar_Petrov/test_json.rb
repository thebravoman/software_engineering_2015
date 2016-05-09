result = `ruby -I A_24_Petar_Petrov_RRdWxRiRIZ/ A_24_Petar_Petrov_RRdWxRiRIZ.rb ../../../hm_count_words/text.txt json`
`rm B_13_Ivaylo_Arnaudov.db`
expected = 
'{
  "marks": 1,
  "words": [
    [
      "sentence",
      1
    ],
    [
      "some",
      1
    ]
  ]
}
'
if result == expected
  1
else 
  0
end
