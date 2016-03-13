class Vector
  attr_accessor :square, :perimetr, :density, :elongation
  def initialize(square, perimetr, density, elongation)
    @square = square
    @perimetr = perimetr
    @density = density
    @elongation = elongation
  end

  def -(vec)
    Vector.new(@square - vec.square, @perimetr - vec.perimetr, @density - vec.density, @elongation - vec.elongation)    
  end

  def **(n)
    Vector.new(@square ** n, @perimetr ** n, @density ** n, @elongation ** n)
  end

  def sum
    @square + @perimetr + @density + @elongation
  end
end
