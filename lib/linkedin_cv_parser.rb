require 'pdf-reader'

require 'linkedin_cv_parser/version'
require 'linkedin_cv_parser/utils'
require 'linkedin_cv_parser/experience'
require 'linkedin_cv_parser/education'
require 'linkedin_cv_parser/schema'
require 'linkedin_cv_parser/file_reader'
require 'linkedin_cv_parser/formatter'
require 'linkedin_cv_parser/parser'
require 'linkedin_cv_parser/linkedin_cv_parser'


class LinkedinCvParser
  def self.root
    File.dirname __dir__
  end
end
