require 'oystercard'

describe Oystercard do
  it 'has 0 balance by default' do
    card = Oystercard.new
    expect(card.balance).to eq(0)
  end

  it 'should respond to top_up with one argument' do
    card = Oystercard.new
    #expect(card).to respond_to(:top_up).with(1).argument
    card.top_up(10)
    expect(card.balance).to eq(10)
  end

end
