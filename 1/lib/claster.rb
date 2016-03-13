class Claster
  def initialize(medoid, name)
    @medoid = medoid
    @name = name
    @objects = []
  end

  def euqlid_distance_to(object1, object2 = @medoid)
    Math.sqrt(((object2.properties - object1.properties) ** 2).sum)
  end

  def search_better_medoid
    medoid = @medoid
    @medoid = @objects.min do |o1, o2|
      @objects.inject(0) { |sum, obj| sum + euqlid_distance_to(o1, obj) } <=>
      @objects.inject(0) { |sum, obj| sum + euqlid_distance_to(o2, obj) }
    end
    medoid == @medoid
  end

  def clear
    @objects = []
  end

  def set_claster_name_to_objects
    @objects.each do |object|
      object.claster = @name
    end
  end

  def add(object)
    @objects << object
  end
end
