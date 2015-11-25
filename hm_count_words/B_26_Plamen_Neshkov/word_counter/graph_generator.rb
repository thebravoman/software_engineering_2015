module WordCounter
  class GraphGenerator
    def self.bar_graph(word_counts, marks_count)
      File.open('result.svg', 'w') do |f|
        f.write('<svg xmlns="http://www.w3.org/2000/svg">')

        bar_width = 10
        bar_height = 200
        ratio = bar_height / word_counts[0][1].to_f

        bar_height += bar_width
        offset = bar_width

        word_counts.each do |word, occur|
          occur *= ratio
          f.write(rectangle(offset, bar_height-occur, bar_width, occur))
          f.write(text(offset + 3, 215, word))
          offset += bar_width
        end

        f.write('</svg>')
      end
    end

    private
      def self.rectangle x,y,w,h
        '<rect x="'+x.to_s+'" y="'+y.to_s+'"
        width="'+w.to_s+'" height="'+h.to_s+'"
				style="fill:blue;opacity:0.6;stroke:black;
        stroke-width:1;" />'
      end

      def self.text x,y,word
        '<text x="'+x.to_s+'" y="'+y.to_s+'" fill="red" font-size="9"
        transform="rotate(90 '+x.to_s+','+y.to_s+')">
        '+word+'
        </text>'
      end
  end
end
