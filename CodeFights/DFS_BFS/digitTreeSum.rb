#
# Definition for binary tree:
# class Tree
#   attr_accessor :value, :left, :right
#   def initialize(val)
#     @value = val
#     @left = nil
#     @right = nil
# end
def digitTreeSum(t)
    res = 0
    return res if t.nil?
    digits = ''

    node_stack = [[t, digits]]

    until node_stack.empty?
        node, digits = node_stack.pop
        res += ("#{digits}#{node.value.to_s}").to_i if node.left.nil? && node.right.nil?

        node_stack.push([node.left, "#{digits}#{node.value.to_s}"]) if node.left
        node_stack.push([node.right, "#{digits}#{node.value.to_s}"]) if node.right
    end
    res
end
