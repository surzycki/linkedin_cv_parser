# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'linkedin_cv_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "linkedin_cv_parser"
  spec.version       = LinkedinCvParser::VERSION
  spec.authors       = ["stefan"]
  spec.email         = ["stefan.surzycki@gmail.com"]

  spec.summary       = %q{Parsing PDF CV's from LinkedIn Recruiter Account}
  spec.description   = %q{This gem parses linkedIn CV's downloaded via the Recruiter Account. This pdf format differs from the standard pdf downloaded via a standard LinkedIn User's account}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = ""
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "pdf-reader"

  spec.add_development_dependency "bundler", "~> 1.9.5"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard", "~> 2.13.0"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "timecop"
  spec.add_development_dependency "byebug"
end
