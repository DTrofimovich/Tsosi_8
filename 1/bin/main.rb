require "opencv"
include OpenCV

Dir['../lib/*.rb'].each {|f| require_relative(f)}

args = HandleInput.new(ARGV)
image_name = args.image
quantity = args.quantity

image = Image.new(image_name)
points_image = image.get_point_image
objects = FinderObject.new(points_image).find_object
objects.each { |object| object.calculate_properties }
classifier = Classifier.new(quantity, objects)
classifier.object_classification
objects.each { |object| object.puts_properties }
image.draw(objects)
image.show_image
