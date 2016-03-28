result = `ruby -I A_21_Nikolay_Danailov_RRdWxRiRIZ A_21_Nikolay_Danailov_RRdWxRiRIZ.rb test.txt json`

expected = '{
  "marks": 3,
  "words": [
    [
      "hello",
      4
    ],
    [
      "friend",
      2
    ],
    [
      "my",
      2
    ],
    [
      "there",
      2
    ],
    [
      "world",
      2
    ]
  ]
}'

if expected == result
  return 1
else
  return 0
end