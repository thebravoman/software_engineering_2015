input = 'ruby -I B_03_Bojidar_Valchovski_RRdWxRiRIZ B_03_Bojidar_Valchovski_RRdWxRiRIZ.rb test_without_marks.txt xml'

result = '<word-counts>
<words>
  <word count="3">a</word>
  <word count="1">is</word>
  <word count="1">this</word>
  <word count="1">sentence</word>
</words>
</word-counts>'

if input == result
  return true
end
return false
