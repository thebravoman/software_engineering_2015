module WordCounter
  class Draw_graph
    def self.draw_graph (word_counts, marks_count)
    File.open('B_25_Petyo_Cvetkov.svg', 'w') do |file|
      file.write('<svg xmlns="http://www.w3.org/2000/svg">')

      file.write(text(5, 35, "\"Marks\":", 90))
      file.write(text(5,75, marks_count.to_s,90))

      bar_w = 15
      bar_h = 220
      ratio = bar_h/word_counts[0][1].to_f
      offset = bar_w
      word_counts.each do |word,val|
        val *= ratio
        file.write(rectangle(offset, bar_h - val, bar_w, val))
         file.write(text(offset + 3, bar_h + bar_w/2, word,60 ))
         offset += bar_w
       end

       file.write('</svg>')
     end
   end


   private
     def self.rectangle x,y,w,h
       '<rect x="'+x.to_s+'" y="'+y.to_s+'"
       width="'+w.to_s+'" height="'+h.to_s+'"
       style="fill:green;opacity:0.6;stroke:black;
       stroke-width:1;" />'
     end

     def self.text x,y,word,rot
             '<text x="'+x.to_s+'" y="'+y.to_s+'" fill="red" font-size="9"
             transform="rotate('+rot.to_s+' '+x.to_s+','+y.to_s+')">
             '+word+'
             </text>'
           end
       end
     end
