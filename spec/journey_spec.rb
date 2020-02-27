require 'journey'

describe Journey do

	before "initiating journey class" do
		subject.start_journey("Aldgate")
	end

	it "stores one journey" do
		subject.end_journey("Archway")
		expect(subject.latestjourney).to eq ({"Aldgate" => "Archway"})
	end

	it "tracks if card is in use" do
		expect(subject.in_journey?).to eq true
	end

	it "initializes with a penalty fare of 6" do
		expect(subject).to have_attributes(penalty: 6)  
	end

	it "initializes with a fare of 1" do
		expect(subject).to have_attributes(fare: [])  
	end

	it "returns the minimum fare" do
		expect(subject.min_fare).to eq 1
	end
end