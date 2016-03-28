result = `ruby B_09_Georgi_Stoilov_RRdWxRiRIZ.rb test.txt json`

expected = '{
  "marks": 2,
  "words": [
    [
      "am",
      2
    ],
    [
      "i",
      2
    ],
    [
      "george",
      1
    ],
    [
      "seventeen",
      1
    ]
  ]
}
'

if result == expected
  puts 1
else
  puts 0
end
