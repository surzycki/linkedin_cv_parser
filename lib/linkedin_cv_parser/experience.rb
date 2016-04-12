class LinkedinCvParser
  class Experience
    def initialize(section)
      @section = section
    end

    def title
      @title ||= section[:head][0]
    end

    def description
      @description ||= section[:text]
    end

    def start_date
      dates = get_dates(section[:head][1])
      @start_date ||= Utils.parse_date dates[0]
    end


    def end_date
      dates = get_dates(section[:head][1])
      @end_date ||= Utils.parse_date dates[1]
    end


    def current?
      dates = get_dates(section[:head][1])
      dates[1].downcase == 'present'
    end

    protected
    attr_reader :section

    def get_dates(value)
      value = value.gsub(/\(([^\)]+)\)/,'')
      value.split('-').map(&:strip)
    end
  end
end
