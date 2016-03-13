class PointImage
  attr_reader :height, :width, :points_image
	def initialize img
    @img = img
    @height = img.size.height
    @width = img.size.width
    @points_image = []
    image_to_points
	end

	def image_to_points
		0.upto(@width - 1) do |x|
			tmp = []
			0.upto(@height - 1) do |y|
        color = get_point_color(x, y)
				tmp[y] = Point.new(x, y, color, @points_image)
			end
			points_image[x] = tmp
		end
	end

  def get_point_color(x, y)
    if @img[y, x].to_a == CvColor::Black.to_a
      CvColor::Black
    else
      CvColor::White
    end
  end	
end
