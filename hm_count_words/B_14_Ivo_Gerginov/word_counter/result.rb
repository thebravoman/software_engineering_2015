require 'csv'
require 'json'
require 'rexml/document'
require 'sqlite3'

class Result

  def initialize(marks, hash, fPath)
  	@marks = marks
  	@words = hash
    @name = fPath
  end

  def toDB
    if(File.exist?("./B_14_Ivo_Gerginov.db") == false)
      db  = SQLite3::Database.new("B_21_Martin_Galabov.db")
    else
      db = SQLite3::Database.open("B_21_Martin_Galabov.db")
    end
    db.execute('create table if not exists statistics(ID INTEGER PRIMARY KEY AUTOINCREMENT, source_name, hash)')
    db.execute('create table if not exists word_counts(static_id, word,occurences)')
    xdg = Digest::SHA256.file ARGV.first
    xdg.hexdigest
    db.execute('insert into statistics(source_name, hash) values (?, ?)', @name, @words)
    id = db.execute("select last_insert_rowid();")
    word_counter.each do |key, value|
      db.execute('insert into word_counts (static_id, word, occurences) values (?, ?, ?)', id, key, value)
    end
        db.execute('insert into word_counts (static_id, word, occurences) values (?, $marks$, ?)', id, marks_counter)
        db.close
  end

  def toCSV
    CSV.open('result.csv', 'w', {quote_char: " "}) do |csv|
  	  @words.sort_by{|key, value|[-value, key]}.each{ |e|
  		  csv << [e[0],e[1]]
  	  }
  	  csv << ['"marks"', @marks]
    end  
  end

  def toJSON
    hash = {
      "marks" => @marks.to_s,
      "words" => Hash[@words.sort_by{|key, value|[-value, key]}],
    }
    File.open('result.json', 'w') do |f|
      f << JSON.pretty_generate(hash)
    end
  end

  def toXML
  	xhash = Hash.new()
    xhash = Hash[@words.sort_by{|key, value|[-value, key]}]
    xfile = REXML::Document.new()
    format = REXML::Formatters::Pretty.new()
    xword_counts = xfile.add_element('word-counts')
    xmarks = xword_counts.add_element('marks')
    xwords = xword_counts.add_element('words')
    xmarks.add_text "#{@marks}"

    xhash.each do |key, value|
	  x = xwords.add_element('word')
	  x.add_attribute('count', value)
	  x.add_text "#{key}"
	end
    format.compact = true
    f = File.open('result.xml', 'w')
    xtabs = ''
    xfile.write(xtabs, 2)
    format.write(xfile, f)
    f.close
  end
  
  def Rectangle(x, y, w, h)
    '<rect x="' + x.to_s + '" y = "' + y.to_s + '" width="' + w.to_s + '" height="' + h.to_s + '" style="fill:rgb(100,200,100)" />'
  end

  def Text(x, y, size, string)
    '<text x="' + x.to_s + '" y="' + y.to_s + '" fill="dark-blue" font-size="' + size.to_s + '">' +  string.to_s + '</text>'
  end

  def toSVG
    ctr = 4
    File.open('B_14_Ivo_Gerginov.svg', 'w') do |f|
      f << '<svg xmlns = "http://www.w3.org/2000/svg" width ="100000" height = "1000000">' + "\n"
      @words.sort_by{|key, value|[-value, key]}.each{ |e| 
        f << Rectangle(4, ctr, (e[1].to_i*20), 18) + "\n"
        f << Text(4, (ctr + 15), 20,  "#{e[0]}, #{e[1]}") + "\n"
        ctr += 22
      }
      f << Text(4, (ctr + 15), 20, "\"marks\", #{@marks}") + "\n"
      f << '</svg>'
    end
  end

end