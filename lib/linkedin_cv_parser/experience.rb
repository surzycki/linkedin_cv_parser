class LinkedinCvParser
  # TODO: put section knowledge in formatter
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

    def company
      @company ||= get_company
    end

    def position
      @position ||= get_postition
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

    def get_company
      title.split('at').map(&:strip)[1]
    end

    def get_postition
      title.split('at').map(&:strip)[0]
    end
  end
end
