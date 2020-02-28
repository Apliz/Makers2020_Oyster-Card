require 'journey'
require 'oystercard'
require 'journey_log'

describe Journey do

	it "charges penalty fare correctly" do
		expect(subject.fare({"Aldgate"=>nil})).to eq 6
	end

	it 'charges regular fare correctly' do
		expect(subject.fare({"Aldgate"=>"Archway"})).to eq(1)
	end

end