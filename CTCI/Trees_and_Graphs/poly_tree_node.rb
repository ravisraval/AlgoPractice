class Node

  attr_accessor :visited, :value
  attr_reader :children

  def initialize(value)
    @value = value
    @children = []
  end

end
