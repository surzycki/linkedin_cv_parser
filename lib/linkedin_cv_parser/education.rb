class LinkedinCvParser
  # TODO: put section knowledge in formatter
  class Education
    def initialize(section)
      @section = section
    end

    def university
      @university ||= section[:head]
    end

    def degree
      @degree ||= get_degree
    end

    def field_of_study
      @field_of_study ||= get_field_of_study
    end

    def start_date
      dates = get_dates(section[:text])
      @start_date ||= Utils.parse_date dates[0]
    end

    def end_date
      dates = get_dates(section[:text])
      @end_date ||= Utils.parse_date dates[1]
    end

    protected
    attr_reader :section

    def get_degree
      remove_date(section[:text]).split(',')[0]
    end

    def get_field_of_study
      remove_date(section[:text]).split(',')[1] || ''
    end

    def remove_date(value)
      value.gsub(/(\d{4}-\d{4})/,'')
    end

    def get_dates(value)
      value[/(\d{4}-\d{4})/].split('-')
    end
  end
end
