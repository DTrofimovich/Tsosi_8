class MObject
  attr_accessor :properties, :claster, :points
  def initialize(index, points)
    @index = index
    @points = points
  end

  def calculate_square
    @square = @points.count
  end

  def calculate_perimetr
    @perimetr = @points.count - @points.inject(0) do |its, point|
      point.is_surrounded_by_its_points? ? its + 1 : its
    end
  end

  def calculate_density
    @density = @perimetr ** 2 / @square.to_f
  end

  def calculate_senter_of_mass
    x = @points.inject(0) { |sum_x, point| sum_x + point.x } / @square.to_f
    y = @points.inject(0) { |sum_y, point| sum_y + point.y } / @square.to_f
    @senter_of_mass = { x: x, y: y }
  end

  def calculate_discrete_moments
    m02, m20, m11 = 0, 0, 0
    @points.each do |point|
      m20 += (point.x - @senter_of_mass[:x]) ** 2
      m02 += (point.y - @senter_of_mass[:y]) ** 2
      m11 += (point.x - @senter_of_mass[:x]) * (point.y - @senter_of_mass[:y])
    end
    @discrete_moments = { m02: m02, m20: m20, m11: m11 }
  end

  def calculate_elongation
    a = @discrete_moments[:m20] + @discrete_moments[:m02]
    b = (@discrete_moments[:m20] - @discrete_moments[:m02]) ** 2 + 4 * @discrete_moments[:m11] ** 2
    @elongation = a + Math.sqrt(b) / a - Math.sqrt(b)
  end

  def calculate_properties
    calculate_square
    calculate_perimetr
    calculate_density
    calculate_senter_of_mass
    calculate_discrete_moments
    calculate_elongation
    @properties = Vector.new(@square, @perimetr, @density, @elongation)
  end

  def puts_properties
    puts "Claster: #{@claster}"
    puts "Square: #{@square}"
    puts "Perimetr: #{@perimetr}"
    puts "Density: #{@density}"
    puts "Elongaion: #{@elongation}"
    puts
  end
end
