result = `ruby -I A_21_Nikolay_Danailov_RRdWxRiRIZ A_21_Nikolay_Danailov_RRdWxRiRIZ.rb test.txt json`

expected = '{
  "marks": 3,
  "words": [
    [
      "hello",
      2
    ],
    [
      "friend",
      1
    ],
    [
      "my",
      1
    ],
    [
      "there",
      1
    ],
    [
      "world",
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