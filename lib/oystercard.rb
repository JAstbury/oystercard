class Oystercard

MAXIMUM_BALANCE = 90
attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Unable to top up: £#{MAXIMUM_BALANCE} limit exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

end
