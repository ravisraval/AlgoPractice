class Node

  attr_accessor :visited, :value, :children

  def initialize(value)
    @value = value
    @children = []
  end

end
