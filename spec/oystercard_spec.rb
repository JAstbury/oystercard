require 'oystercard'

describe Oystercard do
  subject { described_class.new }

  it { is_expected.to respond_to :touch_in}
  it { is_expected.to respond_to :touch_out}
  it { is_expected.to respond_to :in_journey?}


  before do
    @min_fare = Oystercard::MINIMUM_FARE
  end

  describe "#balance" do
    it "is expected to return a float" do
      expect(subject.balance).to eq(0)
    end
  end

  describe "#top_up" do
    it "is expected to top up the oystercard by a specified amount" do
      subject.top_up(5)
      expect(subject.balance).to eq(5)
    end

    it "will raise an error if card limit reached" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect {subject.top_up(1)}.to raise_error "Unable to top up: £#{maximum_balance} limit exceeded"
    end
  end

  describe "#in_journey?" do
    it "checks if oysetercard is in journey" do
      expect(subject.in_journey?).to be(false)
    end
  end

    describe "#touch_in" do
      it "changes oysetercard's journey status to true" do
        subject.top_up(@min_fare)
        subject.touch_in
        expect(subject).to be_in_journey
      end

      it "raises and error if oyster card empty" do
        expect{subject.touch_in}.to raise_error "Card does not have minimum fare"
      end

    end

      describe "#touch_out" do
        it "changes oysetercard's journey status to false" do
          subject.top_up(@min_fare)
          subject.touch_in
          subject.touch_out
          expect(subject).not_to be_in_journey
    end

      it "deducts fare when card is touched out" do
        subject.top_up(@min_fare)
        subject.touch_in
        subject.touch_out
        expect{subject.touch_out}.to change{subject.balance}.by(-@min_fare)
      end
  end

end
