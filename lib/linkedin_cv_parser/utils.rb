class LinkedinCvParser
  class Utils
    class << self
      def header?(line)
        Schema.headers.include?(line) || line.include?('Profile Notes and Activity')
      end

      def recommendation?(line)
        line.include?('person has recommended') || line.include?('people have recommended')
      end

      def skip_line?(line)
        !!(line =~ /^Contact [\w]+ on LinkedIn$/)
      end

      def duration?(line)
        !!(line =~ /(((\w+ \d+) - (\w+ \d+)) \(([^\)]+)\))|(((\w+ \d+) - (Present)) \(([^\)]+)\))/)
      end

      def page_number?(line)
        (line == 'Page') || (Float(line) != nil rescue false)
      end
    end
  end
end
