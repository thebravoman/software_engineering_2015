module WordCounter
  require 'json'
  require 'rexml/document'
  require 'stringio'

  class Result
    MAX_BAR_HEIGHT = 200
    MAX_BAR_WIDTH = 15
    WORD_TEXT_Y = MAX_BAR_HEIGHT + 10

    attr_reader :word_counts, :marks_count

    def initialize(word_counts, marks_count)
      @word_counts = word_counts
      @marks_count = marks_count
    end

    def to_csv
      result = StringIO.new
      word_counts.each do |word, occurences|
        result << "#{word},#{occurences}\n"
      end

      if marks_count > 0
        result << "\"marks\",#{marks_count}\n"
      end

      result.string
    end

    def to_json
      hash_format = {
        "marks" => marks_count,
        "words" => word_counts
      }

      JSON.pretty_generate(hash_format)
    end

    def to_xml
      doc = REXML::Document.new
      doc.context[:attribute_quote] = :quote
      word_counts_element = doc.add_element('word-counts')

      marks_element = word_counts_element.add_element('marks')
      marks_element.add_text(marks_count.to_s)

      words_element = word_counts_element.add_element('words')

      word_counts.each do |word, count|
        word_element = words_element.add_element('word')
        word_element.add_attributes({'count' => count.to_s })
        word_element.add_text(word)
      end

      formatter = REXML::Formatters::Pretty.new(4)
      formatter.compact = true
      res = ''
      formatter.write(doc, res)
      res
    end

    def to_svg
      max_occur = word_counts[0][1]
      ratio = MAX_BAR_HEIGHT / max_occur.to_f
      x = 0
      y = 0
      h = MAX_BAR_HEIGHT

      File.open("B_13_Ivaylo_Arnaudov.svg", "w") do |file|
        file.puts get_headers_as_svg_string(word_counts.length)

        color = get_word_color()
        file.puts get_bar_rect_as_svg_string(x, y, h, color)
        file.puts get_word_text_as_svg_string(x, word_counts[0][0], color)

        word_counts.drop(1).each do |word, count|
          x, y, h = get_next_word_rectangle(x, ratio, max_occur, count)
          color = get_word_color()

          file.puts get_bar_rect_as_svg_string(x, y, h, color)
          file.puts get_word_text_as_svg_string(x, word, color)
        end

        file.puts "</svg>"
      end
    end

    private
    def get_next_word_rectangle(current_x, ratio, max_occur, curr_occur)
      x = current_x + MAX_BAR_WIDTH
      y = (max_occur - curr_occur) * ratio
      height = MAX_BAR_HEIGHT - y
      return x, y, height
    end

    private
    def get_headers_as_svg_string(word_counts_len)
      s = StringIO.new
      s << "<?xml version='1.0'?>\n"
      s << "<svg width='#{(word_counts_len * MAX_BAR_WIDTH).to_s}'" +
           " height='#{(MAX_BAR_HEIGHT + 150).to_s}'" +
           " xmlns='http://www.w3.org/2000/svg'>"
      s.string
    end

    private
    def get_word_color()
      "%06x" % (rand * 0xffffff)
    end

    private
    def get_word_text_as_svg_string(x, word, color)
      x_with_offset = (x + (MAX_BAR_WIDTH / 5.0)).to_s
      "<text transform='rotate(90 #{x_with_offset},#{WORD_TEXT_Y.to_s})'" +
      " x='#{x_with_offset}'" +
      " y='#{WORD_TEXT_Y}' fill='##{color}'" +
      " font-size='13' font-family='Tahoma'>#{word.to_s}</text>"
    end

    private
    def get_bar_rect_as_svg_string(x, y, h, color)
      "<rect height='#{h.to_s}' width='#{MAX_BAR_WIDTH.to_s}'" +
      " x='#{x.to_s}' y='#{y.to_s}' fill='##{color}'/>"
    end
  end end
