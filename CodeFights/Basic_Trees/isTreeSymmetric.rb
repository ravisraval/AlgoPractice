#
# Definition for binary tree:
# class Tree
#   attr_accessor :value, :left, :right
#   def initialize(val)
#     @value = val
#     @left = nil
#     @right = nil
# end
def isTreeSymmetric(t)
    return true if t.nil?
    return sym?(t.left, t.right)
end

def sym?(left, right)
    return true if left.nil? && right.nil?
    return false if left.nil? || right.nil? || left.value != right.value
    return sym?(left.left, right.right) && sym?(left.right, right.left)
end
