# LinkedinCvParser

This gem parses linkedIn CV's downloaded via the **Recruiter Account**.
This pdf format differs from the *standard* pdf downloaded via
a standard LinkedIn User's account

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'linkedin_cv_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install linkedin_cv_parser

## Usage

Basic usage

    parser = LinkedinCvParser.new(path/to/file.pfd)

    # Summary
    parser.fullname               => 'Jorge Torres'
    parser.current_position       => 'Business Operations Vice President, Europe, Middle East and Africa at Oracle'
    parser.location               => 'Madrid Area, Spain'
    parser.summary                => 'Professional with significant international experience in the IT and Management Consulting Services...'

    parser.experiences            => [ LinkedinCvParser::Experience, LinkedinCvParser::Experience, LinkedinCvParser::Experience]
    parser.educations             => [ LinkedinCvParser::Education, LinkedinCvParser::Education, LinkedinCvParser::Education]

    # Experiences
    experience = parser.experiences.first

    experience.title              => 'Business Operations and Demand Generation Director, Spain & Portugal at Oracle'
    experience.start_date         => DateTime
    experience.end_date           => DateTime

    # Educations
    education = parser.educations.first

    education.univeristy          => 'Massachusetts Institute of Technology - Sloan School of Management'
    education.degree              => 'MBA'
    education.field_of_study      => 'Mathematics'
    education.start_date          => DateTime
    education.end_date            => DateTime

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/surzycki/linkedin_cv_parser.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

