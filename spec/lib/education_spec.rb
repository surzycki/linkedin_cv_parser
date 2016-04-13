describe LinkedinCvParser::Education do
  let(:section)  {{ head: [], text: '' }}
  let(:subject)  { LinkedinCvParser::Education.new(section) }

  describe 'attributes' do
    it 'has a university' do
      expect(subject).to respond_to :university
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
    context 'when degree, field and year' do
      let(:section)  {{
        head:     'Universidad Nacional de Educacion a Distancia - U.N.E.D.',
        text:     'Master,Mathematics,2000-2006',
        sections: []
      }}


      it 'returns university' do
        expect(subject.university).to eq 'Universidad Nacional de Educacion a Distancia - U.N.E.D.'
      end


      it 'returns degree' do
        expect(subject.degree).to eq 'Master'
      end


      it 'returns field_of_study' do
        expect(subject.field_of_study).to eq 'Mathematics'
      end


      it 'returns start_date' do
        expect(subject.start_date).to eq DateTime.new(2000)
      end

      it 'returns end_date' do
        expect(subject.end_date).to eq DateTime.new(2006)
      end
    end


    context 'when degree and year' do
      let(:section)  {{
        head:     'Universidad Nacional de Educacion a Distancia - U.N.E.D.',
        text:     'Master,2000-2006',
        sections: []
      }}


      it 'returns university' do
        expect(subject.university).to eq 'Universidad Nacional de Educacion a Distancia - U.N.E.D.'
      end


      it 'returns degree' do
        expect(subject.degree).to eq 'Master'
      end


      it 'returns field_of_study' do
        expect(subject.field_of_study).to eq ''
      end


      it 'returns start_date' do
        expect(subject.start_date).to eq DateTime.new(2000)
      end

      it 'returns end_date' do
        expect(subject.end_date).to eq DateTime.new(2006)
      end
    end
  end
end
