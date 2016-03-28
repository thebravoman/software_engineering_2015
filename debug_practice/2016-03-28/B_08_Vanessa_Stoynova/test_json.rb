result = `ruby -I B_08_Vanessa_Stoynova_RRdWxRiRIZ B_08_Vanessa_Stoynova_RRdWxRiRIZ.rb test.txt json`

expected = '{
  "marks": 3,
  "words": [
    [
      "hello",
      4
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
  ]
}
'

if expected == result
  1
else
  0
end
