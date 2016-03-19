class ImageSpoiler
  def initialize(image)
    @image = image
  end

  def spoil_image(per_cent_spoil)
    image_c = @image.image.clone
    lenght = @image.height * @image.width
    random = (0..(lenght - 1)).to_a.sample(lenght * per_cent_spoil / 100)
    random.each do |r|
      if (image_c[r].to_a == CvColor::Black.to_a)
        image_c[r] = CvColor::White
      else
        image_c[r] = CvColor::Black
      end
    end
    window = GUI::Window.new("win")
    window.show(image_c.resize(CvSize.new(320, 320)))
    Pattern.new(Image.new(image_c))
  end
end