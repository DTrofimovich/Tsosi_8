
class Image
  attr_accessor :image, :height, :width
  def initialize(image_name)
    image = CvMat.load(image_name, CV_LOAD_IMAGE_COLOR)
    gray_image = image.BGR2GRAY
    @image = gray_image.threshold(0x90, 0xFF, :binary)
    @height = @image.size.height
    @width = @image.size.width
  rescue
    puts 'Could not open or find image'
  end
end
