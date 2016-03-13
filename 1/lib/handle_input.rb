class HandleInput
  attr_reader :image, :quantity
  def initialize(arg)
    raise ArgumentError.new('incorrect arguments') if(arg.count < 2 )
    @image = arg[0]
    @quantity = arg[1].to_i
    check_format_version
  rescue ArgumentError => msg
    puts msg
    return
  end
  
  def check_format_version
    if (quantity < 2 || quantity > 10)
      raise ArgumentError.new('incorrect number of clasters')
    end
  end
end
