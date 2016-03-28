result = `ruby -I B_09_Georgi_Stoilov_RRdWxRiRIZ B_09_Geogri_Stoilov_RRdWxRiRIZ.rb test.txt`

expected = 'am,2
i,2
george,1
seventeen,1
"marks",2
'

if expected == result
  1
else
  0
end
