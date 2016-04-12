describe LinkedinCvParser do
  let(:subject)      { LinkedinCvParser.new(filename)}
  let(:filename)     { "#{LinkedinCvParser.root}/spec/fixtures/javier-pro.pdf"}

  it 'has a version number' do
    expect(LinkedinCvParser::VERSION).not_to be nil
  end


  it 'has a summary' do
    expected_summary = 'Professional with significant international experience in the IT and Management'

    expect(subject.summary).to include expected_summary
  end


  it 'has a fullname', focus: true do
    expected_fullname = 'Javier Torres'
    expect(subject.fullname).to eq expected_fullname
  end


  it 'has a current_position' do
    expected_current_position = 'Vice President Business Operations, EMEA at Oracle Corporation'
    expect(subject.current_position).to eq expected_current_position
  end


  it 'has a location' do
    expected_location = 'Madrid Area, Spain'
    expect(subject.location).to eq expected_location
  end


  it 'has experiences' do
    expect(subject.experiences.count).to eq 9
  end


  it 'has educations' do
    expect(subject.educations.count).to eq 3
  end
end
