input = 'ruby -I B_03_Bojidar_Valchovski_RRdWxRiRIZ B_03_Bojidar_Valchovski_RRdWxRiRIZ.rb test_without_marks.txt json'

result = '{"words": [
["a",3],
["is",1],
["this",1],
["sentence",1]
]}
' 

if input == result
  return true;
end
return false;
