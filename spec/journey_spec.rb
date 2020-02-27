require 'journey'
require 'oystercard'

describe Journey do

	before (:each) do
		subject.start_journey("Aldgate")
	end

	it "touching in and out stores one journey" do
		subject.end_journey("Archway")
		expect(subject.travel_history).to eq ([["Aldgate", "Archway"]])
	end

	it "tracks if card is in use" do
		expect(subject.in_journey?).to eq true
	end

	# it "initializes with a penalty fare of 6" do
	# 	expect(subject).to have_attributes(penalty: 6)  
	# end

	it "charges the regular fare correctly" do
		subject.end_journey("Archway")
		expect(subject.fare).to eq(1)
	end

	it "charges penalty fare correctly" do
		subject.end_journey(nil)
		expect(subject.fare).to eq 6
	end

end