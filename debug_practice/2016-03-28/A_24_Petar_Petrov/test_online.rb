result = `ruby -I A_24_Petar_Petrov_RRdWxRiRIZ/ A_24_Petar_Petrov_RRdWxRiRIZ.rb http://www.theuselessweb.com/`
`rm B_13_Ivaylo_Arnaudov.db`

expected = 'useless,3
the,2
web,2
a,1
because,1
by,1
couldn,1
do,1
holman,1
just,1
me,1
please,1
some,1
submit,1
t,1
take,1
tim,1
to,1
tweet,1
twholman,1
we,1
website,1
websites,1
without,1
"marks",9
'
if result == expected
  1
else 
  0
end
