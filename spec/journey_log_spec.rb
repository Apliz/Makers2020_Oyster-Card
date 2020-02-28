require 'journey_log'
require 'journey'

describe JourneyLog do
  let(:latestjourney_dbl) {double :latestjourney}
  let(:journey_dbl) { double :journey, in_journey?: :latestjourney_dbl}

  it 'can accept a new class' do
    allow(subject.journey_class).to receive(:new).and_return(journey_dbl)     
  end

  it 'can start a new journey' do
    subject.start("Aldgate")
    expect(subject.latestjourney).to eq({"Aldgate"=>nil})
  end

  it 'adds an exit station to the current journey' do
    subject.finish("Archway")
    expect(subject.latestjourney).to eq(nil=>"Archway") 
  end

  it 'should return a list of all previous journeys' do
    expect(subject.journeys).to eq([])
  end

  context '#current_journey' do
    it 'should return an incomplete journey correctly' do
      subject.start("Aldgate")
      allow(journey_dbl).to receive(:current_journey).and_return(latestjourney_dbl)
    end
  end
  

end