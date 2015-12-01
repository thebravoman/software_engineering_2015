module WordCounter
  class GraphMaker
      def rectangle w,h
        '<rect width="'+w.to_s+'" height="'+h.to_s+'" 
         style="fill:rgb(0,0,0);stroke-width:3;stroke:rgb(0,0,0)" />'
      end
      File.open("result.svg","w") do |f|
        f.write('<svg xmlns="http://www.w3.org/2000/svg">')
        
        f.write(rectangle 40,100)
        f.write('</svg>')
      end
  end
end
