class Oystercard

	attr_reader :balance
	attr_reader :max_balance
	attr_reader :journey
	attr_reader :touchin_station
	
	MAXBALANCE = 90	
	MINBALANCE = 1

	def initialize
		@balance = 0
		@max_balance = MAXBALANCE
		@minimum = MINBALANCE
		@touchin_station = nil
	end

	def top_up(amount)
		raise "Limit reached, can't exceed #{@max_balance}!" if @balance + amount > @max_balance 
		@balance += amount
	end

	def journey?
		true if @touchin_station != nil
	end

	def touchin(station = 'Railyard')
		@balance < @minimum ? raise("Can't touch in with less than £1, please top up!") : @journey = true; @touchin_station = station
	end

	def touchout
		deduct(10)
		@journey = false
		@touchin_station = nil
	end

	private

	def deduct(amount)
		@balance -= amount
	end
end