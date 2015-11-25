class Result
  attr_accessor :marks_count
  attr_accessor :word_counts
  def initialize 
    @marks_count = 0
    @word_counts = Hash.new(0)
  end

  def to_csv
    word_counts.each do|word, num|
      puts word+','+num.to_s
    end
    if marks_count!=0
      puts '"marks"'+','+marks_count.to_s
    end
  end


  def to_json
    json_hash = {
		"marks"=>marks_count,
		"words"=>word_counts
}
    json_hash2= JSON.pretty_generate(json_hash)		
  end
def rect x,y,width,height
'<rect width="'+width.to_s+'" y ="'+y.to_s+'" x ="'+x.to_s+'" height="'+height.to_s+'" style="fill:rgb(250,250,250);stroke-width:3;stroke:rgb(0,0,0)"/>'
end
  def to_svg
    File.open("result.svg","w") do |f|
      f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	temp = word_counts.first.last
	y = temp
	temp = temp/200 +1 
	x = 20
        word_counts.each do |word, num|
	   temp_y = (300- y)-y
	   f.write(rect(x,temp_y,30,temp*num*10))
	    f.write('<text x="'+(x+2).to_s+'" y="'+(temp_y-7).to_s+'" textLength = "'+(temp*num*10-2).to_s+'" transform="rotate(90 '+x.to_s+','+temp_y.to_s+')" fill="black">'+word+'</text>')
	   x+=40
          
	end
      f.write('</svg>')
    end
  end
  def to_xml
  xml_new = REXML::Document.new('')
  xml_word_counts=xml_new.add_element('word-counts')
  xml_mrks =xml_word_counts.add_element('marks')
  xml_mrks.add_text "#{marks_count}"
  xml_words = xml_word_counts.add_element('words')
  word_counts.each do |word, count|
    word = xml_words.add_element('word', 'count' => count).text = "#{word}"
  end
  formatter = REXML::Formatters::Pretty.new(2)
  formatter.compact = true
  formatter.write(xml_new, $stdout)
  puts
  end

end
