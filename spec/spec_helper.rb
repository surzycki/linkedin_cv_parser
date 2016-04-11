$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'bundler/setup'
require 'linkedin_cv_parser'


ENV["TESTING_VIA_RSPEC"] = "true"

RSpec.configure do |config|
  config.filter_run :focus
end



