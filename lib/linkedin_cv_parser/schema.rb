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
          'people have recommended'
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

      def onelinesections
        [  ]
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
