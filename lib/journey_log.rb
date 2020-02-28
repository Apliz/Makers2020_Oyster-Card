class JourneyLog

  attr_reader :journey_class, :latestjourney, :travel_history

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @@travel_history = []
    @latestjourney = {nil => nil}
  end

  def start(entry_station)
    @latestjourney[nil] = nil
    current_journey(entry_station)
  end

  def finish(station)
    @@travel_history = @@travel_history.push(@latestjourney.transform_values! {station}.first)
  end

  def journeys
    @@travel_history.dup
  end

  def in_journey?
    current_journey("status_only")
  end

  private

  def current_journey(entry_station = nil)
    if @latestjourney.has_key?(nil) && entry_station != "status_only"
      @latestjourney.transform_keys! {entry_station}
    else
      @latestjourney
    end
  end

end