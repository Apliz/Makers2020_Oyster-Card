


In order to keep using public transport
As a **customer**
I want to **add money** to my **card**

```ruby

oystercard = Oystercard.new
oystercard.topup(Integer)
# The integer amount will be added to an instance variable (wallet) += the previous total amount. 
```

In order to pay for my journey
As a **customer**
I need my **fare** **deducted** from my **card**

```ruby

oystercard = Oystercard.new
oystercard.deduct(Integer)
# The integer amount should be deducted from @balance. UNLESS @balance < Integer
```

In order to get through the barriers.
As a **customer**
I need to **touch** **in and out**.

```ruby
oystercard = Oystercard.new

oystercard.touchin
#set .journey? to true

oystercard.touchout
#set .journey? to false
```



In order to know where I have been
As a customer
I want to **see all my previous trips**

```ruby
oystercard = Oystercard.new

def initialize
	@previous_journeys = []
	@last_journey = { "Entry Station" => "Exit Station"}
end

oystercard.touchin(station)
oystercard.touchout(station)

#touchin should . . . 
# 1. move the @last_journey hash k,v pair as a nested array and push it to @previous journeys
# 2. replace the @last_journey HASH KEY with the parameter STATION

#touchout should . . . 
# 1. replace the @ last_journey HASH VALUE with the parameter STATION
```