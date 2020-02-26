
class Station
  attr_reader :station
  attr_reader :zone

  def initialize(station, zone)
    @station = station
    @zone = zone
  end
end
