describe LinkedinCvParser::Parser do
  let(:filename)     { "#{LinkedinCvParser.root}/spec/fixtures/javier-pro.pdf"}

  let(:subject)      { LinkedinCvParser::Parser.new file_reader }
  let(:file_reader)  { LinkedinCvParser::FileReader.new filename}

  describe '#initialize' do
    it 'initializes' do
      expect{ subject }.to_not raise_error
    end
  end

  describe '#parse' do
    it 'parses headers' do
      expected_headers = [ 'Summary', 'Experience', 'Education', 'Profile Notes and Activity (1)' ]
      headers          = subject.results.map {|result| result[:head] }

      expect(headers).to eq expected_headers
    end


    it 'parses experiences' do
      experience_section = (subject.results.select {|section| section[:head] == 'Experience' }).first

      expect(experience_section[:sections].count).to eq 9
    end


    it 'parses educations' do
      education_section = (subject.results.select {|section| section[:head] == 'Education' }).first
    end
  end
end
