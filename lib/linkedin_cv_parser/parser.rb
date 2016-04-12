class LinkedinCvParser
  class Parser
    attr_accessor :data
    attr_reader :file_reader, :headers, :results

    def initialize(file_reader)
      @file_reader  = file_reader
      @data         = file_reader.convert_to_text
      @headers      = Array.new
      @results      = Array.new
    end

    # TODO brutish
    def parse
      remove_extra_headers
      parse_data
      #append_basic_information
    end

    protected
    def remove_extra_headers
      dataheader = [data[0],data[1],data[2]]

      result = (@data - dataheader)
      @data  = result
    end

    def parse_data
      current_section_index = -1
      next_header           = ''
      current_header        = ''
      subsections           = Array.new
      specialsections       = Array.new

      subsection            = false
      listsection           = false
      recommendation        = false

      @data.each do |line|
        if LinkedinCvParser::Utils.header?(line)
          @headers.push(line)
        end
      end

      @data.each_with_index do |line, index|
        next if Utils.skip_line?(line)
        # normalize lines
        line = line.gsub(/\s+/, " ").strip

        if Utils.header?(line)
          current_header = line
          next_header    = @headers[ @headers.index(current_header) + 1]

          current_section_index = current_section_index + 1
          @results.push( { head: line, text: '', sections: [] } )
        end

        # if the section has sub-sections and it is
        # not a header save it in a different array for parsing
        if subsection && !Utils.header?(line)
          if !subsections[current_section_index]
            subsections[current_section_index] = {head: [current_header], text: [] }
          end
          subsections[current_section_index][:text].push(line)
        # if listsection add to text as a list
        elsif listsection && !Utils.header?(line)
          @results[current_section_index][:text].push line
        elsif !Utils.page_number?(line) && !Utils.header?(line) && @results[current_section_index]
          # summary goes here
          unless Schema.specialsections.include? current_header
            text = @results[current_section_index][:text]
            @results[current_section_index][:text] = "#{text} #{line}".strip
          else
            # group special section for later parsing
            specialsections.push(line)
          end
        end

        # set the subsection flag if the header is subsection
        subsection = true if Schema.subsections.include? current_header
        # set the listsection flag if the header is listsection
        listsection = true if Schema.listsections.include? current_header
        # next line is the section after the special section
        if (@data[index + 1] == next_header) || !next_header
          subsection      = false
          listsection     = false
        end
      end

      # parse subsections
      subsections.each do |subsection|
        next if subsection.nil?

        text                   = subsection[:text]
        header_index           = @headers.index( subsection[:head].first)
        current_section_index  = -1

        text.each_with_index do |line, index|
          # find duration and the line above
          if Utils.duration?(line)
            head = [ text[index - 1],line]
            @results[header_index][:sections].push({ head: head, text: ''})
          end
        end

        text.each do |line|
          if Utils.duration?(line)
            current_section_index = current_section_index + 1
          else !Utils.page_number?(line)
            # this just checks if line is in the sections hash somewhere
            unless @results[header_index][:sections].map { |section| section[:head].include?(line) }.include?(true)
              text = @results[header_index][:sections][current_section_index][:text]
              @results[header_index][:sections][current_section_index][:text] = "#{text} #{line}".strip
            end
          end
        end
      end

      pp @results
      #pp specialsections
    end
  end
end
