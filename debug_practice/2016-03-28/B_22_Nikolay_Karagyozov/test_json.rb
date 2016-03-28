json = `ruby -I B_22_Nikolay_Karagyozov_RRdWxRiRIZ/ B_22_Nikolay_Karagyozov_RRdWxRiRIZ.rb test.txt json`

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
