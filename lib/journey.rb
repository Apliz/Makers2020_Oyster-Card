class Journey

    attr_reader :journey, :latestjourney, :fare, :penalty

    PENALTY = 6
    MIN_FARE = 1

    def initialize
      @journey = []
      @latestjourney = {}
      @penalty = PENALTY
      @fare = []
      @min_fare = MIN_FARE
    end

    def start_journey(station)
        @latestjourney[station] = nil
    end    

    def end_journey(station)
        @latestjourney.transform_values! { station }
        @journey << @latestjourney
    end

    def in_journey?
        @latestjourney.keys != [] ? true : false
    end

    def min_fare
      @min_fare
    
    end

    
end