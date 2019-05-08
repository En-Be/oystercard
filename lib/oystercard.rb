class Oystercard
  attr_reader :balance, :DEFAULT_MAXIMUM, :entry_station, :journeys

  DEFAULT_BALANCE = 0
  DEFAULT_MINIMUM = 1
  DEFAULT_MAXIMUM = 90

  def initialize
    @balance = DEFAULT_BALANCE
    @entry_station = nil
    @journeys = {}
  end

  def top_up(amount)
    raise "Balance can't be more than #{DEFAULT_MAXIMUM}" if maximum_exceeded?(amount)
    @balance += amount
  end

  def in_journey?
    entry_station != nil
  end

  def touch_in(station)
    raise "you need at least #{DEFAULT_MINIMUM}" if @balance < DEFAULT_MINIMUM
    @entry_station = station
    #@journeys[station] = nil
  end

  def touch_out(out_station)
    @balance -= DEFAULT_MINIMUM
    @journeys[@entry_station] = out_station
    @entry_station = nil
  end

  def entry_station
    @entry_station
  end

  private

  def maximum_exceeded?(amount)
    @balance + amount > DEFAULT_MAXIMUM
  end

  def deduct(amount)
    @balance -= amount
  end
end
