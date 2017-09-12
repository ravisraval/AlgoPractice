class BinaryTreeNode

  attr_accessor :value, :left, :right, :parent

  def initialize(value, left = nil, right = nil)
    @value = value
    @left  = left
    @right = right
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
    @left.parent = self
    return @left
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
    @right.parent = self
    return @right
  end

end
