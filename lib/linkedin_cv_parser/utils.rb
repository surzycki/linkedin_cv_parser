# -*- encoding : utf-8 -*-
class LinkedinCvParser
  class Utils
    class << self
      def header?(line)
        Schema.headers.include?(line) || line.include?('Profile Notes and Activity') || recommendation?(line)
      end

      def recommendation?(line)
        line.include?('person has recommended') || line.include?('people have recommended')
      end


      def degree_line?(line)
        trigger_word  = %w{ MBA Master BS Diploma Bachelor CEMS }.any? { |degree| line.include? degree }
        year_format_1 = !!(line =~ /(\d{4}-\d{4})/)
        year_format_2 = !!(line =~ /(\d{4} - \d{4})/)

        (trigger_word || year_format_1 || year_format_2)
      end

      def skip_line?(line)
        trigger_word = ['Activites and Societies'].any? { |degree| line.include? degree }
        watermark    = !!(line =~ /^Contact [\w]+ on LinkedIn$/)

        (trigger_word || watermark)
      end

      def duration?(line)
        !!(line =~ /(((\w+ \d+) - (\w+ \d+)) \(([^\)]+)\))|(((\w+ \d+) - (Present)) \(([^\)]+)\))/)
      end

      def page_number?(line)
        (line == 'Page') || (Float(line) != nil rescue false)
      end

      def parse_date(value)
        begin
          if value.downcase == 'present'
            DateTime.now
          else
            DateTime.strptime(value, '%B %Y') rescue Date.strptime(value, '%Y')
          end
        rescue
          nil
        end
      end
    end
  end
end
