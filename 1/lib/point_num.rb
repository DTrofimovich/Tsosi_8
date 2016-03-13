class PointNum
  attr_reader :num
  @@i = 0
  def initialize
    @@i += 1
    @num = @@i
  end

  def edit(num)
    @num = num
  end
end
