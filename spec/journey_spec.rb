require 'journey.rb'

describe Journey do

    it "starts and ends a journey" do
      subject.start_journey("Aldgate")
      subject.end_journey("Archway")
      expect(subject.latestjourney).to eq ({"Aldgate" => "Archway"})
    end

    it "tracks if card is in use" do
      subject.start_journey("Aldgate")
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
  
    # it "returns penalty if no entry or exit station" do
    #     subject.start_journey("Aldgate") 
    #     subject.start_journey("Aldgate")
    #     expect(subject.min_fare).to eq 6
    # end
end