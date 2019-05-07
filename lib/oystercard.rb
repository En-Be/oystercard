class Oystercard
  attr_reader :balance, :DEFAULT_MAXIMUM

  DEFAULT_BALANCE = 0
  DEFAULT_MAXIMUM = 90

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(amount)
    raise "Balance can't be more than #{DEFAULT_MAXIMUM}" if maximum_exceeded?(amount)
    @balance += amount
  end

  private

  def maximum_exceeded?(amount)
    @balance + amount > DEFAULT_MAXIMUM
  end

end
