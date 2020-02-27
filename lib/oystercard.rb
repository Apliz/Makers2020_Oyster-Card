class Oystercard

	attr_reader :balance, :max_balance, :journeys, :lastjourney, :Journey
	
	MAXBALANCE = 90	
	MINBALANCE = 1

	def initialize
		@balance = 0
		@max_balance = MAXBALANCE
		@minimum = MINBALANCE
		@journey = Journey.new
	end

	def top_up(amount)
		raise "Limit reached, can't exceed #{@max_balance}!" if @balance + amount > @max_balance 
		@balance += amount
	end

	def journey?
		@journey.in_journey?()
	end

	def touchin(station = 'Railyard')
		raise "Can't touch in with less than £1, please top up!" if @balance < @minimum
		@journey.start_journey(station)
	end

	def touchout(station)
		#deduct(@journey.fare)
		@journey.end_journey(station)	
		deduct(@journey.fare)
	end

	private

	def deduct(amount)
		@balance -= amount
	end
end