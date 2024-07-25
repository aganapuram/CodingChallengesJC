class Token
  attr_accessor :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end

  def valid?
    cl = @value.class
    return true if cl == String || cl == Integer || cl == NilClass || cl == Boolean || cl == Float || cl == Hash || cl == Array
    false
  end
end
