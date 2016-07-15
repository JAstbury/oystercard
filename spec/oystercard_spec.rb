require 'oystercard'

describe Oystercard do

subject(:card) {Oystercard.new }
let (:station) {double :station, zone: 1}

  describe '#initialize' do
    it 'initializes new card with balance of 0' do
      expect(card.balance).to eq 0
    end

    it 'initially has no journey history' do
      expect(card.journey_history).to eq []
    end
  end

  describe '#top_up' do
    it 'tells you when you top up' do
      expect{card.top_up(1)}.to change{card.balance}.by(1)
    end

   it 'there is a £90 limit' do
    card.top_up((Oystercard::MAXIMUM_BALANCE))
    expect{card.top_up(1)}.to raise_error "card limitted to £#{Oystercard::MAXIMUM_BALANCE}"
   end
  end

  describe '#touch_in' do
    it 'Requires minimum balance to touch in' do
      expect{card.touch_in(station)}.to raise_error 'Insufficient balance'
    end
  end

  describe '#touch_in and #touch_out' do
    before(:each)do
      card.top_up(5)
      card.touch_in(station)
    end

    it 'deducts the minimum fare on touch out' do
      expect{card.touch_out(station)}.to change{card.balance}.by(-Oystercard::MINIMUM_FARE)
    end

    it 'stores journey history' do
      card.touch_out(station)
      expect(card.journey_history).to eq [{:Entry => station, :Exit => station}]
    end

  end

end
