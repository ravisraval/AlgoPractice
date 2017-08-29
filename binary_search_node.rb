class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left  = left
    @right = right
  end

  def insert_left(value)
      @left = BinaryTreeNode.new(value)
      return @left
  end

  def insert_right(value)
      @right = BinaryTreeNode.new(value)
      return @right
  end
end
