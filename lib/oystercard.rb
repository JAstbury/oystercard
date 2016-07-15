require_relative'station'
require_relative 'journey_log'
require_relative 'journey'

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :balance, :journey

  def initialize
    @balance = 0
    @journey_history = JourneyLog.new
  end

  def top_up(amount)
    fail "card limitted to £90" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def journey_history
    @journey_history.log.dup
  end

  def touch_in(station)
    deduct(PENALTY_FARE) if @journey_history.journey
    fail 'Insufficient balance' if balance < MINIMUM_FARE
    @journey_history.start(station)
  end

  def touch_out(station)
    @journey_history.finish(station)
    deduct(@journey_history.journey.fare)
    @journey_history.journey = nil
  end

  private

    def deduct(amount)
      @balance -= amount
    end

end
