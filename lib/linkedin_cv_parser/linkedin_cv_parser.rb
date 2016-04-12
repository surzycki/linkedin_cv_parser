class LinkedinCvParser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  # Public API
  def fullname
    formatter.fullname
  end

  def current_position
    formatter.current_position
  end

  def location
    formatter.location
  end

  def summary
    formatter.summary
  end

  def experiences
    formatter.experiences
  end

  def educations
    formatter.educations
  end

  protected
  def file_reader
    @file_reader ||= FileReader.new(filename)
  end

  def parser
    @parser ||= Parser.new(file_reader)
  end

  def formatter
    @formatter ||= Formatter.new(parser)
  end
end
