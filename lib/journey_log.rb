class JourneyLog

  attr_reader :journey_class, :latestjourney

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @travel_history = []
    @latestjourney = {}
  end

  def start(station)
    @latestjourney[station] = nil
  end


end