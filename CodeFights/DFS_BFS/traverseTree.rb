# Definition for binary tree:
# class Tree
#   attr_accessor :value, :left, :right
#   def initialize(val)
#     @value = val
#     @left = nil
#     @right = nil
# end
def traverseTree(t)
    res = []

    return res if t.nil?

    node_queue = [t]

    until node_queue.empty?
        node = node_queue.shift
        res.push(node.value)

        node_queue.push(node.left) if node.left
        node_queue.push(node.right) if node.right
    end
    res
end
