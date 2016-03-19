class Identifyer
  def initialize patterns
    @patterns = patterns
  end

  def test_indification letter
    spoiler = ImageSpoiler.new(letter)
    (1..10).each do |per_cent|
      puts "#{per_cent * 10} % spoil"
      h = HopfieldNetwork.new(@patterns, spoiler.spoil_image(per_cent * 10))
      indentify_image(h.recognize_pattern)
      GUI::wait_key
      GUI::Window.destroy_all
    end
  end

  def indentify_image recognize_pattern
    @patterns.each do |key, vector|
      if vector.matrix.to_a.flatten == recognize_pattern.to_a.flatten
        puts "Is letter #{key}"
        return
      end
    end
    puts "Letter is not indentified"
  end
end