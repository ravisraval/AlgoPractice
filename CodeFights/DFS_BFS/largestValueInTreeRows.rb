## Definition for binary tree:
# class Tree
#   attr_accessor :value, :left, :right
#   def initialize(val)
#     @value = val
#     @left = nil
#     @right = nil
# end
def largestValuesInTreeRows(t)
    res = []
    return res if t.nil?

    node_queue = [[t, 0]]

    until node_queue.empty?
        node, depth = node_queue.shift
        if res[depth].nil? || node.value > res[depth]
            res[depth] = node.value
        end

        node_queue.push([node.left, depth + 1]) if node.left
        node_queue.push([node.right, depth + 1]) if node.right
    end
    res
end
