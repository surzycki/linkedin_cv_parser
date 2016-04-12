describe LinkedinCvParser::Experience do
  let(:section)  {{ head: [], text: '' }}
  let(:subject)  { LinkedinCvParser::Experience.new(section) }

  describe 'attributes' do
    it 'has a title' do
      expect(subject).to respond_to :title
    end


    it 'has a description' do
      expect(subject).to respond_to :description
    end


    it 'has a company' do
      expect(subject).to respond_to :company
    end


    it 'has a position' do
      expect(subject).to respond_to :position
    end


    it 'has a start_date' do
      expect(subject).to respond_to :start_date
    end


    it 'has a end_date' do
      expect(subject).to respond_to :start_date
    end


    it 'has is current?' do
      expect(subject).to respond_to :current?
    end
  end

  describe 'return values' do
    let(:section)  {{
      head: ['Software Tester intern at Robert Bosch GmbH', 'June 2003 - August 2003 (3 months)'],
      text: 'Analyzed critical strategic issues for some of the top companies'
    }}



    it 'returns title' do
      expect(subject.title).to eq 'Software Tester intern at Robert Bosch GmbH'
    end


    it 'returns description' do
      expect(subject.description).to eq 'Analyzed critical strategic issues for some of the top companies'
    end


    it 'returns company' do
      expect(subject.company).to eq 'Robert Bosch GmbH'
    end


    it 'returns position' do
      expect(subject.position).to eq 'Software Tester intern'
    end


    it 'returns start_date' do
      expect(subject.start_date).to eq DateTime.new(2003,6)
    end


    it 'returns end_date' do
      expect(subject.end_date).to eq DateTime.new(2003,8)
    end
  end

  describe '#current?' do
    context 'when current experience' do
      let(:section)  {{
        head: ['Software Tester intern at Robert Bosch GmbH', 'June 2003 - Present'],
        text: 'Analyzed critical strategic issues for some of the top companies'
      }}

      it 'returns true' do
        expect(subject.current?).to be true
      end
    end

    context 'when NOT current experience' do
      let(:section)  {{
        head: ['Software Tester intern at Robert Bosch GmbH', 'June 2003 - July 2012'],
        text: 'Analyzed critical strategic issues for some of the top companies'
      }}

      it 'returns false' do
        expect(subject.current?).to be false
      end
    end
  end
end
