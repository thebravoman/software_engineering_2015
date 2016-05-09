result = 'ruby -I A_15_Kalin_Karev_RRdWxRiRIZ A_15_Kalin_Karev_RRdWxRiRIZ.rb test.txt json'


wanted = 
'{
  "marks": 0,
  "words": [
    [
      "are",
      1
    ],
    [
      "hello",
      1
    ],
    [
      "how",
      1
    ],
    [
      "you",
      1
    ]
  ]
}'

if result == wanted
	puts "1"
else 
	puts "0"
end
