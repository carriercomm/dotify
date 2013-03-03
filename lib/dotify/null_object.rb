class NullObject
  def method_missing name, *args, &blk
    self
  end

  def tap;      self;   end
  def to_a;     [];     end
  def to_ary;   [];     end
  def to_s;     '';     end
  def to_i;     0;      end
  def to_f;     0.0;    end

  def to_value
    nil # for some conditional values
  end

  def nil?
    true
  end
  alias_method :blank?, :nil?
  alias_method :empty?, :nil?

  def present?
    false
  end
  alias_method :any?, :present?
end