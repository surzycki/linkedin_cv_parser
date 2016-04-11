describe LinkedinCvParser::FileReader do
  let(:filename) { "#{LinkedinCvParser.root}/spec/fixtures/javier-pro.pdf"}
  let(:subject)  { LinkedinCvParser::FileReader.new filename}

  describe '#initialize' do
    it 'initializes' do
      expect{ subject }.to_not raise_error
    end
  end

  describe 'converts pdf' do
    it 'return array of string' do
      [ 'Javier Torres',
        'Madrid Area, Spain',
        'Massachusetts Institute of Technology - Sloan School of Management',
        'Education'
      ].each do |line|
        expect(subject.convert_to_text).to include(line)
      end
    end


    it 'return proper length array' do
      expect(subject.convert_to_text.count).to eq 116
    end


    it 'raises exepction if not found' do
      bad_filename = 'somefile.pdf'
      subject      = LinkedinCvParser::FileReader.new bad_filename
      expect{ subject.convert_to_text }.to raise_error(ArgumentError)
    end
  end
end
