class Oystercard
  attr_reader :balance, :DEFAULT_MAXIMUM

  DEFAULT_BALANCE = 0
  DEFAULT_MINIMUM = 1
  DEFAULT_MAXIMUM = 90
  DEFAULT_TRAVELLING = false

  def initialize
    @balance = DEFAULT_BALANCE
    @travelling = DEFAULT_TRAVELLING
  end

  def top_up(amount)
    raise "Balance can't be more than #{DEFAULT_MAXIMUM}" if maximum_exceeded?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @travelling
  end

  def touch_in
    raise "you need at least #{DEFAULT_MINIMUM}" if @balance < DEFAULT_MINIMUM
    @travelling = true
  end

  def touch_out
    @travelling = false
  end

  private

  def maximum_exceeded?(amount)
    @balance + amount > DEFAULT_MAXIMUM
  end

end
