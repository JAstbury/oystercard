class Journey
  attr_reader :entry_station, :exit_station

  def initialize(station = nil)
    @entry_station = station
    @exit_station = nil
  end

  def complete?
    @entry_station && @exit_station
  end

  def fare
    complete? ? Oystercard::MINIMUM_FARE : Oystercard::PENALTY_FARE
  end

  def finish(station)
    @exit_station = station
  end
end
