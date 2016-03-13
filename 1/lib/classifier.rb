class Classifier
  def initialize(quantity, objects)
    @objects = objects
    @clasters = Array.new(quantity) { |index| Claster.new(@objects[index], index) }
  end

  def object_classification
    while(true) do
      add_object_to_claster
      break if @clasters.inject(true) { |flag, claster| flag && claster.search_better_medoid }
      @clasters.each { |claster| claster.clear }
    end
    @clasters.each do |claster|
      claster.set_claster_name_to_objects
    end
  end

  def add_object_to_claster
    @objects.each do |object|
      clast = @clasters.min do |claster1, claster2|
        claster1.euqlid_distance_to(object) <=> claster2.euqlid_distance_to(object)
      end
      clast.add(object)
    end
  end
end
