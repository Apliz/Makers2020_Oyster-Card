require 'oystercard'

describe Oystercard do
	it 'Loads money onto oystercard' do
		expect(subject).to have_attributes(balance: 0)
	end	

	it 'Tops up the given amount of money' do
		subject.top_up(10)
		expect(subject).to have_attributes(balance: 10)
	end	

	it 'Total does not exceed 90' do
		expect{subject.top_up(100)}.to raise_error "Limit reached, can't exceed #{subject.max_balance}!"
	end

	it 'Total does not exceed 90' do

		subject.top_up(10)
		expect{subject.top_up(90)}.to raise_error "Limit reached, can't exceed #{subject.max_balance}!"
	end

	it 'deducts money from the card' do
		subject.top_up(10)
		subject.touchout
		expect(subject).to have_attributes(balance: 0)
	end
	
	it 'touches in' do
		subject.top_up(1)
		subject.touchin("Aldgate")
		expect(subject.journey?).to be true
	end

	it 'touches out' do
		subject.touchout
		expect(subject.journey?).to be nil
	end

	it 'DOTH HATH NO MONEY BIATCH' do
		expect{subject.touchin("Aldgate")}.to raise_error "Can't touch in with less than £1, please top up!"
	end 

	it 'should deduct the correct fare' do
		expect{subject.touchout}.to change{subject.balance}.by(-10)
	end

	it 'remembers the entry station' do
		subject.top_up(1)
		entry_var = double("entry", :station => "Aldgate")
		expect(subject.touchin("Aldgate")).to eq(subject.touchin_station)
	end
end