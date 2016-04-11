class LinkedinCvParser
  class Utils
    class << self
      def header?(line)
        Schema.headers.include? line
      end

      def recommendation?(line)
        line.include?('person has recommended') || line.include?('people have recommended')
      end

      def skip?(name, line)
        line == "Contact #{name} on LinkedIn"
      end
    end
  end
end
