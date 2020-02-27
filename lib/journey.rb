class Journey

		
	attr_reader :latestjourney, :fare, :penalty
		

	PENALTY = 6
	MIN_FARE = 1
	
	def initialize
		@travel_history = []
		@latestjourney = {}
		@penalty = PENALTY
		@fare = []
		@min_fare = MIN_FARE
	end

	def start_journey(station)
		@latestjourney[station] = nil
	end    

	def end_journey(station)
		@travel_history << @latestjourney.transform_values! { station }.first
	end
 

	def in_journey?
		@latestjourney.keys != [] ? true : false
	end

	def min_fare
		@min_fare
	end
end