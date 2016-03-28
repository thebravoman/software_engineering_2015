json = `ruby -I 11_B_Nikolay_Karagyozov_RRdWxRiRIZ/ 11_B_Nikolay_Karagyozov_RRdWxRiRIZ.rb test.txt json`

expected =
'{
  "marks": 3,
  "words": [
    [
      "wat",
      3
    ],
    [
      "asd",
      1
    ],
    [
      "dsa",
      1
    ]
  ]
}
'

if expected.eql? json
  puts 1
else
  puts 0
end
