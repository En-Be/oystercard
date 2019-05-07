require 'oystercard'

describe Oystercard do
  let(:card) { Oystercard.new }

  it 'has 0 balance by default' do
    expect(card.balance).to eq(0)
  end

  it 'should respond to top_up with one argument' do
    card.top_up(10)
    expect(card.balance).to eq(10)
  end

  it 'should raise an error if topping up would exceed limit' do
    expect { card.top_up(100) }.to raise_error("Balance can\'t be more than #{Oystercard::DEFAULT_MAXIMUM}")
  end

end
