class ImageSpoiler
  def initialize(image)
    @image = image
  end

  def spoil_image(per_cent_spoil)
    image_c = @image.clone
    lenght = image_c.height * image_c.width
    random = (0..lenght - 1).to_a.sample(lenght * per_cent_spoil / 100)
    random.each do |r|
      if (image_c.image[r].to_a == CvColor::Black.to_a)
        image_c.image[r] = CvColor::White
      else
        image_c.image[r] = CvColor::Black
      end
    end
    window = GUI::Window.new("win")
    window.show(image_c.image.resize(CvSize.new(320, 320)))
    Pattern.new(image_c)
  end
end