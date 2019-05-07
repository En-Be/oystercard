require 'oystercard'

describe Oystercard do
  it 'has 0 balance by default' do
    card = Oystercard.new
    expect(card.balance).to eq(0)
  end
end
