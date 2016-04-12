class LinkedinCvParser
  class Formatter
    def initialize(parser)
      @parser = parser
    end

    def summary
      get_section('Summary')[:text]
    end

    def fullname
      get_subsection(
        get_section('Summary')[:sections],
        'Fullname'
      )[:text]
    end

    def current_position
      get_subsection(
        get_section('Summary')[:sections],
        'Position'
      )[:text]
    end

    def location
      get_subsection(
        get_section('Summary')[:sections],
        'Location'
      )[:text]
    end

    def experiences
      get_section('Experience')[:sections].map do |section|
        Experience.new(section)
      end
    end

    def educations
      get_section('Education')[:sections].map do |section|
        Education.new(section)
      end
    end

    protected
    attr_reader :parser
    def get_section(value)
      (parser.results.select {|section| section[:head] == value }).first
    end

    def get_subsection(sections, value)
      (sections.select{ |section| section[:head] == value }).first
    end
  end
end
