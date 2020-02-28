class Oystercard

	attr_reader :balance, :max_balance, :journeys, :lastjourney 
	
	MAXBALANCE = 90	
	MINBALANCE = 1

	def initialize(journey_class = Journey.new, journey_log_class = JourneyLog.new)
		@balance = 0
		@max_balance = MAXBALANCE
		@minimum = MINBALANCE
		@journey = journey_class
		@log = journey_log_class
	end

	def top_up(amount)
		raise "Limit reached, can't exceed #{@max_balance}!" if @balance + amount > @max_balance 
		@balance += amount
	end

	def touchin(station = 'Railyard')
		raise "Can't touch in with less than £1, please top up!" if @balance < @minimum
		@log.start(station)
	end

	def touchout(station)
		@log.finish(station)
		deduct(@journey.fare(@log.latestjourney))
	end

	def journeys
		@log.journeys
	end

	private

	def deduct(amount)
		@balance -= amount
	end
end