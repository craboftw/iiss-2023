module MoveTracking
  def initialize(*args)
    @movees = Set.new
    super
  end

  def get_movees
    result = @movees
    @movees = Set.new
    return result
  end

  def self.move(*method_names)
    method_names.each do |method_name|
      define_method("#{method_name}_with_tracking") do |*args, &block|
        result = send("#{method_name}_without_tracking", *args, &block)
        @movees.add(self)
        result
      end

      alias_method "#{method_name}_without_tracking", method_name
      alias_method method_name, "#{method_name}_with_tracking"
    end
  end
end

class Line
  attr_accessor :p1, :p2

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
  end

  def set_p1(p1)
    @p1 = p1
  end

  def set_p2(p2)
    @p2 = p2
  end
end

class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def set_x(x)
    @x = x
  end

  def set_y(y)
    @y = y
  end
end


