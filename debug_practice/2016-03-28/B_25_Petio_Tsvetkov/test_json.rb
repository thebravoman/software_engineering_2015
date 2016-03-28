result = `ruby -I B_25_Petio_Tsvetkov_RRdWxRiRIZ B_25_Petio_Tsvetkov_RRdWxRiRIZ.rb test.txt json`

expected = '{
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

if expected == result
 1
else
 0
end
