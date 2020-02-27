require 'oystercard'
require 'journey'

describe Oystercard do

    before (:each) do
        subject.top_up(10)
        subject.touchin("Aldgate")
        subject.touchout("Archway")
    end

    let(:station) { double :station}

    it 'Tops up && deducts balance when touching out' do
        expect(subject).to have_attributes(balance: 0)
        expect{subject.touchout(station)}.to change{subject.balance}.by(-10)
    end
    

    it 'tracks that balance does not exceed 90' do
        expect{subject.top_up(100)}.to raise_error "Limit reached, can't exceed #{subject.max_balance}!"
    end
    
    it 'touches in when balance >= 1' do
        expect(subject.journey?).to be true
        expect{subject.touchin(station)}.to raise_error "Can't touch in with less than £1, please top up!"
    end

 
    # it 'no money' do
    #     expect{subject.touchin(station)}.to raise_error "Can't touch in with less than £1, please top up!"
    # end
end

