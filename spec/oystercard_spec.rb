require 'oystercard'
require 'journey'

describe Oystercard do

	let(:station) {double "Aldgate"}

	it 'cannot touch in if <1' do
		expect{subject.touchin(station)}.to raise_error "Can't touch in with less than £1, please top up!"
	end

	before (:example) do
		subject.top_up(1)
		subject.touchin(station)
		subject.touchout(station)
	end

	it 'Tops up && deducts balance when touching out' do
		expect(subject).to have_attributes(balance: 0)
		expect{subject.touchout(station)}.to change{subject.balance}.by(-1)
	end
		
	it 'tracks that balance does not exceed 90' do
		expect{subject.top_up(100)}.to raise_error "Limit reached, can't exceed #{subject.max_balance}!"
	end
end