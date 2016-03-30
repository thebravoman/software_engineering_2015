result = `ruby -I A_24_Petar_Petrov_RRdWxRiRIZ/ A_24_Petar_Petrov_RRdWxRiRIZ.rb text.txt`
`rm B_13_Ivaylo_Arnaudov.db`

expected = 'a,1
any,1
is,1
marks,1
sentence,1
this,1
without,1
'

if result == expected
  1
else 
  0
end
