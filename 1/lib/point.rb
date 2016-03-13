class Point
  attr_accessor :x, :y, :color, :type

  def initialize x, y, color, points_image
    @x = x
    @y = y
    @color = color
    @points_image = points_image
  end

  def up
    @points_image[@x][@y - 1]
  end

  def down
    @points_image[@x][@y + 1]
  end

  def left
    @points_image[@x - 1][@y]
  end

  def right
    @points_image[@x + 1][@y]
  end

  def is_surrounded_by_its_points?
    @points_image[@x][@y - 1].type == type &&
    @points_image[@x][@y + 1].type == type &&
    @points_image[@x - 1][@y].type == type &&
    @points_image[@x + 1][@y].type == type
  end

  def white?
    if @color == CvColor::White
      true
    else
      false
    end
  end
end
