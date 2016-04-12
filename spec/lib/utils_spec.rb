describe LinkedinCvParser::Utils do
  let(:subject) { LinkedinCvParser::Utils }

  describe '.header?' do
    it 'returns true' do
      [
        'Experience',
        'Education',
        'Profile Notes and Activity (1)',
        'Profile Notes and Activity (10)'
      ].each do |line|
        expect(subject.header? line).to be true
      end
    end


    it 'returns false' do
      ['Homer Simpson','Somewhere around the world'].each do |line|
        expect(subject.header? line).to be false
      end
    end
  end


  describe '.recommendation?' do
    it 'returns true' do
      ['person has recommended','people have recommended'].each do |line|
        expect(subject.recommendation? line).to be true
      end
    end


    it 'returns false' do
      ['gloob glurk','bloop blurk'].each do |line|
        expect(subject.recommendation? line).to be false
      end
    end
  end

  describe '.skip_line?' do
    it 'returns true' do
      [
        'Contact Jorge on LinkedIn',
      ].each do |line|
        expect(subject.skip_line? line).to be true
      end
    end


    it 'returns false' do
      [
        'John Smith',
        'Education',
        'Massachusetts Institute of Technology - Sloan School of Management'
      ].each do |line|
        expect(subject.skip_line? line).to be false
      end
    end
  end


  describe '.duration?' do
    it 'returns true' do
      [
        'October 2015 - Present (7 months)',
        'January 2012 - May 2014 (2 years 5 months)',
        'September 2004 - July 2006 (1 year 11 months)'
      ].each do |duration|
        expect(subject.duration? duration).to be true
      end
    end


    it 'returns false' do
      [
        'Readiness, Sales tools (CRM, BI tools...) and process management; being specially key in the',
        'January 2012 - May 2014',
        'Unit for Western Europe (14 countries), as',
        'aspects: (a) Business Planning (go-to-market and budgeting)',
        'tools (CRM, BI tools...) and process management',
        '',
        nil
      ].each do |duration|
        expect(subject.duration? duration).to be false
      end
    end
  end


  describe '.page_number?' do
    it 'return true' do
      [
        "123",
        "Page",
        "4000000"
      ].each do |line|
        expect(subject.page_number? line).to be true
      end
    end


    it 'return false' do
      [
        "123 Hello there",
        "Page of someone",
        "June 2014 - May 2015 (1 year)",
        "600a",
        "",
        nil
      ].each do |line|
        expect(subject.page_number? line).to be false
      end
    end
  end


  describe '.parse_date' do
    context 'format (month YYYY)' do
      it 'returns date' do
        expect(subject.parse_date 'June 2003').to eq(DateTime.new(2003,6))
      end
    end


    context 'format (YYYY)' do
      it 'returns date' do
        expect(subject.parse_date '2003').to eq(DateTime.new(2003))
      end
    end


    context 'format (Present)' do
      before { Timecop.freeze(Time.local(2016, 9)) }
      after  { Timecop.return }

      it 'returns date' do
        expect(subject.parse_date 'Present').to eq(DateTime.new(2016, 9))
      end
    end


    context 'format (nil)' do
      it 'returns nil' do
        expect(subject.parse_date nil).to be_nil
      end
    end


    context 'format (blank)' do
      it 'returns nil' do
        expect(subject.parse_date '').to be_nil
      end
    end
  end
end
