Oyster Challenge
=======

The task was to recreate London's oyster card system. Users can top up their oyster card and tap in and out of journeys. The card has a minimum fare and a maximum limit and a penalty fare is deducted if users forget to touch in or out.

How to Use
-----

1. Clone the repo to your local machine
2. Run IRB or Pry
3. Require './lib/oystercard'

Example of how to run the full program:

```ruby
card = OysterCard.new
card.top_up(10)
card.balance #=> 10
waterloo = Station.new("Waterloo", 1)
balham = Station.new("Balham", 3)
card.touch_in(waterloo)
card.touch_out(balham)
card.balance #=> 7
```
