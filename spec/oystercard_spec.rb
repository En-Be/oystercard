require 'oystercard'

describe Oystercard do
  #let(:card) { Oystercard.new }

  it 'has 0 balance by default' do
    expect(subject.balance).to eq(0)
  end

  it 'should respond to top_up with one argument' do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end

  it 'should raise an error if topping up would exceed limit' do
    expect { subject.top_up(100) }.to raise_error("Balance can\'t be more than #{Oystercard::DEFAULT_MAXIMUM}")
  end

  it 'should be able to deduct money from balance' do
    expect {subject.deduct(10)}.to change{subject.balance}.by (-10)
  end

  it 'should respond to in_journey' do
    expect(subject).to respond_to(:in_journey?)
  end

  it 'in_journey? default to false' do
    expect(subject.in_journey?).to eq(false)
  end

  it 'touch_in should change in_journey? to true' do
    subject.top_up(10)
    subject.touch_in
    expect(subject.in_journey?).to eq(true)
  end

  it 'touch_in should change in_journey? to true' do # alternative test with predicate matcher
    subject.top_up(10)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'touch_out should change in_journey? to false' do
    subject.top_up(10)
    subject.touch_in
    expect { subject.touch_out }.to change { subject.in_journey? }.to(false).from(true)
  end

  it 'touch_out should change in_journey? to false' do # alternative test with predicate matcher
    subject.top_up(10)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it 'touching_in with no balance should raise error' do
    expect { subject.touch_in}.to raise_error ("you need at least #{Oystercard::DEFAULT_MINIMUM}")
  end
end
