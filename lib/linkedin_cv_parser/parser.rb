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
      extract_first_name
      parse_data
    end

    protected
    attr_reader :first_name

    def remove_extra_headers
      dataheader = [data[0],data[1],data[2]]

      result = (@data - dataheader)
      @data  = dataheader + result
    end

    def extract_first_name
      fullname    =  @data.first
      @first_name = fullname.split(' ').first
    end

    def parse_data
      current_section_index = 0
      next_header           = ''
      current_header        = ''
      subsections           = Array.new

      subsection            = false
      listsection           = false
      onelinesection        = false
      recommendation        = false

      @data.each do |line|
        if LinkedinCvParser::Utils.header?(line)
          @headers.push(line)
        end
      end

      @data.each_with_index do |line, index|
        next if Utils.skip?(@first_name, line)
        # normalize lines
        line = line.gsub(/\s+/, " ").strip

        if Utils.header?(line)
          current_header = line
          next_header    = @headers[ @headers.index(current_header) + 1]

          current_section_index = current_section_index + 1

          @results.push( { head: line, text: [], sections: [] } )
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
        # onelinesection and not a header save it for more parsing
        elsif onelinesection && !Utils.header?(line)
          puts "here in onleinesection"
        # save the line in the sections text array if the line
        # is not a page number and the length is greater that the base
        # paragraph line length
        elsif @results[current_section_index] && !Utils.page_number?(line) && !Utils.header?(line)
          text = @results[current_section_index][:text]
          @results[current_section_index][:text] = "#{text} #{line}".strip
        end

        # set the subsection flag if the header is subsection
        subsection = true if Schema.subsections.include? current_header
        # set the listsection flag if the header is listsection
        listsection = true if Schema.listsections.include? current_header
        # set the onelinesection flag if the header is a onelinesection
        onelinesection = true if  Schema.onelinesections.include? current_header

        # next line is the section after the special section
        if (@data[index + 1] == next_header) || !next_header
          subsection      = false
          listsection     = false
          onelinesection  = false
        end
      end

      puts @results
      puts '-----'
      puts subsections
    end
  end
end
