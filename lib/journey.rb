class Journey

	attr_reader :latestjourney, :fare, :penalty, :travel_history	

	PENALTY = 6
	STANDARD_FARE = 1
	
	def initialize
		@penalty = PENALTY
		@standard_fare = STANDARD_FARE
		@log = JourneyLog.new
	end

	def fare(journey)
		journey.has_key?(nil) || journey.value?(nil) ? @penalty : @standard_fare
	end
end