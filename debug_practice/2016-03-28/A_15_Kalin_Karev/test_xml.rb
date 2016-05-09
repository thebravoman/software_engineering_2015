result = 'ruby -I A_15_Kalin_Karev_RRdWxRiRIZ A_15_Kalin_Karev_RRdWxRiRIZ.rb test.txt xml'


wanted = 
'<word-counts>
    <marks>0</marks>
    <words>
        <word count="1">are</word>
        <word count="1">hello</word>
        <word count="1">how</word>
        <word count="1">you</word>
    </words>
</word-counts>
'

if result == wanted
	puts "1"
else 
	puts "0"
end
