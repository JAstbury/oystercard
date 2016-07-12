require_relative 'station'

class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1
attr_reader :balance, :entry_station, :journey_history

  def initialize
    @balance = 0
    @entry_station = nil
    @journey_history = {}
  end

  def top_up(amount)
    maxbalanceerror = "Unable to top up: £#{MAXIMUM_BALANCE} limit exceeded"
    fail maxbalanceerror if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Card does not have minimum fare" if @balance < MINIMUM_FARE
    @in_journey = true
    @entry_station = station
  end

  def touch_out(station2)
    @in_journey = false
    deduct(MINIMUM_FARE)
    journey_history[@entry_station] = station2
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
