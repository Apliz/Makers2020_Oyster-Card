require 'oystercard'
require 'journey'

describe Oystercard do

	let(:station) {double "Aldgate"}

	it 'cannot touch in if <1' do
		expect{subject.touchin(station)}.to raise_error "Can't touch in with less than £1, please top up!"
	end

	it 'Tops up' do
		expect{subject.top_up(1)}.to change{subject.balance}.by(+1)
	end
		
	it 'tracks that balance does not exceed 90' do
		expect{subject.top_up(100)}.to raise_error "Limit reached, can't exceed #{subject.max_balance}!"
	end
end