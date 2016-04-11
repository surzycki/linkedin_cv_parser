class LinkedinCvParser
  class FileReader
    attr_reader :filename

    def initialize(filename)
      @filename = filename
    end

    # Returns an array of strings containing each line in the dictionary
    def convert_to_text
      process_file(read_file(find_file(filename)))
    end

    protected
    # Reads a file while stripping leading and trailing whitespace, including
    # newlines, non breaking spaces, bullets
    def read_file(file)
      reader = PDF::Reader.new(file)
      reader.pages.map do |page|
        page.text
      end
    end

    def process_file(filearray)
      # join pages and split into big array
      result = filearray.join("\n").split("\n")
      # clean
      result = result.reject { |c| c.empty? }
      result = result.collect(&:strip)
      result = result.map {|s| s.gsub(/\u00A0|\u2026|\u2022/, '')}
    end

    def find_file(name)
      return name if File.exist?(name)

      raise ArgumentError.new("File '#{name}' wasn't found")
    end
  end
end
