describe LinkedinCvParser::Utils do
  let(:subject) { LinkedinCvParser::Utils }

  describe '.header?' do
    it 'return true' do
      ['Experience','Education'].each do |line|
        expect(subject.header? line).to be true
      end
    end


    it 'return false' do
      ['Homer Simpson','Somewhere around the world'].each do |line|
        expect(subject.header? line).to be false
      end
    end
  end


  describe '.recommendation?' do
    it 'return true' do
      ['person has recommended','people have recommended'].each do |line|
        expect(subject.recommendation? line).to be true
      end
    end


    it 'return false' do
      ['gloob glurk','bloop blurk'].each do |line|
        expect(subject.recommendation? line).to be false
      end
    end
  end

  describe '.skip?' do
    it 'return true' do
      line_to_skip = 'Contact Jorge on LinkedIn'

      expect(subject.skip? 'Jorge', line_to_skip).to be true
    end


    it 'return false' do
      line_not_to_skip = 'I did stuff at a place'

      expect(subject.skip? 'Jorge', line_not_to_skip).to be false
    end
  end


  describe '.time?' do
    it 'return true' do
    end


    it 'return false' do
    end
  end


  describe '.page_num?' do
    it 'return true' do
    end


    it 'return false' do
    end
  end
end
