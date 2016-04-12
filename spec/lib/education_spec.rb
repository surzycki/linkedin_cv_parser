describe LinkedinCvParser::Education, focus: true do
  let(:section)  {{ head: [], text: '' }}
  let(:subject)  { LinkedinCvParser::Education.new(section) }

  describe 'attributes' do
    it 'has a univeristy' do
      expect(subject).to respond_to :univeristy
    end


    it 'has a degree' do
      expect(subject).to respond_to :degree
    end


    it 'has a field_of_study' do
      expect(subject).to respond_to :field_of_study
    end


    it 'has a start_date' do
      expect(subject).to respond_to :start_date
    end


    it 'has a end_date' do
      expect(subject).to respond_to :end_date
    end
  end

  describe 'return values' do
  end
end
