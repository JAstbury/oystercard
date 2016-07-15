class JourneyLog
  attr_reader :log
  attr_accessor :journey

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @log = []
    @journey = nil
  end

  def start(station)
    @log << {:Entry => journey.entry_station} if journey
    @journey = nil
    @journey = @journey_class.new(station)
  end

  def finish(station)
    current_journey.finish(station)
    @log << {:Entry => journey.entry_station, :Exit => journey.exit_station}
  end

  private

  def current_journey
    @journey || @journey = @journey_class.new
  end

end
