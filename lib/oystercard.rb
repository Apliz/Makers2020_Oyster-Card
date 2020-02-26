class Oystercard

	attr_reader :balance
	attr_reader :max_balance
	attr_reader :journeys
	attr_reader :lastjourney
	
	MAXBALANCE = 90	
	MINBALANCE = 1

	def initialize
		@balance = 0
		@max_balance = MAXBALANCE
		@minimum = MINBALANCE
		@journeys = []
		@lastjourney = {}
	end

	def top_up(amount)
		raise "Limit reached, can't exceed #{@max_balance}!" if @balance + amount > @max_balance 
		@balance += amount
	end

	def journey?
		true if @lastjourney.keys != []
	end

	def touchin(station = 'Railyard')
		raise "Can't touch in with less than £1, please top up!" if @balance < @minimum
		@lastjourney[station] = nil
	end

	def touchout(station)
		deduct(10)
		@lastjourney.transform_values! { station }
	end

	private

	def deduct(amount)
		@balance -= amount
	end
end