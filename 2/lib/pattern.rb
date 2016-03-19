class Pattern
  attr_reader :matrix, :lenght
  def initialize(image)
    @image = image
    image_to_vector
  end

  def image_to_vector
    vector = []
    0.upto(@image.height - 1) do |y|
      0.upto(@image.width - 1) do |x|
        vector << get_point_color(x, y)
      end
    end
    @lenght = vector.size
    @matrix = Matrix.rows([vector])
  end

  def get_point_color(x, y)
    if @image.image[y, x].to_a == CvColor::Black.to_a
      1
    else
      -1
    end
  end
end