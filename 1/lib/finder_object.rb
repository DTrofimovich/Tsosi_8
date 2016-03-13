class FinderObject
	def initialize(img)
		@points_image = img.points_image
		@height = img.height
		@width = img.width
    @objects = {}
  end

	def find_object
		1.upto(@height - 1) do |y|
			1.upto(@width - 1) do |x|
        if @points_image[x][y].white?
          check_neighboars(@points_image[x][y])
        end
			end
		end
    get_object
	end

  def check_neighboars(point)
    up_point = point.up
    left_point = point.left
    case
    when !up_point.white? && !left_point.white?
      point.type =  PointNum.new
    when left_point.white? && !up_point.white?
      point.type = left_point.type
    when up_point.white? && !left_point.white?
      point.type = up_point.type
    when up_point.white? && left_point.white?
      if up_point.type == left_point.type
        point.type = up_point.type
      else
        point.type = up_point.type
        left_point.type.edit(point.type.num)
      end
    end
  end

  def get_object
    objects = []
    0.upto(@width - 1) do |x|
      0.upto(@height - 1) do |y|
        add_point_to_object(@points_image[x][y]) if @points_image[x][y].type
      end
    end
    @objects.each do |name, points|
      objects << MObject.new( name, points)
    end
    objects
  end

  def add_point_to_object point
    name = point.type.num.to_s
    if !@objects.keys.include?(name.to_sym)
      @objects[name.to_sym] = []
    end
    @objects[name.to_sym] << point
  end
end
