require 'journey_log'

describe JourneyLog do

  let(:station) {double :station}
  let(:journey) {double :journey}
  let(:journey_class) {double :journey_class, new: journey}
  subject {described_class.new(journey_class: journey_class)}

  describe '#start' do
    it 'should start a new journey with an entry station' do
      expect(journey_class).to receive(:new).with(station)
      subject.start(station)
    end

    it 'records a journey' do
      allow(journey_class).to receive(:new).and_return journey
      subject.start(station)
      expect(subject.journey).to eq journey
    end
  end
 
 # describe '#finish' do
 #   it 'record a hourney on finish' do
 #     station = Station.new
 #     subject.start(station)
 #     subject.finish(station)
 #     expect(subject.log).to include station
 #   end
 # end
end
