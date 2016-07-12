require 'oystercard'

describe Oystercard do
  subject { described_class.new }

  let(:station) {double :station}
  let(:station2) {double :station2}

  before do
    @min_fare = Oystercard::MINIMUM_FARE
    subject.top_up(@min_fare)
  end

  describe "#top_up" do
    it "is expected to top up the oystercard by a specified amount" do
      expect(subject.balance).to eq(@min_fare)
    end

    it "will raise an error if card limit reached" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      expect {subject.top_up(maximum_balance)}.to raise_error "Unable to top up: £#{maximum_balance} limit exceeded"
    end
  end

  describe "#in_journey?" do
    it "checks if oysetercard is in journey" do
      expect(subject.in_journey?).to be(false)
    end
  end

    describe "#touch_in" do

      before do
        subject.touch_in(station)
      end

      it "changes oysetercard's journey status to true" do
        expect(subject).to be_in_journey
      end

      it "raises and error if oyster card empty" do
        subject.touch_out(station2)
        expect{subject.touch_in(station)}.to raise_error "Card does not have minimum fare"
      end

      it "remember the entry station of current journey" do
        expect(subject.entry_station).to eq station
      end

    end

      describe "#touch_out(station2)" do

        before do
          subject.touch_in(station)
          subject.touch_out(station2)
        end

        it "changes oysetercard's journey status to false" do
          expect(subject).not_to be_in_journey
        end

      it "deducts fare when card is touched out" do
        expect{subject.touch_out(station2)}.to change{subject.balance}.by(-@min_fare)
      end

      it "sets entry station to nil" do
        expect(subject.entry_station).to eq nil
      end
  end

  describe '#journey' do

    it '#records the users journey history' do
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.journey_history).to eq(station => station2)
    end

    it '#checks new card history is empty' do
      expect(subject.journey_history).to eq({})
    end

  end

end
