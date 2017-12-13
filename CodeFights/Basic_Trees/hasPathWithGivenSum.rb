#
# Definition for binary tree:
# class Tree
#   attr_accessor :value, :left, :right
#   def initialize(val)
#     @value = val
#     @left = nil
#     @right = nil
# end
def hasPathWithGivenSum(t, s)
    return true if t.nil? && s == 0
    return false if t.nil?

    node_stack = [[t, 0]]

    until node_stack.empty?
        node, sum = node_stack.pop

        if node.left.nil? && node.right.nil?
            return true if sum + node.value == s
        else
            if node.left
                node_stack.push([node.left, sum + node.value])
            end
            if node.right
                node_stack.push([node.right, sum + node.value])
            end
        end
    end
    false
end
