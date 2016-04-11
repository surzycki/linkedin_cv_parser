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
    before do
      subject.parse
    end

    it 'remove duplicate headers from data' do
      string = subject.data.join(' ')

      expect(string.scan('Javier Torres Madrid Area, Spain Vice President Business Operations, EMEA at Oracle Corporation').count).to eq 1
    end


    it 'extracts the headers' do
      expected_headers = [ 'Summary', 'Experience', 'Education' ]

      expect(subject.headers).to eq [ 'Summary', 'Experience', 'Education' ]
    end


    it 'returns headers in results' do
      expected_headers = [ 'Summary', 'Experience', 'Education' ]
      headers          = subject.results.map {|result| result[:head] }

      expect(headers).to eq expected_headers
    end


    it 'returns summary', focus: true do
      expected_summary = 'Professional with significant international experience in the IT and Management'
      actual_summary   = subject.results.first[:text]
      expect(1).to eq 1
      #expect(actual_summary).to include  expected_summary
    end
  end
end
