result = `ruby -I ../../RRdWxRiRIZ/ ../../RRdWxRiRIZ.rb ../../../hm_count_words/text.txt`
`rm B_13_Ivaylo_Arnaudov.db`
result.delete!("\n")
result.delete!("\"")
if result.strip == "sentence,1some,1marks,1"
  return 1
end
