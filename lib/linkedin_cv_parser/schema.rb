class LinkedinCvParser
  class Schema
    class << self
      def headers
        [
          'Summary',
          'Experience',
          'Volunteer Experience',
          'Skills & Expertise',
          'Education',
          'person has recommended',
          'people have recommended',
          'Profile Notes and Activity',
          'Interests'
        ]
      end

      def subsections
        [
          'Experience',
          'Volunteer Experience'
        ]
      end

      def listsections
        [ 'Skills & Expertise' ]
      end

      def specialsections
        [ 'Education' ]
      end

      def lineLength() 99 end

      def replace
        [
          ['  -  ', ' - '],
          ['  at   ', ' at '],
          ['  ', ' '],
          [' , ', ', ']
        ]
      end
    end
  end
end
