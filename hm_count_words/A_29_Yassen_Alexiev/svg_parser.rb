module WordCounter
  class SVGGenerator    
    private
      def rect x,y,w,h
        '<rect x="'+x.to_s+'" y="'+y.to_s+'"
        width="'+w.to_s+'" height="'+h.to_s+'" style="fill:green;opacity:0.6;stroke:black;" />'
      end

      def text x,y,text
        '<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black" font-size="10">
        '+text+'
        </text>'
      end    
      
    public
      def create_graph(words)
        File.open('result.svg', 'w') do |content|
          content.write('<svg xmlns="http://www.w3.org/2000/svg">')
          
          w = 50
          h = 200
          
          ratio = h / words[0][1].to_f
          
          h += 30
          balance = w
          
          words.each do |index, key|
            key *= ratio
            content.write(rect(balance, h - key, w, key))
            content.write(text(balance + 2, h - (key-10), index))
            balance += w
          end
        
        content.write('</svg>')
        end
      end
  end
end