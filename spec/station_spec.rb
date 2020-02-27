require 'station'

describe Station do

	subject{described_class.new("Aldgate", 1)}

	it 'recognises station' do
		expect(subject).to have_attributes(station: "Aldgate")
	end

	it 'recognises zone' do
		expect(subject).to have_attributes(zone: 1)
	end
end
