# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

def trim_bst(root, l, r)
    filtered_values = []

    #dfs to get nodes within bounds
    queue = [root]
    until queue.empty?
        current_node = queue.shift

        if current_node.val >= l && current_node.val <= r
            filtered_values.push(current_node.val)
        end

        queue.push(current_node.left) if current_node.left
        queue.push(current_node.right) if current_node.right

    end

    filtered_values.sort!
    # make tree with good nodes
    return make_minimal_tree(filtered_values)
end

def make_minimal_tree(arr)
  return if arr.empty?

  node = TreeNode.new(arr[arr.length / 2])

  node.left = make_minimal_tree(arr[0...arr.length / 2])
  node.right = make_minimal_tree(arr[arr.length / 2 + 1..-1])

  node
end


a = TreeNode.new(5)
b = TreeNode.new(3)
c = TreeNode.new(7)
d = TreeNode.new(4)
e = TreeNode.new(6)
a.left = b
b.right = d
a.right = c
c.left = e

p trim_bst(a, 4, 6)
