require 'journey_log'
require 'journey'



# let(:journey_class_dbl) { double :}

describe JourneyLog do

  let(:journey_dbl) { double :journey, start_journey: nil}

  it 'can accept a new class' do
    allow(subject.journey_class).to receive(:new).and_return(journey_dbl)     
  end

  it 'can start a new journey from a double' do
    subject.start("Aldgate")
    expect(subject.latestjourney).to eq({"Aldgate"=>nil})
  end
end