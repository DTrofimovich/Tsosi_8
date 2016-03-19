
class Image
  attr_accessor :image, :height, :width
  def initialize(image_name)
    if image_name.class == String
      image = CvMat.load(image_name, CV_LOAD_IMAGE_COLOR)
      gray_image = image.BGR2GRAY
      @image = gray_image.threshold(0x90, 0xFF, :binary)
    else
      @image = image_name
    end
    @height = @image.size.height
    @width = @image.size.width
  rescue
    puts 'Could not open or find image'
  end
end
