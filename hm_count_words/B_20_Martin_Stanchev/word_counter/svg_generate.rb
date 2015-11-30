module WordCounter
  class SVGGenerator    
    private
      def self.rectangle x,y,w,h
        '<rect x="'+x.to_s+'" y="'+y.to_s+'"
        width="'+w.to_s+'" height="'+h.to_s+'" style="fill:green;opacity:0.6;stroke:black;" />'
      end

      def self.text x,y,text
        '<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black" font-size="10">
        '+text+'
        </text>'
      end    
      
    public
      def self.create_graph(words)
        File.open('result.svg', 'w') do |content|
          content.write('<svg xmlns="http://www.w3.org/2000/svg">')
          
          width = 50
          height = 200
          
          ratio = height / words[0][1].to_f
          
          height += 30
          balance = width
          
          words.each do |index, key|
            key *= ratio
            content.write(rectangle(balance, height - key, width, key))
            content.write(text(balance + 2, height - (key-10), index))
            balance += width
          end
        
        content.write('</svg>')
        end
      end
  end
end
