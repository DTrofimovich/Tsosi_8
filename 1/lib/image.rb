class Image
  def initialize(image)
    @image = CvMat.load(image, CV_LOAD_IMAGE_COLOR)
    @colors = [CvColor::Red, CvColor::Yellow, ]
  rescue
    puts 'Could not open or find the image.'
    return
  end

  def get_point_image
    gray_image = @image.BGR2GRAY
    binary_image = gray_image.threshold(0x90, 0xFF, :binary)
    @points_image = PointImage.new(binary_image)
  end

  def draw(objects)
    objects.each do |object|
      object.points.each do |point|
        x = point.x
        y = point.y
        @image[y, x] = @colors[object.claster]
      end
    end
  end

  def show_image
    window = GUI::Window.new("win")
    window.show(@image)
    GUI::wait_key
  end
end