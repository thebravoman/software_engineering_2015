require 'csv'
require 'json'
require 'rexml/document'
require 'sqlite3'

module WordCounter
  class Result
    def initialize(word_list, marks_count, digest)
      @word_counts = word_list
      @marks_count = marks_count
      @digest = digest
    end

    def to_csv
      CSV.open("result.csv","w") do |csv|
        @word_counts.each do |key, val|
          csv << [key, val]
          puts "#{key},#{val}"
        end
        csv << ["marks", @marks_count] if @marks_count > 0
        puts "\"marks\",#{@marks_count}" if @marks_count > 0
      end
    end

    def to_json
      File.open("result.json", "w") do |file|
        word_format = []
        @word_counts.each { |k, v| word_format.push([k, v]) }
        json_format = {
          "marks" => @marks_count,
          "words" => word_format
        }
        json = JSON.generate(json_format)
        file << json

        json
      end
    end

    def to_db(uri)
      db = SQLite3::Database.new("B_22_Nikolay_Karagyozov.db")

      db.execute(
      "CREATE TABLE IF NOT EXISTS statistics (
        id INTEGER PRIMARY KEY,
        source_name TEXT,
        hash TEXT
      );")

      db.execute(
      "CREATE TABLE IF NOT EXISTS word_counts (
        statistics_id INTEGER,
        word TEXT,
        count INTEGER
      );")

      cached_id = []
      begin
        cached_id = db.execute(
        "SELECT id FROM statistics
         WHERE hash=?", @digest)
      rescue
      end

      if (cached_id.length > 0)
        result = db.execute("SELECT * FROM word_counts
                             WHERE statistics_id=?",cached_id)
        return
      end

      begin
        db.execute(
        "SELECT id FROM statistics
         WHERE source_name=?", uri)
      rescue
        db.execute(
        "INSERT INTO statistics (source_name, hash)
         VALUES (?, ?)", [uri, content_hash])
      end

      id = db.execute(
      "SELECT id FROM statistics
       WHERE source_name=?", uri)

      @word_counts.each do |key, value|
        db.execute("INSERT INTO word_counts (statistics_id, word, count)
                    VALUES (?, ?, ?)", [id, key, value])
      end

      db.execute("INSERT INTO word_counts (statistics_id, word, count)
                  VALUES (?, ?, ?)", [id, "$marks$", @marks_count])
    end

    def to_xml
      xml = REXML::Document.new

      words_counts_e = xml.add_element("word-counts")
      words_counts_e.add_element("marks").add_text("#{@marks_count}")
      words_xml = words_counts_e.add_element("words")

      @word_counts.each do |key, val|
        word = words_xml.add_element("word")
        word.add_attribute("count", val)
        word.add_text("#{key}")
      end

      output = ''
      xml.write(output, 1)
      File.open("result.xml", "w") { |file| file << output }
      output
    end

    def to_svg
      best_key, best_value = @word_counts.first
      height_ratio = 200.0 / best_value
      File.open("result.svg", "w") do |f|
        f.write('<svg xmlns="http://www.w3.org/2000/svg">')
        f.write('<g transform="translate(0,450) scale(1,-1)">')
        @word_counts.each_with_index do |(key, val), index|
          f.write(get_rekt(15, val * height_ratio, 15 * index,))
          f.write(get_text(15 * index, 200, key))
        end
        f.write('</g>')
        f.write("</svg>")
      end
    end

    private

    def get_rekt(width, height, x_pos) #lol
      '<rect x="' + x_pos.to_s + '" y="200" width="' + width.to_s + '" height="' + height.to_s + '" stroke="red" fill="black" />' + "\n"
    end

    def get_text(x, y, text)
      x += 3
      '<text fill="green" x="' + x.to_s + '" y="' + y.to_s + '" font-family="Verdana" font-size="10"
      transform="rotate(90, ' + x.to_s + ', ' + y.to_s + ')">' + text + '</text>' + "\n"
    end
  end
end
